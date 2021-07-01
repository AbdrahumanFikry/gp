import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

mixin ApiMixin {
  var _dio = Dio();
  var _formData = FormData();

  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? header,
    Map<String, List<File>>? files,
    int? sendTimeout,
    int? receiveTimeout,
    Function(int count, int total)? onSendProgress,
    Function(int count, int total)? onReceiveProgress,
  }) async {
    _formData = FormData();
    _addBody(body);
    _addFiles(files ?? {});
    return (await request(
      _dio.post(
        url,
        data: _formData,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: header,
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      ),
    ));
  }

  Future get({
    required String url,
    Map<String, dynamic>? header,
    int? sendTimeout,
    int? receiveTimeout,
    Function(int count, int total)? onReceiveProgress,
  }) async {
    return (await request(
      _dio.get(
        url,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: header,
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      ),
    ));
  }

  void _addBody(Map<String, dynamic> data) {
    if (data != null) {
      _formData.fields
        ..addAll(
          data.entries.map(
            (element) => MapEntry(
              element.key,
              element.value,
            ),
          ),
        );
    }
  }

  void _addFiles(Map<String, List<File>>? files) {
    if (files != null || files?.entries != null || files?.entries.length != 0) {
      for (var entry in files!.entries) {
        if (entry.value != null || entry.value.length != 0) {
          _formData.files.addAll(
            entry.value.map(
              (e) => MapEntry(
                entry.key,
                MultipartFile.fromFileSync(
                  e.path,
                  filename: e.path.split("/").last,
                ),
              ),
            ),
          );
        }
      }
    }
  }

  String errorMsg(dynamic errors) {
    print('Request error : ${errors?.toString()}');
    var errorMessage = 'An unexpected error has occurred';
    try {
      for (final Map<String, dynamic> error in errors) {
        if (error.entries != null) {
          final allValues = error.entries.where(
            (element) => element.key == 'value',
          );
          print(allValues.toString());
          for (var error in allValues) {
            if (error.value is String) {
              errorMessage = ' $errorMessage  ${error.value?.toString()} ';
            } else if (error.value is List) {
              errorMessage = ' $errorMessage\n -${error.value[0]}';
            }
          }
        }
      }
    } catch (e) {
      errorMessage = errors.toString();
    }
    return errorMessage;
  }

  Future<Map<String, dynamic>> request(
    Future<Response> future,
  ) async {
    try {
      final data = (await future);
      final Map<String, dynamic> response = json.decode(data.toString());
      // print('Response : ${data.toString()}');
      print('data come ...');
      if (response['status'] != 200) {
        throw DioError(
          type: DioErrorType.response,
          error: response,
          response: Response(
            statusCode: 401,
            requestOptions: RequestOptions(path: ''),
            data: response,
          ),
          requestOptions: RequestOptions(
            path: '',
          ),
        );
      } else {
        return response;
      }
    } on DioError catch (dioError) {
      String errorMessage = '';
      if (dioError.type == DioErrorType.connectTimeout ||
          dioError.type == DioErrorType.receiveTimeout ||
          dioError.type == DioErrorType.sendTimeout ||
          dioError.type == DioErrorType.other) {
        errorMessage = 'Network connection failed';
      } else if (dioError.type == DioErrorType.cancel) {
        errorMessage = 'Unable to contact the server';
      } else if (dioError.type == DioErrorType.response) {
        switch (dioError.response!.statusCode) {
          case 401:
            errorMessage = 'Unauthorized action !';
            break;
          case 400:
            errorMessage = errorMsg(dioError.response!.data['errors']);
            break;
          case 500:
            errorMessage = 'An unexpected error has occurred';
            break;
          default:
            errorMessage = 'An unexpected error has occurred';
        }
      }
      throw errorMessage;
    }
  }
}
