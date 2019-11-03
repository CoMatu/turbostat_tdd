import 'package:shared_preferences/shared_preferences.dart';

abstract class ModeSetting {
  Future<bool> get isCloudMode;
}

class ModeSettingImpl implements ModeSetting {
  bool status;
  SharedPreferences sharedPreferences;
  @override
  Future<bool> get isCloudMode async =>
      status = await SharedPreferences.getInstance().then((v) {
        bool isCloud = false;
        var mode = v.getString('data_source');
        if (mode == 'device') {
          isCloud = true;
        }
        return isCloud;
      });
}
