import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/features/model/enums/token_type.dart';
import 'package:flutter_test1/features/providers/shared_prefs_provider.dart';

abstract class ConstanceNetwork {
  static const String baseUrl = 'https://highleveltecknology.com/doos/api/';
  static const String login = 'login';
  static const String sendOTP = 'sendOTP';
  static const String receiveOTP = 'receiveOTP';
  static const String resetpassword = 'resetpassword';

  static Map<String, String> header(Ref ref, TokenType token) {
    final prefs = ref.read(sharedPrefSettings);

    Map<String, String> headers = {};

    switch (token) {
      case TokenType.contentType:
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.userToken}',
          'Accept-Language': prefs.language,
        };
        break;

      case TokenType.authorization:
        headers = {
          'Accept-Language': prefs.language,
          'Authorization': 'Bearer ${prefs.userToken}',
          'Accept': 'application/json',
        };
        break;

      case TokenType.authorizationContentType:
        headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.userToken}',
          'Content-Type': 'multipart/form-data',
          'Accept-Language': prefs.language,
        };
        break;

      case TokenType.acceptLanguage:
        headers = {
          'Accept-Language': prefs.language,
          'Authorization': 'Bearer ${prefs.userToken}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        };
        break;

      case TokenType.registerHeaders:
        headers = {
          'Accept-Language': prefs.language,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${prefs.userToken}',
        };
        break;

      case TokenType.urlencoded:
        headers = {
          'Accept-Language': prefs.language,
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${prefs.userToken}',
        };
        break;

      case TokenType.multipart:
        headers = {
          'Accept-Language': prefs.language,
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ${prefs.userToken}',
        };
        break;

      case TokenType.acceptTextPlain:
        headers = {
          'Accept-Language': prefs.language,
          'Accept': 'text/plain',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${prefs.userToken}',
        };
        break;

      case TokenType.acceptAll:
        headers = {
          'Accept-Language': prefs.language,
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${prefs.userToken}',
        };
        break;

      case TokenType.download:
        headers = {
          'Accept-Language': prefs.language,
          'Accept': '*/*',
          'Accept-Encoding': 'gzip',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${prefs.userToken}',
        };
        break;
    }

    return headers;
  }
}
