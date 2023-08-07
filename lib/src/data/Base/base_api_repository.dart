import 'dart:io' show HttpResponse, HttpStatus;

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:meta/meta.dart';

import '../../utils/resources/data_state.dart';

abstract class BaseApiRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: httpResponse.data!);
      } else {
        throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (e) {
      return DataFailure(exception: e);
    }
  }
}
