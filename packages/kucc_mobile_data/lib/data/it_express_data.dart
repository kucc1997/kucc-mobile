import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class ITExpressFetchException implements Exception {}

abstract class ITExpressData {
  const ITExpressData();

  Future<List<ITExpressModel>> fetchAllITExpress();
}
