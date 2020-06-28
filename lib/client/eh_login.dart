import 'package:FEhViewer/common/global.dart';
import 'package:FEhViewer/http/dio_util.dart';
import 'package:FEhViewer/models/user.dart';
import 'package:dio/dio.dart';

class EhUserManager {
  static EhUserManager _instance = EhUserManager._();

  factory EhUserManager() => _instance;

  EhUserManager._();

  Future<User> signIn(String username, String passwd) async {
    User user = User();
    HttpManager httpManager =
        HttpManager.getInstance("https://forums.e-hentai.org");
    const url = "/index.php?act=Login&CODE=01";
    const referer = "https://forums.e-hentai.org/index.php?act=Login&CODE=00";
    const origin = "https://forums.e-hentai.org";

    FormData formData = new FormData.fromMap({
      "UserName": username,
      "PassWord": passwd,
      "submit": "Log me in",
      "temporary_https": "off",
      "CookieDate": "1",
    });

    Options options = Options(headers: {"Referer": referer, "Origin": origin});

    Response rult =
        await httpManager.postForm(url, data: formData, options: options);

    // todo 登录异常处理

    var setcookie = rult.headers['set-cookie'];

    var cookieMap = _parseSetCookieString(setcookie);

    var cookie = {
      "ipb_member_id": cookieMap["ipb_member_id"],
      "ipb_pass_hash": cookieMap["ipb_pass_hash"],
    };

    var tmpCookie = _getCookieStringFromMap(cookie);

    Map morCookie = await _getHome(tmpCookie);

    morCookie.forEach((key, value) {
      cookie.putIfAbsent(key, () => value);
    });

    var cookieStr = _getCookieStringFromMap(cookie);

    Global.profile.token = cookieStr;

    user.username = username;
    user.cookie = cookieStr;

    return user;
  }

  Future<Map> _getHome(String tmpCookie) async {
    HttpManager httpManager = HttpManager.getInstance("https://e-hentai.org");
    const url = "/home.php";

    Options options = Options(headers: {
      "Cookie": tmpCookie,
    });

    Response rult = await httpManager.getAll(url, options: options);

    var setcookie = rult.headers['set-cookie'];

    var cookieMap = _parseSetCookieString(setcookie);

//    debugPrint('$cookieMap');

    return cookieMap;
  }

  /// 处理SetCookie 转为map
  _parseSetCookieString(List setCookieStrings) {
    var cookie = {};
    RegExp regExp = new RegExp(r"^([^;=]+)=([^;]+);");
    setCookieStrings.forEach((setCookieString) {
//      debugPrint(setCookieString);
      var found = regExp.firstMatch(setCookieString);
      cookie[found.group(1)] = found.group(2);
    });

    return cookie;
  }

  _getCookieStringFromMap(Map cookie) {
    var texts = [];
    cookie.forEach((key, value) {
      texts.add('$key=$value');
    });
    return texts.join("; ");
  }
}