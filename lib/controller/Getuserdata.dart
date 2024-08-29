// ignore_for_file: non_constant_identifier_names

// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class GetUserDataController extends GetxController {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//   Future<List<QueryDocumentSnapshot<Object?>>> GetdataMethod(String uId) async {
//     final QuerySnapshot userData = await _firebaseFirestore
//         .collection('User')
//         .where(uId, isEqualTo: uId)
//         .get();

//     return userData.docs;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetUserDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> GetdataMethod(String uId) async {
    final QuerySnapshot userData =
        await _firestore.collection('User').where('uId', isEqualTo: uId).get();
    return userData.docs;
  }
}
