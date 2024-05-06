import 'package:getx_project/presentation/screens/sign_up.dart';

import '../../domain/models/user.dart';
import '../controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For using GetX state management

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
            // Perform ResetPassword action here
            String email = emailController.text;
            // Call ResetPassword method from controller passing email and password
            controller.resetPassword(email);
          },
          child: Text('send email'),
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
                      "Forget Password",
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
