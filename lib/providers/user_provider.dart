import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app_firebase/config.dart';
import 'package:shopping_app_firebase/user_preferences/preferences.dart';

class UserProvider {
  final _prefs = UserPreferences();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final resp = await http.post(
        Uri.parse(
            "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseToken"),
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {"ok": true, "token": decodedResp['idToken']};
    } else {
      return {"ok": false, "message": decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> newUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final resp = await http.post(
        Uri.parse(
            "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseToken"),
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {"ok": true, "token": decodedResp['idToken']};
    } else {
      return {"ok": false, "message": decodedResp['error']['message']};
    }
  }
}
