import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/authentication_service.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    bool isObscur = true;

  // TO DO : Design de cette page qui est relativement dégueulasse pour l'instant xd //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.center,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ), 
                    const Text( 
                      "ANDREASAN",
                      style: TextStyle(
                      fontSize: 30.0,
                      height: 2.0,
                      
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Entrez une adresse e-mail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fillColor: const Color(0xffd1ebfb),
                          filled: true,
                        )),
                        const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        obscureText: (isObscur),
                        decoration: InputDecoration(
                          hintText: 'Entrez votre mot de passe',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fillColor: const Color(0xffd1ebfb),
                          filled: true,
                          // suffixIcon: IconButton(
                          //   icon: isObscur
                          //       ? const Icon(Icons.visibility_off)
                          //       : const Icon(Icons.visibility),
                          //   onPressed: () {
                          //     setState(() {
                          //       isObscur = !isObscur;
                          //     });
                          //   },
                          // ),
                        )),
                  const SizedBox(height: 30),
                    Center(
                        child: SizedBox(
                      width: 200,
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signin(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
              },
              child: const Text("Connexion"),
            )
                    )),
                  const SizedBox(height: 18),
                    Center(
                        child: Container(
                      width: 200,
                      child: TextButton(
                          onPressed: () {
                            // Navigator.of(context).pushNamed(Routes.signIn);
                          },
                          child: const Text(
                            "Inscription",
                            style: TextStyle(color: Color(0xffFEBD72)),
                          )),
                    )),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, Routes.forget);
                        },
                        child: const Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            color: Color(0xffFEBD72),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Center(
                    //   child: SizedBox(
                    //     width: 250,
                    //     child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           primary: Colors.white, onPrimary: Colors.black),
                    //       onPressed: () {
                    //         // Keys.navKey.currentState.pushNamed(Routes.webview);
                    //       },
                    //       child: Wrap(
                    //         crossAxisAlignment: WrapCrossAlignment.center,
                    //         children: [
                    //           const Image(
                    //             image: AssetImage("assets/google.png"),
                    //             width: 20,
                    //             height: 20,
                    //           ),
                    //           SizedBox(width: 10),
                    //           Text("Continuer avec Google"),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ]

          // [
          //   // TO DO : Créer un widget AppTextField réutilisable et beau stp hihi //
          //   TextField(
          //     controller: emailController,
          //     decoration: const InputDecoration(
          //       labelText: "Email",
          //     ),
          //   ),
          //   TextField(
          //     controller: passwordController,
          //     decoration: const InputDecoration(
          //       labelText: "Password",
          //     ),
          //   ),
          //   ElevatedButton(
          //     onPressed: () {
          //       context.read<AuthenticationService>().signin(
          //             email: emailController.text.trim(),
          //             password: passwordController.text.trim(),
          //           );
          //     },
          //     child: const Text("Sign in"),
          //   )
          // ],
          )
        ),),),),);
  }
}
