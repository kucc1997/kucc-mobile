import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class ScheduleFirebase implements ScheduleData {
  ScheduleFirebase(this._firebaseFirestore);
  final FirebaseFirestore _firebaseFirestore;

  @override
  Stream<List<ScheduleModel>> getScheduleOfEvent(String eid) {
    return _firebaseFirestore.collection('schedule').snapshots().asyncMap(
          (event) => List.from(
            event.docs.map(
              (e) => ScheduleModel.fromJson(
                e.data(),
              ),
            ),
          ),
        );
  }
}
