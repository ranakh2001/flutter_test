import 'package:doos_doos/network/dio_manager/dio_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioManagerProvider = Provider<DioManager>((ref) {
  return DioManager(ref); 
});