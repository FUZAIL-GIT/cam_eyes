import 'dart:convert';
import 'dart:io';

import 'package:cam_eyes/utils/logging_service.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:text_to_speech/text_to_speech.dart';

class HomeController extends GetxController {
  final RxString _text = ''.obs;
  final RxBool _isTyping = false.obs;
  String get text => _text.value;
  bool get isTyping => _isTyping.value;

  Future<void> sendRequest() async {
    ImagePicker picker = ImagePicker();
    try {
      //text to speech object
      TextToSpeech textToSpeech = TextToSpeech();
      //image picker object
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      var body = jsonEncode({});
      var headers = {
        //!Enter your auth key here
        HttpHeaders.authorizationHeader: 'AUTHORIZATION_KEY',
        HttpHeaders.contentTypeHeader: 'application/json'
      };
      var url = Uri.parse('YOUR_URL_HERE');
      var response = await http.post(url, headers: headers, body: body);

      //success case
      if (response.statusCode == 200) {}

      //unauthhorized access
      if (response.statusCode == 401) {}
    } catch (e) {
      talker.error(e);
    }
  }
}
