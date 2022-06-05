import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tarifim/firebase/models/malzeme.dart';

class TarifModel {
  String image;
  String baslik;
  String desc;
  bool isSave;
  List<Malzeme> malzemeler;

  String? referenceId;

  TarifModel(
    this.image,
    this.baslik, {
    required this.isSave,
    required this.desc,
    required this.malzemeler,
    this.referenceId,
  });

  factory TarifModel.fromSnapshot(DocumentSnapshot snapshot) {
    final newTarif =
        TarifModel.fromJson(snapshot.data() as Map<String, dynamic>);
    newTarif.referenceId = snapshot.reference.id;
    return newTarif;
  }

  factory TarifModel.fromJson(Map<String, dynamic> json) =>
      _tarifModelFromJson(json);
  Map<String, dynamic> toJson() => _tarifModelToJson(this);
}

TarifModel _tarifModelFromJson(Map<String, dynamic> json) {
  return TarifModel(json['image'] as String, json['baslik'] as String,
      isSave: json['isSave'] as bool,
      malzemeler:
          _convertMalzemeler(json['malzemeler'] as List<dynamic>),
      desc: json['desc'] as String);
}

List<Malzeme> _convertMalzemeler(List<dynamic> malzemeMap) {
  final malzemeler = <Malzeme>[];
  for (final malzeme in malzemeMap) {
    malzemeler.add(Malzeme.fromJson(malzeme as Map<String, dynamic>));
  }
  return malzemeler;
}

Map<String, dynamic> _tarifModelToJson(TarifModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'baslik': instance.baslik,
      'desc': instance.desc,
      'isSave': instance.isSave,
      'malzemeler': _malzemeList(instance.malzemeler),
    };

List<Map<String, dynamic>>? _malzemeList(List<Malzeme>? malzemeler) {
  if (malzemeler == null) {
    return null;
  }
  final malzemeMap = <Map<String, dynamic>>[];
  for (var malzeme in malzemeler) {
    malzemeMap.add(malzeme.toJson());
  }
  return malzemeMap;
}
