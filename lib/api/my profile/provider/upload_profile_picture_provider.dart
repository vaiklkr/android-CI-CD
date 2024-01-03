import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/api/my%20profile/model/upload_profile_picture_model.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class UploadProfilePictureApi {
  Future<UploadProfilePictureModel?> onUploadProfilePictureApi(
      String profilePicture) async {
    try {
      final updatepofileURL =
          Uri.parse(Config.myprofileURL + Config.uploadProfilePicture);
      final request = http.MultipartRequest('POST', updatepofileURL);

      if (profilePicture.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
          'profilePicture',
          profilePicture,
        ));
      }

      request.headers.addAll({
        'content-Type': 'application/json',
        'Authorization': PrefObj.preferences?.get(PrefKeys.DEVICETOKEN)
      });

      final http.Response response =
          await http.Response.fromStream(await request.send());

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return UploadProfilePictureModel.fromJson(responseJson);
      } else if (response.statusCode == 401 ||
          response.statusCode == 403 ||
          response.statusCode == 404 ||
          response.statusCode == 500 ||
          response.statusCode == 409) {
        responseJson = json.decode(response.body);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
    return null;
  }
}
