// TODO: Implement Event Firestore

import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class EventsFirebase implements EventData {
  @override
  Future<bool> checkRSVP(String uid) {
    // TODO: implement checkRSVP
    throw UnimplementedError();
  }

  @override
  Future<void> createRSVP(String uid, String eid) {
    // TODO: implement createRSVP
    throw UnimplementedError();
  }

  @override
  Future<List<EventModel>> getAllEvents() {
    // TODO: implement getAllEvents
    throw UnimplementedError();
  }

  @override
  Future<List<EventModel>> getEventsOfCommunity(String cid) {
    // TODO: implement getEventsOfCommunity
    throw UnimplementedError();
  }
}
