class AyaytModel {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final int? numberOfAyahs;
  final List<Ayah>? ayahs;
  final Edition? edition;

  AyaytModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  factory AyaytModel.fromJson(Map<String, dynamic> json) => AyaytModel(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        numberOfAyahs: json["numberOfAyahs"],
        ayahs: json["ayahs"] == null
            ? []
            : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
        edition:
            json["edition"] == null ? null : Edition.fromJson(json["edition"]),
      );
}

class Ayah {
  final int? number;
  final String? audio;
  final List<String>? audioSecondary;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final Sagda? sajda;
  final bool? sajdaBool;

  Ayah({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
    this.sajdaBool,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        audio: json["audio"],
        audioSecondary: json["audioSecondary"] == null
            ? []
            : List<String>.from(json["audioSecondary"]!.map((x) => x)),
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajdaBool: json["sagda"].runtimeType != bool ? null : json["sagda"],
        sajda: json["sajda"].runtimeType != Map
            ? null
            : Sagda.fromJson(json["sajda"]),
      );
}

class Sagda {
  final int? id;
  final bool? recommended;
  final bool? obligatory;

  Sagda({
    this.id,
    this.recommended,
    this.obligatory,
  });

  factory Sagda.fromJson(Map<String, dynamic> json) => Sagda(
        id: json["id"],
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );
}

class Edition {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;
  final dynamic direction;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        englishName: json["englishName"],
        format: json["format"],
        type: json["type"],
        direction: json["direction"],
      );
}
