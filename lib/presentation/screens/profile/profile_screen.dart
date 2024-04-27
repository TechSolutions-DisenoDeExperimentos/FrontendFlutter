import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProfileScreen extends ConsumerStatefulWidget {

  static const name = 'profile-screen';


  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {

 @override
  void initState() {
    super.initState();
    //ref.read(userInfoProvider.notifier).getUser(widget.userId);
    //context.read(userProvider.notifier).getUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    //final String userId = ModalRoute.of(context)!.settings.arguments as String;
    //final User? user = ref.watch(userInfoProvider)[userId];

    /*if (user == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        ),
      );
    }*/
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [SizedBox(
            width: 120, height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100), 
              child: Image.network(
                //user.imageSrc ?? 
                'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('user.firstName', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('user.lastName', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('user.email', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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