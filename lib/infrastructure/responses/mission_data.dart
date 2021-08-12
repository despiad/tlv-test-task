class MissionData {
  final String id;
  final String missionName;
  final String? details;

  MissionData({
    required this.id,
    required this.missionName,
    this.details,
  });

  factory MissionData.fromJson(Map<String, dynamic> map) {
    return MissionData(
      id: map['id'],
      missionName: map['mission_name'],
      details: map['details'],
    );
  }
}
