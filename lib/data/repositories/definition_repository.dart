import 'package:dictionary/data/datasources/definitions_remote_datasource.dart';
import 'package:dictionary/domain/models/definition_model.dart';

class DictionaryRepository {
  final DictionaryRemoteDataSource _dataSource = DictionaryRemoteDataSource();
  Future<List<Definitions>?> getDefinitions(String word) async {
    try {
      DefinitionModel? model = await _dataSource.getDefinitions(word);
      List<Definitions> allDefinitions = [];
      model?.meanings?.forEach((meaning) {
        allDefinitions.addAll(meaning.definitions ?? []);
      });
      return allDefinitions;
    } catch (e) {
      throw Exception('Failed to get definitions: $e');
    }
  }
}
