import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';
import 'package:kucc_mobile_data/models/attendees_model.dart';

class EventsFirebase implements EventData {
  final FirebaseFirestore _firebaseFirestore;
  EventsFirebase(this._firebaseFirestore);

  @override
  Future<bool> checkRSVP(String uid, String eid) async {
    DocumentSnapshot snapshot = await _firebaseFirestore
        .collection('events')
        .doc(eid)
        .collection('attendees')
        .doc(uid)
        .get();
    return snapshot.exists;
  }

  @override
  Future<void> createRSVP(String uid, String eid) async {
    try {
      await _firebaseFirestore
          .collection('events')
          .doc(eid)
          .collection('attendees')
          .doc(uid)
          .set(
        {
          'certificate': '',
          'completed': false,
        },
      );
    } catch (e) {
      throw RSVPCreateError();
    }
  }

  @override
  Future<List<EventModel>> getAllEvents() async {
    QuerySnapshot<Map<String, dynamic>> result =
        await _firebaseFirestore.collection('events').get();
    return result.docs
        .map(
          (e) => EventModel.fromJson(
            e.data(),
          ),
        )
        .toList();
  }

  @Deprecated("Not Implemented, Thus Deprecated. LOL")
  @override
  Future<List<EventModel>> getEventsOfCommunity(String cid) async {
    throw UnimplementedError();
  }

  @override
  Stream<int> rsvpCount(String eid) {
    return _firebaseFirestore
        .collection('events')
        .doc(eid)
        .collection('attendees')
        .snapshots()
        .asyncMap<int>((event) => event.size);
  }

  @override
  Stream<List<AttendeeModel>> getAttendees(String eid) {
    return _firebaseFirestore
        .collection('events')
        .doc(eid)
        .collection('attendees')
        .snapshots()
        .asyncMap<List<AttendeeModel>>(
          (event) => event.docs
              .map(
                (e) => AttendeeModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }
}
