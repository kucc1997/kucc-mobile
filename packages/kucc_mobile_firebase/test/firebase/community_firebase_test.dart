import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kucc_mobile_firebase/kucc_mobile_firebase.dart';

void main() {
  late FakeFirebaseFirestore _firebaseFirestore;
  late CommunityFirebase _communityFirebase;
  group('Community Firebase API Test', () {
    setUp(() async {
      _firebaseFirestore = FakeFirebaseFirestore();
      _communityFirebase = CommunityFirebase(_firebaseFirestore);
      await _firebaseFirestore.collection('communities').add({
        'about': 'This is about',
        'coordinators': [
          {
            'email': 'aadarshadhakal01@gmail.com',
            'name': 'Aadarsha Dhakal',
          }
        ],
        'image': 'https://aadarshadhakal.com.np',
        'name': 'Dart Community',
      });
    });

    test('Fetch Collection Models', () async {
      final res = await _communityFirebase.getAllCommunities();
      assert(res.length == 1);
    });
  });
}
