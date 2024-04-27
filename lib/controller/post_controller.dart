import 'dart:developer';

import 'package:fetch_apis/model/post_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  Future getPost() async {
    final responseData =
        await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
    if (responseData.statusCode == 200) {
      return postModelFromJson(responseData.body);
    }
    return [];
  }
}
