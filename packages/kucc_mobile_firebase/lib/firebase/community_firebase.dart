import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class CommunityFirebase implements CommunityData {
  CommunityFirebase(this._firebaseFirestore);
  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<List<CommunityModel>> getAllCommunities() async {
    QuerySnapshot documents =
        await _firebaseFirestore.collection('communities').get();
    List<CommunityModel> _allCommunities = documents.docs
        .map(
          (docs) => CommunityModel.fromJson(
            docs.data() as Map<String, dynamic>,
          ),
        )
        .toList();

    return _allCommunities;
  }
}
