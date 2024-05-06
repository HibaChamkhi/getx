import 'package:getx_project/presentation/screens/sign_in.dart';
import '../../domain/models/user.dart';
import '../controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'create_post.dart'; // For using GetX state management

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late UserController controller;
  final userIdController = TextEditingController();

  @override
  void initState() {
    Get.put<UserController>(UserController(), permanent: true);
    controller = Get.find<UserController>(); // Change to Get.find
    controller.fetchUsers();
    super.initState();
  }

  Future<void> _refreshData() async {
    await controller.fetchUsers();
    controller.user.value = null;// Refresh the user data
    userIdController.text = "";// Refresh the user data
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
    onRefresh: _refreshData,
      child:  Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(top: 100.0, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 5,),
                    InkWell(
                       onTap: (){
                         controller.logOut();
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const SignIn()),
                         );
                       },
                        child: Text("logOut")
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          const Text('Get one Or all Posts '),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width:350,
                                child: TextField(
                                  controller: userIdController,
                                  decoration:
                                  const InputDecoration(labelText: 'Enter Post ID'),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const CreatePost()),
                                  );

                                },
                                  child: Container(
                                    height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(8)),
                                      child: const Icon(Icons.plus_one,color: Colors.white,))
                              )
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              final userId = int.tryParse(userIdController.text);
                              if (userId != null) {
                                controller.fetchUser(userId);
                              }
                            },
                            child: const Text('Fetch One User'),
                          ),
                          const SizedBox(height: 16.0),
                          Obx(() {
                            if (controller.fetchUserLoading.value) {
                              return const CircularProgressIndicator();
                            } else {
                              final List<UserModel> users =
                                  controller.users.value;
                              final UserModel? user = controller.user.value;
                              if (controller.user.value == null) {
                                if (users.isEmpty) {
                                  return const Text('No users available');
                                } else {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: users.map((user) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('User ID: ${user.id}'),
                                          Text('Name: ${user.title}'),
                                          SizedBox(height: 16.0),
                                        ],
                                      );
                                    }).toList(),
                                  );
                                }
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('User ID: ${user?.id}'),
                                    Text('Name: ${user?.title}'),
                                    const SizedBox(height: 16.0),
                                  ],
                                );
                              }
                            }
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   child: Column(
            //     children: [
            //       const Text('Get Post'),
            //       TextField(
            //         controller: userIdController,
            //         decoration:
            //             const InputDecoration(labelText: 'Enter Post ID'),
            //         keyboardType: TextInputType.number,
            //       ),
            //       SizedBox(height: 16.0),
            //       ElevatedButton(
            //         onPressed: () {
            //           final userId = int.tryParse(userIdController.text);
            //           if (userId != null) {
            //             controller.fetchUser(userId);
            //           } else {
            //             // Handle invalid input
            //             Get.snackbar(
            //                 'Invalid Input', 'Please enter a valid User ID',
            //                 snackPosition: SnackPosition.BOTTOM);
            //           }
            //         },
            //         child: Text('Fetch User'),
            //       ),
            //       const SizedBox(height: 16.0),
            //       Obx(() {
            //         if (controller.fetchUserLoading.value) {
            //           return CircularProgressIndicator();
            //         } else
            //           if (controller.user.value.id == 0) {
            //           return Text('User details will appear here');
            //         } else {
            //           return Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('User ID: ${controller.user.value.id}'),
            //               Text('Name: ${controller.user.value.title}'),
            //               // Add more user details as needed
            //             ],
            //           );
            //         }
            //       }
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   child: Column(
            //     children: [
            //       const Text('Add Post'),
            //       TextField(
            //         controller: titleController,
            //         decoration:
            //             const InputDecoration(labelText: 'Enter Post Title'),
            //       ),
            //       SizedBox(height: 16.0),
            //       ElevatedButton(
            //         onPressed: () {
            //           final title = titleController.text;
            //           if (title != null) {
            //             controller.addUser(title);
            //           }else {
            //             Get.snackbar('Invalid Input', 'Please enter a valid User ID', snackPosition: SnackPosition.BOTTOM);
            //           }
            //         },
            //         child: Text('Add Post'),
            //       ),
            //       const SizedBox(height: 16.0),
            //       Obx(() {
            //         if (controller.addUserLoading.value) {
            //           return const CircularProgressIndicator();
            //         }  else {
            //           return  Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(controller.successMessage.value),
            //               // Add more user details as needed
            //             ],
            //           );
            //         }
            //
            //
            //       }),
            //     ],
            //   ),
            // )

q