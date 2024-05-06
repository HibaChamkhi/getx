import 'package:getx_project/domain/models/user.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class UserRepository {
  Future<Result<Exception, List<UserModel>>> getUsers();
  Future<Result<Exception, UserModel>> getOneUser(int id);
  Future<Result<Exception, void>> signUpUser(String email, String password);
  Future<Result<Exception, void>> signInUser(String email, String password);
  Future<Result<Exception, void>> updatePassword(String password) ;
  Future<Result<Exception, void>> resetPassword(String email) ;
  Future<Result<Exception, void>> logOut() ;
  Future<Result<Exception, void>> createPost(String title) ;
  // Future<Result<Exception, User>> getUserById(int id);
  // Future<void> postUser(int userId,String title);
  // Future<void> deleteUser(int id);
  // Future<void> editUser(int id,int userId,String title);
}

