import '../models/communities_model.dart';

class CommunityFetchError implements Exception {}

abstract class CommmunityData {
  const CommmunityData();

  Future<List<CommunityModel>> getAllCommunities();
}
