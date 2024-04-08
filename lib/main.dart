import 'package:dictionary/presentation/screens/dictionary_screen.dart';
import 'package:dictionary/presentation/screens/auth_screen.dart';
import 'package:dictionary/presentation/screens/start_screen.dart';
import 'package:dictionary/utils/configs/app_routes.dart';
import 'package:dictionary/utils/configs/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: Env.SUPABASE_URL, anonKey: Env.SUPABASE_KEY);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
            title: 'Dictionary App',
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: AppRoutes.start,
            home: const StartScreen(),
            routes: {
          AppRoutes.singUp: (context) => AuthScreen(
                operation: Operation.singUp,
              ),
          AppRoutes.login: (context) => AuthScreen(
                operation: Operation.login,
              ),
          AppRoutes.dictionary: (context) => DictionaryScreen(),
        }));
  }
}
