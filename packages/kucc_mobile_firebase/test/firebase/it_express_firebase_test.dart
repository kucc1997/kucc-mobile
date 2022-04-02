import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';
import 'package:kucc_mobile_firebase/kucc_mobile_firebase.dart';

void main() {
  late FakeFirebaseFirestore _firebaseFirestore;
  late ITExpressFirebase _itExpressFirebase;
  group('IT Express Firebase API test', () {
    setUp(() async {
      _firebaseFirestore = FakeFirebaseFirestore();
      _itExpressFirebase = ITExpressFirebase(_firebaseFirestore);

      await _firebaseFirestore.collection('itexpress').add({
        'title': 'IT Express 18',
        'url': 'https://something.pdf.com/edition.pdf',
        'year': '2018',
        'cover': 'https://example.com/somephoto.jpg'
      });
    });

    test('Fetch IT Express Documents', () async {
      final publications = await _itExpressFirebase.fetchAllITExpress();
      assert(publications.length == 1);
      assert(publications.runtimeType == List<ITExpressModel>);
    });
  });
}
