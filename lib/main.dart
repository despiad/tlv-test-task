import 'package:flutter/material.dart';
import 'package:tlv_test_task/app.dart';
import 'package:tlv_test_task/injection_container.dart' as sl;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  sl.setup();
  runApp(const MyApp());
}