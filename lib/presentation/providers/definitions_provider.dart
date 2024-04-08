import 'package:dictionary/data/repositories/definition_repository.dart';
import 'package:dictionary/domain/models/definition_model.dart';
import 'package:riverpod/riverpod.dart';

final dictionaryRepositoryProvider = Provider<DictionaryRepository>((ref) {
  return DictionaryRepository();
});

final wordProvider = StateProvider<String>((ref) => '');

final definitionsProvider = FutureProvider<List<Definitions>?>((ref) {
  final word = ref.watch(wordProvider.notifier).state;

  final dictionaryRepository = ref.watch(dictionaryRepositoryProvider);
  return dictionaryRepository.getDefinitions(word);
});
