class AyatModel {
  final List<Surah>? surahs;
  final Edition? edition;

  AyatModel({
    this.surahs,
    this.edition,
  });

  factory AyatModel.fromJson(Map<String, dynamic> json) => AyatModel(
        surahs: json["surahs"] == null
            ? []
            : List<Surah>.from(json["surahs"]!.map((x) => Surah.fromJson(x))),
        edition:
            json["edition"] == null ? null : Edition.fromJson(json["edition"]),
      );
}

class Edition {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        englishName: json["englishName"],
        format: json["format"],
        type: json["type"],
      );
}

class Surah {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<Ayah>? ayahs;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        ayahs: json["ayahs"] == null
            ? []
            : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
      );
}

class Ayah {
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final dynamic sajda;

  Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
      );
}

class SajdaClass {
  final int? id;
  final bool? recommended;
  final bool? obligatory;

  SajdaClass({
    this.id,
    this.recommended,
    this.obligatory,
  });

  factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
        id: json["id"],
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );
}
