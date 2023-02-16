import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
class DataServices{

  Future<List<dynamic>>getUsers()async{
    var info= rootBundle.loadString('assets/json/data.json');
    List<dynamic> list =json.decode(await info);
    // print(list);
    //to delay view otherwise will have empty screen
    return Future.delayed(
      const Duration(milliseconds: 1500),
        ()=> list.map((e) => e).toList()  // to ensure that it's a map
    );


  }
}