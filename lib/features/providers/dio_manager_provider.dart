import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/network/dio_manager/dio_manager.dart';

final dioManagerProvider = Provider<DioManager>((ref) {
  return DioManager(ref); 
});