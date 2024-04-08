import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_DICTIONARY_URL', obfuscate: true)
  static const String API_DICTIONARY_URL =
      'https://api.dictionaryapi.dev/api/v2/entries/en/';
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static const String SUPABASE_URL = 'https://lssvrxzthuwxnhzoixgu.supabase.co';
  @EnviedField(varName: 'SUPABASE_KEY', obfuscate: true)
  static const String SUPABASE_KEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxzc3ZyeHp0aHV3eG5oem9peGd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI1NTQ0NDksImV4cCI6MjAyODEzMDQ0OX0.ZqgOA9WJOOKaBhkeFIdy_A9NHoZfieVTOO2B5U5kWCU';
}
