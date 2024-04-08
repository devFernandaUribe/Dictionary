import 'package:dictionary/domain/models/definition_model.dart';
import 'package:dictionary/utils/configs/env.dart';
import 'package:dictionary/utils/logger.dart';
import 'dart:convert';
import 'package:http/http.dart';

class DictionaryRemoteDataSource {
  Future<DefinitionModel?> getDefinitions(String word) async {
    Uri url = Uri.parse('${Env.API_DICTIONARY_URL}$word');

    try {
      Response response = await get(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        DefinitionModel definitions = DefinitionModel.fromJson(jsonResponse[0]);
        return definitions;
      }
    } catch (e) {
      logger.e('Failed to get definitions DictionaryRemoteDataSource:',
          error: e);
    }
    return null;
  }
}
