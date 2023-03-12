// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../services/data_services.dart';
//
// class DataController extends GetxController {
//   //to process and save data from json or server
//   var list = [].obs;
//   final service = DataServices();
//   final _loading = false.obs;
//   bool get loading => _loading.value;
//
//   @override
//   void onInit() {
//     _loadData();
//     super.onInit();
//   }
//
//   //to add status to the new list when status is true
//   List get newList=> list.where((e) => e['status']).map((e) => e).toList();
//
//   Future<void> _loadData() async {
//     _loading.value = false;
//     try {
//       List info = await service.getUsers();
//       list.addAll(info);
//     } catch (e) {
//       debugPrint(e.toString());
//     } finally {
//       _loading.value = true;
//     }
//   }
// }
