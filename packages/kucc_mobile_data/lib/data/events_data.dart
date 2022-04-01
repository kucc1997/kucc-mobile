import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class EventsError implements Exception {}

class RSVPCheckError extends EventsError {}

class RSVPCreateError extends EventsError {}

class EventFetchError extends EventsError {}

abstract class EventData {
  const EventData();

  Future<List<EventModel>> getAllEvents();

  Future<List<EventModel>> getEventsOfCommunity(String cid);

  Future<bool> checkRSVP(String uid);

  Future<void> createRSVP(String uid, String eid);
}
