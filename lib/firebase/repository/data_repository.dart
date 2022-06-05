import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tarifim/firebase/models/tarif_model.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('tarifler');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Stream<DocumentSnapshot> getItem(String id) {
    return collection.doc(id).snapshots();
  }

  Stream<QuerySnapshot> getItemWith(String malz) {
    return collection.where('baslik', isEqualTo: malz).snapshots();
  }

  Stream<QuerySnapshot> getSaveItem() {
    return collection.where('isSave', isEqualTo: true).snapshots();
  }

  void updatePet(TarifModel tarif) async {
    await collection.doc(tarif.referenceId).update(tarif.toJson());
  }
}
