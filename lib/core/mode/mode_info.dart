import 'package:shared_preferences/shared_preferences.dart';

abstract class ModeInfo {
  Future<bool> get isCloudMode;
}

class ModeInfoImpl implements ModeInfo {
  bool status;
  SharedPreferences sharedPreferences;
  bool isCloud = false;

  @override
  Future<bool> get isCloudMode async =>
      status = await SharedPreferences.getInstance().then((v) {
        var mode = v.getString('data_source');
        if (mode == 'cloud') {
          isCloud = true;
        }
        return isCloud;
      });
}
