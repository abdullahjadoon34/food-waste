import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class jwtDecoder {
  decode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      String yourToken = prefs.getString('token');
      Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
      var number = decodedToken['mobileNumber'].toString();
      return number;
    } else {
      Get.toNamed('/');
    }
  }
}
