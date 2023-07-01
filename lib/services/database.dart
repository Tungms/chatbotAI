// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DatabaseService {
//   final String uid;
//   DatabaseService({ this.uid });
//
//   final CollectionReference chatHistory = FirebaseFirestore.instance.collection('chat_history');
//
//   Future updateUserData(String sugars, String name, int strength) async {
//     return await chatHistory.doc(uid).set({
//       'sugars': sugars,
//       'name': name,
//       'strength': strength,
//     });
//   }
// }