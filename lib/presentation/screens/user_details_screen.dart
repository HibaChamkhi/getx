
import '../controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For using GetX state management

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    // Get.changeTheme(ThemeData.dark());
    // Initialize & inject UserController() using Get.put()
    Get.put<UserController>(UserController(), permanent: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = UserController.call;
    final userIdController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(labelText: 'Enter User ID'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final userId = int.tryParse(userIdController.text);
                if (userId != null) {
                  controller.fetchUser(userId);
                } else {
                  // Handle invalid input
                  Get.snackbar('Invalid Input', 'Please enter a valid User ID',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Fetch User'),
            ),
            SizedBox(height: 16.0),
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else if (controller.user.value.id == 0) {
                return Text('User details will appear here');
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User ID: ${controller.user.value.id}'),
                    Text('Name: ${controller.user.value.title}'),
                    // Add more user details as needed
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
