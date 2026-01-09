import 'dart:io';
import 'package:dio/dio.dart';

Future<void> downloadFileAuthenticated(
  String url,
  String savePath, {
  String? token,
}) async {
  final dio = Dio();

  final headers = <String, String>{};
  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  }

  await dio.download(
    url,
    savePath,
    options: Options(
      headers: headers,
      responseType: ResponseType.bytes,
      followRedirects: true,
      receiveTimeout: const Duration(minutes: 2),
    ),
  );
}
