import 'package:injectable/injectable.dart';

import '../../core/config/injection/base_api_repository.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../dataSources/remote/user_data_source.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends BaseApiRepository implements UserRepository {
  final UserDataSource _userDataSource;
  UserRepositoryImpl(this._userDataSource);

  @override
  Future<User> getUserById(int id) {
    // You may need to adjust this implementation based on your requirements
    return _userDataSource.getUserById(id);
  }
}
