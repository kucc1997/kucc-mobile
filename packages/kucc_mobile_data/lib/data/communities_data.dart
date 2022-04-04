import '../models/communities_model.dart';

class CommunityFetchError implements Exception {}

abstract class CommunityData {
  const CommunityData();

  Future<List<CommunityModel>> getAllCommunities();
}
