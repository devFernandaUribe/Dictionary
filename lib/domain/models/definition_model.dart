class DefinitionModel {
  final String? word;
  final String? phonetic;
  final List<Phonetics>? phonetics;
  final List<Meanings>? meanings;
  final License? license;
  final List<String>? sourceUrls;

  DefinitionModel({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  DefinitionModel.fromJson(Map<String, dynamic> json)
      : word = json['word'] as String?,
        phonetic = json['phonetic'] as String?,
        phonetics = (json['phonetics'] as List?)
            ?.map((dynamic e) => Phonetics.fromJson(e as Map<String, dynamic>))
            .toList(),
        meanings = (json['meanings'] as List?)
            ?.map((dynamic e) => Meanings.fromJson(e as Map<String, dynamic>))
            .toList(),
        license = (json['license'] as Map<String, dynamic>?) != null
            ? License.fromJson(json['license'] as Map<String, dynamic>)
            : null,
        sourceUrls = (json['sourceUrls'] as List?)
            ?.map((dynamic e) => e as String)
            .toList();

  Map<String, dynamic> toJson() => {
        'word': word,
        'phonetic': phonetic,
        'phonetics': phonetics?.map((e) => e.toJson()).toList(),
        'meanings': meanings?.map((e) => e.toJson()).toList(),
        'license': license?.toJson(),
        'sourceUrls': sourceUrls
      };
}

class Phonetics {
  final String? text;
  final String? audio;
  final String? sourceUrl;
  final License? license;

  Phonetics({
    this.text,
    this.audio,
    this.sourceUrl,
    this.license,
  });

  Phonetics.fromJson(Map<String, dynamic> json)
      : text = json['text'] as String?,
        audio = json['audio'] as String?,
        sourceUrl = json['sourceUrl'] as String?,
        license = (json['license'] as Map<String, dynamic>?) != null
            ? License.fromJson(json['license'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'text': text,
        'audio': audio,
        'sourceUrl': sourceUrl,
        'license': license?.toJson()
      };
}

class License {
  final String? name;
  final String? url;

  License({
    this.name,
    this.url,
  });

  License.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Meanings {
  final String? partOfSpeech;
  final List<Definitions>? definitions;
  final List<dynamic>? synonyms;
  final List<dynamic>? antonyms;

  Meanings({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  Meanings.fromJson(Map<String, dynamic> json)
      : partOfSpeech = json['partOfSpeech'] as String?,
        definitions = (json['definitions'] as List?)
            ?.map(
                (dynamic e) => Definitions.fromJson(e as Map<String, dynamic>))
            .toList(),
        synonyms = json['synonyms'] as List?,
        antonyms = json['antonyms'] as List?;

  Map<String, dynamic> toJson() => {
        'partOfSpeech': partOfSpeech,
        'definitions': definitions?.map((e) => e.toJson()).toList(),
        'synonyms': synonyms,
        'antonyms': antonyms
      };
}

class Definitions {
  final String? definition;
  final List<dynamic>? synonyms;
  final List<dynamic>? antonyms;

  Definitions({
    this.definition,
    this.synonyms,
    this.antonyms,
  });

  Definitions.fromJson(Map<String, dynamic> json)
      : definition = json['definition'] as String?,
        synonyms = json['synonyms'] as List?,
        antonyms = json['antonyms'] as List?;

  Map<String, dynamic> toJson() =>
      {'definition': definition, 'synonyms': synonyms, 'antonyms': antonyms};
}
