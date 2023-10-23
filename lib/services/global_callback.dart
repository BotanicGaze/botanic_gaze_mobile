import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class GlobalCallback {
  VoidCallback? onAddMyPlantSuccess;
  ValueChanged<int>? changeDashboardTab;
}
