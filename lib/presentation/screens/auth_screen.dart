import 'package:dictionary/presentation/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

enum Operation { singUp, login }

class AuthScreen extends StatefulWidget {
  Operation operation;
  AuthScreen({
    Key? key,
    required this.operation,
  }) : super(key: key);
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.operation == Operation.singUp ? 'Create account' : 'Log in',
          style: const TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () async {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _emailnameController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Consumer(
              builder: (context, ref, child) {
                ref.watch(authNotifierProvider);
                return ElevatedButton(
                  onPressed: () async {
                    var email = _emailnameController.text;
                    var pass = _passwordController.text;
                    await (widget.operation == Operation.login
                        ? ref.read(authNotifierProvider.notifier).login(
                            password: pass, email: email, context: context)
                        : ref.read(authNotifierProvider.notifier).newUser(
                            password: pass, email: email, context: context));
                  },
                  child: widget.operation == Operation.login
                      ? const Text('Log In')
                      : const Text('Create account'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailnameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
