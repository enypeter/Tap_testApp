import 'dart:io';

import 'package:dio/dio.dart';

const BaseUrl = 'https://api.zipconnect.app/api/v1/';
const ImageBaseUrl = 'https://api.zipconnect.app/img/interests/';
const categories = BaseUrl + 'category/60597fa4eb72561fb6bb064f';
const profile = BaseUrl + 'profile/me';

const token ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwZGM1MThlODJlM2QwMDNjZTc4MmMzMiIsImlhdCI6MTYzMTAzNTkyNywiZXhwIjoxNjM4ODExOTI3fQ.UaEnSaHGIdq89F3KURngkdKJ03PCihJ5ulf09VdlVWI';

class ApiDocs {
  static makeGetRequest({url}) async {
    print(url);
    var headers = ApiDocs.headers();
    return await ApiDocs.getHttp()
        .get(url, options: headers);
  }

  static makeCategoryGetRequest({url}) async {
    print(url);
    return await ApiDocs.getHttp()
        .get(url);
  }

  static Dio getHttp() {
    Dio dio;
    dio = new Dio();
    return dio;
  }

  static headers() {
    return Options(headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
  }

  static handleErrors(DioError e) {
    if (e.response != null &&
        e.response!.statusCode != null &&
        e.response!.statusCode == 401) {
      print('failed to load');
    }
    if (e.type == DioErrorType.response) {
      if (e.response!.data is String) {
        return e.response!.data;
      }
      return e.response!.data['errors'] != null
          ? e.response!.data['errors'][0]
          : e.response!.data['message'];
    } else if (e.type == DioErrorType.other) {
      return e.error != null ? e.error.toString() : e.message;
    } else {
      print(e.message.toString());
      return e.message;
    }
  }

  static isRequestSuccessful(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  static getCategories() async {
    try {
      Response response = await ApiDocs.makeCategoryGetRequest(url: categories);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return '${response.statusCode} - ${response.statusMessage}';
      }
    } on DioError catch (e) {
      return ApiDocs.handleErrors(e);
    }
  }

  static getMyProfile() async {
    try {
      Response response = await ApiDocs.makeGetRequest(url: profile);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return '${response.statusCode} - ${response.statusMessage}';
      }
    } on DioError catch (e) {
      return ApiDocs.handleErrors(e);
    }
  }
}
