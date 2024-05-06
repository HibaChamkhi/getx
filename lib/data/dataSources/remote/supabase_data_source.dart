import 'dart:async';
import 'package:injectable/injectable.dart';
import '../../../domain/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart';

abstract class UserDataSource {
  UserDataSource(Dio dio);

  Future<List<UserModel>> getUsers();

  Future<UserModel> getOneUser(int id);

  Future<void> signUpUser(String email, String password);

  Future<void> signInUser(String email, String password);

  Future<void> resetPassword(String email);

  Future<void> updatePassword(String password);

  Future<void> logOut();
  Future<void> createPost(String title);
}

@Injectable(as: UserDataSource)
class RemoteDataSourceImpl implements UserDataSource {
  RemoteDataSourceImpl();

  final supabase = Supabase.instance.client;

  // Create a new post
  Future<void> createPost(String title) async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final response = await supabase.from('posts').insert({'user_id': user.id, 'title': title});
      print(user);
      // if (response.error != null) {
      //   // Handle error
      //   print('Error creating post: ${response.error!.message}');
      // } else {
      //   print('else Error creating post: ${response.error!.message}');
      //   // fetchPosts(); // Refresh the list of posts after creating a new one
      // }
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    // Fetch user data from Supabase
    List<Map<String, dynamic>> response =
        await supabase.from('posts').select('*');
    // Parse the response data into UserModel objects
    List<UserModel> users =
        response.map((userData) => UserModel.fromJson(userData)).toList();
    // Print the fetched users (optional)
    print("Fetched users: $users");
    // Return the list of UserModel objects
    return users;
  }

  @override
  Future<UserModel> getOneUser(int id) async {
    // Fetch user data from Supabase
    List<Map<String, dynamic>> response =
        await supabase.from('posts').select().eq('id', id);
    // Check if any users were found
    if (response.isEmpty) {
      throw Exception('User not found');
    }
    // Parse the response data into UserModel object
    final userMap = response[0];
    final user = UserModel.fromJson(userMap);
    // Print the fetched user (optional)
    print("Fetched user: $user");
    // Return the UserModel object
    return user;
  }

  @override
  Future<void> editOneUser(UserModel newUser) async {
    List<Map<String, dynamic>> response = await supabase
        .from('posts')
        .update({'title': newUser.title}).eq('id', newUser.id);
    // Check if any users were found
    if (response.isEmpty) {
      throw Exception('User not found');
    }
    // Parse the response data into UserModel object
    final userMap = response[0];
    final updatedUser = UserModel.fromJson(userMap);
    // Print the fetched user (optional)
    print("Fetched user: $updatedUser");
    // Return the UserModel object
  }

  @override
  Future<void> deleteOneUser(String id) async {
    List<Map<String, dynamic>> response =
        await supabase.from('posts').delete().eq('id', id);
    // Check if any users were found
    if (response.isEmpty) {
      throw Exception('User not found $response');
    }
    // Parse the response data into UserModel object
    final userMap = response[0];
    final updatedUser = UserModel.fromJson(userMap);
    // Print the fetched user (optional)
    print("Fetched user: $updatedUser");
    // Return the UserModel object
  }

  @override
  Future<void> signUpUser(String email, String password) async {

    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    final Session? session = res.session;
    final User? user = res.user;
    print(" print(signInUser $res)");
    print("signInUser $user");
    print("session $session");
  }

  @override
  Future<void> signInUser(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    if (user == null) {
      print('Error signing in');
    } else {
      // Token obtained successfully
      final token = session?.accessToken;
      print('Token: $token');
      GetStorage().write('token', token);
      print('tokenValue: ${GetStorage().read('token')}');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    // var response = await supabase.auth.resetPasswordForEmail(email);
    // @override
    // Future<void> resetPassword(String email) async {
    //
      try {
        print(email);
        await supabase.auth.resetPasswordForEmail(
          email,
          redirectTo: "http://example.com/account/update-password",
        );      // print("resetPassword $res");

      }  catch (error) {
        print("AuthException $error");
        // } catch (error) {
        //   print("error $error");
      }

    // try {
    //   final ResendResponse res = await supabase.auth.resend(
    //     type: OtpType.email,
    //     email: email,
    //   );
    //   //   final response = await supabase.auth.updateUser(
    // //     UserAttributes(
    // //       password: _password.text,
    // //     ),
    // //   );
    // } on AuthException catch (error) {
    //   print("AuthException $error");
    // // } catch (error) {
    // //   print("error $error");
    // }
  }

  @override
  Future<void> updatePassword(String password) async {
    var userAttributes = UserAttributes(password: password);
    var response = await supabase.auth.updateUser(userAttributes);
    print("updatePassword");
  }

  @override
  Future<void> logOut() async {
   await supabase.auth.signOut() ;
  }
}
