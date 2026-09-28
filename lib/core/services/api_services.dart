import 'package:dio/dio.dart';
import 'package:e_commerce_app/secret.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseUrl, headers: {"apikey": anonKey}),
  );
  //path it is the parameter of the api
  Future<dynamic> getData(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> postData(String path, dynamic data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> patchData(String path, dynamic data) async {
    try {
      final response = await _dio.patch(path, data: data);
      return response.data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> deleteData(String path) async {
    try {
      final response = await _dio.delete(path);
      return response.data;
    } catch (e) {
      return e;
    }
  }
}
