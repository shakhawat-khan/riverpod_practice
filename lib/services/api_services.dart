
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/poem_class.dart';

import 'package:http/http.dart' as http ;

final apiServiceProvider = Provider<ApiServices>((ref) => ApiServices());

class ApiServices {
  Future<List<PoemClass>> getPoem() async {
    http.Response response;

    response = await http.get(Uri.parse('https://poetrydb.org/random'));

    if(response.statusCode==200){
      var body= response.body;
      debugPrint(body);
      //return PoemClass.fromJson(jsonDecode(response.body));

      return poemFromJson(body);


    } else {

      throw Exception('Failed to load');
    }

  }
}