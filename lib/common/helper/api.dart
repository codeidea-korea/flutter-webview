import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ApiPath {
  static const String releaseUrl =
      'https://api.markethammer-renew.codeidea.io/api/';

  //로그인
  static const String login = 'user/common/login';
}

class API {
  static const int _kSuccessCode = 100;

  static Future<Map<String, dynamic>?> get(
    String path, {
    Map<String, String>? header,
    Map<String, String>? query,
    bool isNotResultCode = false,
  }) async {
    Map<String, dynamic>? mapResult;
    try {
      http.MultipartRequest request =
          http.MultipartRequest('GET', Uri.parse(ApiPath.releaseUrl + path));
      request.headers.assignAll(header ?? {});

      request.fields.assignAll(query ?? {});

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);
      var result =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        mapResult = result;
      }
    } catch (e) {
      debugPrint("에러 메세지 :$e");
    } finally {
      return mapResult;
    }
  }

  static Future<Map<String, dynamic>?> post(
    String path, {
    Map<String, String>? header,
    Map<String, String>? query,
    List<dynamic>? files,
  }) async {
    Map<String, dynamic>? mapResult;
    try {
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(ApiPath.releaseUrl + path));
      request.headers.assignAll(header ?? {});
      request.fields.assignAll(query ?? {});

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);
      var result =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        mapResult = result;
      }
    } catch (e) {
      debugPrint("에러 메세지 :$e");
    } finally {
      return mapResult;
    }
  }

  static Future<Map<String, dynamic>?> patch(
    String path, {
    Map<String, String>? header,
    Map<String, String>? query,
  }) async {
    Map<String, dynamic>? mapResult;
    try {
      http.MultipartRequest request =
          http.MultipartRequest('PATCH', Uri.parse(ApiPath.releaseUrl + path));
      request.headers.assignAll(header ?? {});
      request.fields.assignAll(query ?? {});

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);
      var result =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        mapResult = result;
      }
    } catch (e) {
      debugPrint("에러 메세지 :$e");
    } finally {
      return mapResult;
    }
  }

  static Future<dynamic> put(String path,
      {Map<String, String>? header,
      Map<String, dynamic>? query,
      Object? body}) async {
    var client = http.Client();
    dynamic decodedResponse;
    try {
      Uri uri = Uri.parse(ApiPath.releaseUrl + path);
      header = header ?? {};

      var response = await client.put(uri, headers: header, body: body);
      if (response.statusCode == _kSuccessCode) {
        decodedResponse = jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      client.close();
      // ignore: control_flow_in_finally
      return decodedResponse;
    }
  }

  static Future<dynamic> delete(String path,
      {Map<String, String>? header,
      Map<String, dynamic>? query,
      bool isToken = true,
      Object? body}) async {
    var client = http.Client();
    dynamic decodedResponse;
    try {
      Uri uri = Uri.parse(ApiPath.releaseUrl + path);

      header = header ?? {};

      var response = await client.delete(uri, headers: header, body: body);
      if (response.statusCode == 200) {
        decodedResponse = jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    } finally {
      client.close();
      return decodedResponse;
    }
  }
}
