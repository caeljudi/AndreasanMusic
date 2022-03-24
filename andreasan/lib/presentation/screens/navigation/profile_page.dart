import 'package:andreasan/design_system/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andreasan/presentation/widgets/ppickimg_controller.dart';

import '../../../services/authentication_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
  User? user = FirebaseAuth.instance.currentUser;
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PickimgController());

  // final rng = new random();
    return SingleChildScrollView( 
    child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
              // child: Image(
              //   image: AssetImage("assets/profil.png"))
              // ),
              child: Obx(() => controller.image.value != null ? Image.file(controller.image.value!) : Image.network(controller.imageUrl),)),
          const SizedBox(height: 50.0,),
          MaterialButton(
                  onPressed: () {
                    controller.onOpenGallery();
                    controller.uploadImage();
                  },
                  elevation: 5,
                  color: const Color(0xff7177A1),
                  child: const Text("Selectionner une image")),
                  
          Column(
            children: const [
            ],
          ),
          const SizedBox(height: 50.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  '$email',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w100,),
              ),
            ],
          ),
          const SizedBox(height: 50.0,),
          Column(
            children: [
              const Text('Crée le : ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                creationTime.toString(),
                style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300,),
              )
            ],
          ),
          const SizedBox(height: 50.0,),
                    Column(
            children: [
              const Text('Nombres d"abonnées : ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                "",
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300,),
              )
            ],
          ),
          const SizedBox(height: 50.0,),
          Row(
            children: const [ Text('Playlist :          ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0,),

              Text('Musique :           ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
 
              const SizedBox(height: 10.0,),

              Text('Topics : ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 50.0,),

          Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthenticationService>().signout();
        },
        child: const Text("Sign out"),
              ),
          ),
        ],
      ),
    )
    
    
    
,);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
