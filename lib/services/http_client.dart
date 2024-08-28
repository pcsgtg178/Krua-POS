import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:krua_pos/utils/pos_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'shared_preferences.dart';
class HttpClient {
  static final HttpClient _instance = HttpClient._internal();
  final Map<String, String> _headers = {};

  // Private constructor
  HttpClient._internal();

  factory HttpClient() => _instance;

  bool isOnline = false;

  Future<void> initialize() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final preference = await Preference.instance;

    String? terminalId = await preference.getValue('terminalId');
    String? secretCode = await preference.getValue('secretCode');
    String version = packageInfo.version;
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$terminalId:$secretCode'))}';
    _headers.addAll({
      "Content-type": "application/json",
        "Accept": "application/json;charset=UTF-8",
        'x-app-name': 'POS',
        'x-app-version': version,
        'x-bus-date': getBusDate(),
        "Authorization": basicAuth
    });
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? headers}) async {

    try {
      final response = await http.get(Uri.parse(url), headers: {..._headers, ...?headers});

      isOnline = true;

      return response.body;
    } catch (e) {
      if (e is SocketException) {
        isOnline = false;
      }
      print('Error: $e');
      return null;
    }
  }

  Future<dynamic> post(String url, Map<String, dynamic> body, { Map<String, dynamic>? headers }) async{
    try {
      final response = await http.post(Uri.parse(url), body: body, headers: {..._headers, ...?headers});

      isOnline = true;

      return response.body;
    } catch (e) {
      if (e is SocketException) {
        isOnline = false;
      }
      print('Error: $e');
      return null;
    }
  }
  
}