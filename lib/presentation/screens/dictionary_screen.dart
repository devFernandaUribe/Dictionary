import 'package:dictionary/presentation/providers/definitions_provider.dart';
import 'package:dictionary/presentation/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictionaryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(definitionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary'),
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
            TextField(
              onChanged: (value) {
                ref.read(wordProvider.notifier).state = value;
              },
              decoration: const InputDecoration(
                labelText: 'Enter a word',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  ref.refresh(definitionsProvider);
                },
                child: const Text('Search'),
              ),
            ),
            future.when(
              loading: () => Container(
                width: 24,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
              error: (err, stack) => Text('Error: $err'),
              data: (definitions) {
                if (definitions != null && definitions.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: definitions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text('${index + 1}'),
                          title: Text(
                            definitions[index].definition ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: Text('No definitions found.'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> signOut() async {
  await supabase.auth.signOut();
}
