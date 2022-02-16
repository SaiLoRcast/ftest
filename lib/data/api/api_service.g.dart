// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) ;

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CharactersResponse> getAllCharacters() async {

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CharactersResponse>(
            Options(method: 'GET')
                .compose(_dio.options, '')
                .copyWith(baseUrl: AppUrls.allCharacters)));
    final value = CharactersResponse.fromJson(_result.data!);
    print("getAllCharacters request $_result");
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
