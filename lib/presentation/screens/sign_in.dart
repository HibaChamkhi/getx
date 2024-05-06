import 'package:getx_project/presentation/screens/reset_password.dart';
import 'package:getx_project/presentation/screens/sign_up.dart';
import 'package:getx_project/presentation/screens/user_details_screen.dart';

import '../../domain/models/user.dart';
import '../controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For using GetX state management

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserController controller;
  final userIdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    Get.put<UserController>(UserController(), permanent: true);
    controller = Get.find<UserController>(); // Change to Get.find
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
        child: ElevatedButton(
          onPressed: () {
            // Perform SignIn action here
            String email = emailController.text;
            String password = passwordController.text;
            // Call SignIn method from controller passing email and password
            controller.signInUser(email, password);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
            );
          },
          child: Text('Sign In'),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 100.0, left: 16, right: 16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ResetPassword()),
                              );
                            },
                            child: const Text(
                              "Forget Password",
                              style: TextStyle(fontSize: 16,color: Colors.blue),
                            )),
                      ],
                    ),
                    SizedBox(height: 120),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "I don't have account ",
                          style: TextStyle(fontSize: 15),
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignUp()),
                              );
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(fontSize: 16,color: Colors.blue),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
