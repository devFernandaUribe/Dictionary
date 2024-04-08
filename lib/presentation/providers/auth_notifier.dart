// ignore_for_file: use_build_context_synchronously

import 'package:dictionary/data/repositories/auth_repository.dart';
import 'package:dictionary/utils/configs/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServicesProvider =
    Provider<AuthRepository>((ref) => AuthRepository());
final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(ref.watch(authServicesProvider));
});

class AuthNotifier extends StateNotifier<bool> {
  final AuthRepository authRepository;

  AuthNotifier(this.authRepository) : super(false);
  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String? errorMessage =
        await authRepository.logInUser(email: email, password: password);
    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    } else {
      Navigator.pushNamed(context, AppRoutes.dictionary);
    }
  }

  Future<void> newUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String? errorMessage =
        await authRepository.createNewUser(email: email, password: password);
    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    } else {
      Navigator.pushNamed(context, AppRoutes.login);
    }
  }

  Future<void> closeSession({required BuildContext context}) async {
    await authRepository.closeSession();
    Navigator.pushNamed(context, AppRoutes.start);
  }
}
