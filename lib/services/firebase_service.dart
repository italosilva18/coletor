import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  CollectionReference get treinosCollection {
    return FirebaseFirestore.instance.collection('treinos');
  }

  Future<List<Map<String, dynamic>>> getTreinos() async {
  final QuerySnapshot snapshot = await treinosCollection.get();
  
  List<Map<String, dynamic>> treinos = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  
  return treinos;
}


  Future<void> addTreino(Map<String, dynamic> treinoData) async {
    await treinosCollection.add(treinoData);
  }

  Future<void> updateTreino(String treinoId, Map<String, dynamic> treinoData) async {
    final DocumentReference docRef = treinosCollection.doc(treinoId);
    await docRef.update(treinoData);
  }

  Future<void> deleteTreino(String treinoId) async {
    final DocumentReference docRef = treinosCollection.doc(treinoId);
    await docRef.delete();
  }
}
