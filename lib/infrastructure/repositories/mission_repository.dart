import 'package:tlv_test_task/domain/model/mission.dart';
import 'package:tlv_test_task/infrastructure/datasources/mission_remote_datasource.dart';

class MissionRepository {
  final MissionRemoteDataSource _dataSource;

  MissionRepository(this._dataSource);

  Future<List<Mission>> getMissionsByName({required String name}) async {
    final missionsData = await _dataSource.getLaunchesByName(name);
    return missionsData.map((data) => Mission.fromData(data)).toList();
  }
}
