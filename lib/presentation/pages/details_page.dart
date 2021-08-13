import 'package:flutter/material.dart';
import 'package:tlv_test_task/domain/model/mission.dart';

class DetailsPage extends StatelessWidget {
  final Mission mission;

  const DetailsPage({Key? key, required this.mission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mission.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          mission.details ?? 'No provided details for the mission',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
