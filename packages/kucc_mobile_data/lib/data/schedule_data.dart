import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class ScheduleFetchError implements Exception {}

abstract class ScheduleData {
  const ScheduleData();

  Stream<List<ScheduleModel>> getScheduleOfEvent(String eid);
}
