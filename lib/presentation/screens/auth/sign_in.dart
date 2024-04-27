import 'package:tu_cine_app/api_tucine/infrastructure/datasources/user_tucine_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/cineclub_response.dart';
import 'package:tu_cine_app/presentation/screens/auth/app_bar_tucine.dart';
import 'package:tu_cine_app/presentation/screens/auth/log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //String? _gender = 'Masculino';
  //String? _typeUser = 'Cinefilo';
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dniController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;
  bool termsValue = false;
  List<String> genders = ['Masculino', 'Femenino', 'Otro'];
  String selectedGender = 'Masculino';
  List<String> typeUsers = ['Cinéfilo', 'Cineclub'];
  String selectedTypeUSer = 'Cinéfilo';

  // Methods
  Future<bool> signUpRequest() async {
    final UserTuCineDataSource api;
    api = UserTuCineDataSource();
    final userRequest = await api.createUser(UserPost(
      _firstNameController.text,
      _lastNameController.text,
      _emailController.text,
      _phoneController.text,
      _dniController.text,
      _passwordController.text,
      _birthdayController.text,
      transformGender(),
      transformTypeUser(),
    ));
    if (userRequest == false) {
      // Scaffold Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Alguno de los valores ingresados es incorrecto'),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TuCineAppBar().getAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16.0),
                  const Text(
                    'Crear Cuenta',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tienes una cuenta?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Iniciar Sesión',
                            style: TextStyle(color: Colors.orangeAccent)),
                      ),
                    ],
                  ),
                  Column(children: [
                    TextField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombres',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Apellidos',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Correo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _dniController,
                      decoration: const InputDecoration(
                        labelText: 'DNI',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Contraseña',
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                      ),
                      obscureText: hidePassword,
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _birthdayController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Fecha de Nacimiento',
                        hintText: 'AAAA/MM/DD',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());

                        date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );

                        if (date != null) {
                          _birthdayController.text = transformDate(date);
                        }
                      },
                    ),
                    const SizedBox(height: 12.0),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       'Género',
                    //       style: TextStyle(fontSize: 20.0),
                    //     ),
                    //     Row(
                    //       children: [
                    //         Expanded(
                    //           child: Column(
                    //             children: [
                    //               Radio<String>(
                    //                 value: 'MALE',
                    //                 groupValue: _gender,
                    //                 onChanged: (String? value) {
                    //                   setState(() {
                    //                     _gender = value;
                    //                   });
                    //                 },
                    //               ),
                    //               const Text(
                    //                 'Masculino',
                    //                 style: TextStyle(fontSize: 15.0),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Expanded(
                    //           child: Column(
                    //             children: [
                    //               Radio<String>(
                    //                 value: 'Femenino',
                    //                 groupValue: _gender,
                    //                 onChanged: (String? value) {
                    //                   setState(() {
                    //                     _gender = value;
                    //                   });
                    //                 },
                    //               ),
                    //               const Text(
                    //                 'Femenino',
                    //                 style: TextStyle(fontSize: 15.0),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Expanded(
                    //           child: Column(
                    //             children: [
                    //               Radio<String>(
                    //                 value: 'OTHER',
                    //                 groupValue: _gender,
                    //                 onChanged: (String? value) {
                    //                   setState(() {
                    //                     _gender = value;
                    //                   });
                    //                 },
                    //               ),
                    //               const Text(
                    //                 'Otro',
                    //                 style: TextStyle(fontSize: 15.0),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 12.0),
                    TextField(
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height /
                                  3,
                              child: CupertinoPicker(
                                itemExtent: 32.0,
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    selectedGender = genders[index];
                                  });
                                },
                                children: genders
                                    .map((gender) => Text(gender))
                                    .toList(),
                              ),
                            );
                          },
                        );
                      },
                      controller: TextEditingController(text: selectedGender),
                      decoration: const InputDecoration(
                        labelText: 'Género',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height /
                                  3,
                              child: CupertinoPicker(
                                itemExtent: 32.0,
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    selectedTypeUSer = typeUsers[index];
                                  });
                                },
                                children: typeUsers
                                    .map((gender) => Text(gender))
                                    .toList(),
                              ),
                            );
                          },
                        );
                      },
                      controller: TextEditingController(text: selectedTypeUSer),
                      decoration: const InputDecoration(
                        labelText: 'Tipo de Usuario',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       'Tipo de Usuario',
                    //       style: TextStyle(fontSize: 20.0),
                    //     ),
                    //     Row(
                    //       children: [
                    //         Expanded(
                    //           child: ListTile(
                    //             title: const Text(
                    //               'Cinéfilo',
                    //               style: TextStyle(fontSize: 15.0),
                    //             ),
                    //             leading: Radio<String>(
                    //               value: 'CINEPHILE',
                    //               groupValue: _typeUser,
                    //               onChanged: (String? value) {
                    //                 setState(() {
                    //                   _typeUser = value;
                    //                 });
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //         Expanded(
                    //           child: ListTile(
                    //             title: const Text(
                    //               'Cineclub',
                    //               style: TextStyle(fontSize: 15.0),
                    //             ),
                    //             leading: Radio<String>(
                    //               value: 'BUSINESS',
                    //               groupValue: _typeUser,
                    //               onChanged: (String? value) {
                    //                 setState(() {
                    //                   _typeUser = value;
                    //                 });
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: termsValue,
                          onChanged: (value) {
                            setState(() {
                              termsValue = value!;
                            });
                          },
                        ),
                        const Text(
                          'Acepto los',
                          style: TextStyle(fontSize: 11.0),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Términos de servicio y Políticas de privacidad'),
                                  content: const SingleChildScrollView(
                                    child: Text('Bienvenido a Tucine, la aplicación líder en reservas de boletos para el cine en Perú. Antes de comenzar a utilizar nuestros servicios, te pedimos que leas detenidamente estos términos y condiciones. Al acceder y utilizar la aplicación, aceptas estar sujeto a los siguientes términos:\n\n1. Aceptación de Términos:\nAl utilizar la aplicación Tucine, reconoces haber leído y aceptado estos términos y condiciones en su totalidad. Si no estás de acuerdo con alguno de los términos, por favor, abstente de utilizar la aplicación.\n\n2. Registro de Cuenta:\nPara realizar reservas de boletos, debes crear una cuenta en Tucine. Eres responsable de mantener la confidencialidad de tu información de inicio de sesión y asumes la responsabilidad de todas las actividades que ocurran bajo tu cuenta.\n\n3. Reservas y Pagos:\nLa aplicación te permite reservar boletos para funciones de cine. Las políticas de cancelación y los cargos adicionales se especifican durante el proceso de reserva. Los pagos se realizarán mediante métodos seguros aceptados por Tucine.\n\n4. Política de Privacidad:\nTucine respeta tu privacidad. Nuestra Política de Privacidad describe cómo recopilamos, usamos y almacenamos tu información personal. Al utilizar la aplicación, aceptas las prácticas descritas en nuestra Política de Privacidad.\n\n5. Derechos de Propiedad Intelectual:\nTodo el contenido presente en Tucine, incluyendo logotipos, imágenes y textos, está protegido por derechos de propiedad intelectual. No se permite la reproducción o distribución no autorizada de dicho contenido.\n\n6. Responsabilidades del Usuario:\nTe comprometes a utilizar la aplicación de manera responsable y respetuosa. Queda prohibido realizar actividades ilegales, compartir contenido inapropiado o infringir los derechos de otros usuarios.\n\n7. Limitación de Responsabilidad:\nTucine no se hace responsable de interrupciones del servicio, problemas técnicos, pérdida de datos o cualquier otro inconveniente que pueda surgir durante el uso de la aplicación.\n\n8. Cambios en los Términos:\nTucine se reserva el derecho de modificar estos términos y condiciones en cualquier momento. Los cambios se notificarán a los usuarios a través de la aplicación. El uso continuado de la aplicación después de dichas modificaciones constituye la aceptación de los nuevos términos.\n\n9. Ley Aplicable:\nEstos términos y condiciones se rigen por las leyes de la República del Perú. Cualquier disputa se resolverá en los tribunales competentes de la misma jurisdicción.\n\n10. Contacto:\nPara preguntas, problemas técnicos o disputas legales, contáctanos a través de nuestro servicio de atención al cliente en [correo electrónico] o [número de teléfono].\n\n¡Gracias por utilizar Tucine y disfrutar de la magia del cine!',
                                    textAlign: TextAlign.justify,),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Cerrar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                              'Términos de servicio y Políticas de privacidad',
                              style: TextStyle(color: Colors.orangeAccent, fontSize: 11.0)
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(300, 50),
                      ),
                      onPressed: termsValue ? () async {
                        if (await signUpRequest()) {
                          // Muestra un AlertDialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Registro exitoso!'),
                                content: const Text('Has sido registrado exitosamente.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      // Navega a la página de inicio de sesión
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LoginPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } : null,
                      child: const Text('Crear Cuenta',
                          style: TextStyle(fontSize: 16.0)),
                    ),
                    const SizedBox(height: 12.0),
                    const Divider(
                      height: 20,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(height: 12.0),
                    //   Buttons for Gmail and Facebook with
                    //   their respective icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Icon(Icons.g_mobiledata),
                        ),
                        const SizedBox(width: 12.0),
                        //   Make a Circular Button without text
                        //   and with a Facebook icon
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Icon(Icons.facebook),
                        ),
                      ],
                    ),
                  ])
                ],
              ),
            ),
          ),
        ));
  }

  String transformDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String transformGender() {
    if (selectedGender == "Masculino") return "MALE";
    if (selectedGender == "Femenino") return "FEMALE";
    return "OTHER";
  }

  String transformTypeUser() {
    if (selectedTypeUSer == "Cinéfilo") return "CINEPHILE";
    return "BUSINESS";
  }
}
