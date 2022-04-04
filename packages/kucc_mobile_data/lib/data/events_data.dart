import 'package:kucc_mobile_data/kucc_mobile_data.dart';
import 'package:kucc_mobile_data/models/attendees_model.dart';

class EventsError implements Exception {}

class RSVPCheckError extends EventsError {}

class RSVPCreateError extends EventsError {}

class EventFetchError extends EventsError {}

abstract class EventData {
  const EventData();

  Future<List<EventModel>> getAllEvents();

  Future<List<EventModel>> getEventsOfCommunity(String cid);

  Future<bool> checkRSVP(String uid, String eid);

  Future<void> createRSVP(String uid, String eid);

  Stream<int> rsvpCount(String eid);

  Stream<List<AttendeeModel>> getAttendees(String eid);
}
