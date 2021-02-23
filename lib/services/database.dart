import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference simpleCollection = FirebaseFirestore.instance.collection('simple');

  Future updateUserData(String name, int age, String avatar) async {
    return await simpleCollection.doc(uid).set({
      'name': name,
      'age': age,
      'avatar': avatar,
    });
  }
}
