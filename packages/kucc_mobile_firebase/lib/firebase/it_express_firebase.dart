import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class ITExpressFirebase implements ITExpressData {
  ITExpressFirebase(this._firebaseFirestore);
  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<List<ITExpressModel>> fetchAllITExpress() async {
    QuerySnapshot<Map<String, dynamic>> snapthots =
        await _firebaseFirestore.collection('itexpress').get();
    return snapthots.docs
        .map(
          (e) => ITExpressModel.fromJson(
            e.data(),
          ),
        )
        .toList();
  }
}
