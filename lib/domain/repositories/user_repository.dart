import 'package:getx_project/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getUserById(int id);
}

