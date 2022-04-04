import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';
import 'package:kucc_mobile_firebase/kucc_mobile_firebase.dart';

void main() {
  FakeFirebaseFirestore _firebaseFirestore;
  late ScheduleFirebase _scheduleFirebase;

  ScheduleModel _modelToFeedAndFetch = ScheduleModel(
    description: 'This is description',
    endTime: DateTime.now().add(const Duration(hours: 20)),
    event: '/events/something',
    startTime: DateTime.now(),
    title: 'title',
  );

  group('Test Schedule Firebase API', () {
    setUp(() {
      _firebaseFirestore = FakeFirebaseFirestore();
      _scheduleFirebase = ScheduleFirebase(_firebaseFirestore);
      _firebaseFirestore.collection('schedule').add(
            _modelToFeedAndFetch.toJson(),
          );
    });

    test('Test Schedule Fetch', () async {
      final schedules = _scheduleFirebase.getScheduleOfEvent('something');
      expect(schedules, emits([_modelToFeedAndFetch]));
    });
  });
}
