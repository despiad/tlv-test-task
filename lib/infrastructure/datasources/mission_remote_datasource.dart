import 'dart:developer';

import 'package:graphql/client.dart';
import 'package:tlv_test_task/infrastructure/api/queries.dart';
import 'package:tlv_test_task/infrastructure/responses/mission_data.dart';

class MissionRemoteDataSource {
  final GraphQLClient _client;

  MissionRemoteDataSource(this._client);

  Future<List<MissionData>> getLaunchesByName(String missionName) async {
    try {
      var queryResult = await _client.query(QueryOptions(
        document: gql(Queries.getMissions),
        variables: {'name': missionName},
      ));

      if (queryResult.hasException) {
        log(queryResult.exception.toString());
        return [];
      }

      var missions = queryResult.data?['launches']
          .map<MissionData>((missionMap) => MissionData.fromJson(missionMap))
          .toList();
      return missions;
    } on GraphQLError catch (e) {
      log(e.message);
      return [];
    }
  }
}
