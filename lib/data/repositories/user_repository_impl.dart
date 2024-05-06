import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../core/config/injection/base_api_repository.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../dataSources/remote/supabase_data_source.dart';
import '../dataSources/remote/user_data_source.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends BaseApiRepository implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<Result<Exception, UserModel>> getOneUser(int id) async {
    try {
      var result = await _userDataSource.getOneUser(id);
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  @override
  Future<Result<Exception, List<UserModel>>> getUsers() async {
    try {
      var result = await _userDataSource.getUsers();
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  @override
  Future<Result<Exception, void>> signUpUser(String email, String password)async {
    try {
      var result = await _userDataSource.signUpUser(email, password);
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  @override
  Future<Result<Exception, void>> signInUser(String email, String password)async {
    try {
      var result = await _userDataSource.signInUser(email, password);
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  @override
  Future<Result<Exception, void>> resetPassword(String email) async {
    try {
      var result = await _userDataSource.resetPassword(email);
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  @override
  Future<Result<Exception, void>> updatePassword(String password) async {
    try {
      var result = await _userDataSource.updatePassword(password);
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  @override
  Future<Result<Exception, void>> logOut() async {
    try {
      var result = await _userDataSource.logOut();
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }
  @override
  Future<Result<Exception, void>> createPost(String title) async {
    try {
      var result = await _userDataSource.createPost(title);
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  // @override
  // Future<void> postUser(int userId,String title) {
  //   return _userDataSource.postUser(userId,title);
  // }
  // @override
  // Future<void> deleteUser(int id) {
  //   return _userDataSource.deleteUser(id);
  // }
  // @override
  // Future<void> editUser(int id,int userId,String title) {
  //   return _userDataSource.editUser( id,userId,title);
  // }
}
