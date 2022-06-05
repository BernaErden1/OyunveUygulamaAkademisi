class Malzeme {
  final String? malzeme1;
  final String? malzeme2;
  final String? malzeme3;
  final String? malzeme4;
  final String? malzeme5;
  final String? malzeme6;
  final String? malzeme7;

  Malzeme(this.malzeme1, this.malzeme2, this.malzeme3, this.malzeme4,
      this.malzeme5, this.malzeme6, this.malzeme7);

  factory Malzeme.fromJson(Map<String, dynamic> json) =>
      _malzemeFromJson(json);

  Map<String, dynamic> toJson() => _malzemeToJson(this);
}

Malzeme _malzemeFromJson(Map<String, dynamic> json) {
  return Malzeme(
    json['malzeme1'] as String?,
    json['malzeme2'] as String?,
    json['malzeme3'] as String?,
    json['malzeme4'] as String?,
    json['malzeme5'] as String?,
    json['malzeme6'] as String?,
    json['malzeme7'] as String?,
  );
}

Map<String, dynamic> _malzemeToJson(Malzeme instance) =>
    <String, dynamic>{
      'malzeme1': instance.malzeme1,
      'malzeme2': instance.malzeme2,
      'malzeme3': instance.malzeme3,
      'malzeme4': instance.malzeme4,
      'malzeme5': instance.malzeme5,
      'malzeme6': instance.malzeme6,
      'malzeme7': instance.malzeme7,
    };
