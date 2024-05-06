import 'package:getx_project/presentation/screens/reset_password.dart';
import 'package:getx_project/presentation/screens/sign_up.dart';
import 'package:getx_project/presentation/screens/user_details_screen.dart';

import '../../domain/models/user.dart';
import '../controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For using GetX state management

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late UserController controller;
  final titleController = TextEditingController();


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
            // Perform CreatePost action here
            String title = titleController.text;
            // Call CreatePost method from controller passing email and password
            controller.createPost(title);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
            );
          },
          child: Text('Create post'),
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
                      "Create post",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
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
