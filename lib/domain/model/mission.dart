import 'package:tlv_test_task/infrastructure/responses/mission_data.dart';

class Mission {
  final String id;
  final String name;
  final String? details;

  Mission({
    required this.id,
    required this.name,
    this.details,
  });

  factory Mission.fromData(MissionData data) {
    return Mission(
      id: data.id,
      name: data.missionName,
      details: data.details,
    );
  }
}
