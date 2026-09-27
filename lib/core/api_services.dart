import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio(
    BaseOptions(baseUrl: "https://jznrfsqrfngtbaeazbjp.supabase.co/rest/v1/"),
  );
}
