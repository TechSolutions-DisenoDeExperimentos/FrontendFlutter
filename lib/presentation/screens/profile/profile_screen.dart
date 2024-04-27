import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [SizedBox(
            width: 120, height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100), child: Image.network('https://images.pexels.com/photos/19110740/pexels-photo-19110740/free-photo-of-ciudad-puesta-de-sol-moda-hombre.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))
          ),
          const SizedBox(height: 10),
          Text('data'),
          Text('data'),
          const SizedBox(height: 20),
          SizedBox(
            width:200,
            child: ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber.shade50, side: BorderSide.none, shape: const StadiumBorder()),
              child: const Text('Edit', style: TextStyle(color: Colors.amber)),
                )),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),
          ],),
        ),

      ),
    );
  }
}