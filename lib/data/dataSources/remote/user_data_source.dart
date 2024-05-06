// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:json_annotation/json_annotation.dart';
// //
// import '../../../domain/models/user.dart';
//
// part 'user_data_source.g.dart';
//
// @RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
// abstract class UserDataSource {
//   factory UserDataSource(Dio dio) = _UserDataSource;
//
//   @GET('/posts/{id}')
//   Future<User> getUserById(@Path() int id);
//
//   @POST('/posts')
//   Future<void> postUser(@Path() int userId,String title);
//
//   @DELETE('/posts/{id}')
//   Future<void> deleteUser(@Path() int id);
//
//   @PATCH('/posts/{id}')
//   Future<void> editUser(@Path() int id,int userId,String title);
// }
