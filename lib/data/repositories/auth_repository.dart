import 'package:dictionary/data/datasources/auth_remote_datasource.dart';
import 'package:dictionary/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final AuthRemoteDataSource _dataSource = AuthRemoteDataSource();

  Future<void> closeSession() async {
    try {
      return _dataSource.signOut();
    } catch (e) {
      throw Exception('Failed to user session: $e');
    }
  }

  Future<String?> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      var user = ((await _dataSource.signInWithEmailAndPassword(
              email: email, password: password))
          .user
          ?.email);

      return user == null ? 'Failed to log in user' : null;
    } on AuthException catch (e) {
      logger.e('Failed to log in user: $e');
      return e.message;
    }
  }

  Future<String?> createNewUser({
    required String email,
    required String password,
  }) async {
    try {
      var user = ((await _dataSource.signUp(email: email, password: password))
          .user
          ?.email);

      return user == null ? 'Failed to create user' : null;
    } on AuthException catch (e) {
      logger.e('Failed to create new user: $e');
      return e.message;
    }
  }
}
