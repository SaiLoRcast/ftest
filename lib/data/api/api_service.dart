import 'package:dio/dio.dart';
import 'package:ftest/data/api/interceptor.dart';
import 'package:ftest/data/api/response/characters_response.dart';
import 'package:ftest/utils/urls.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppUrls.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );

    return _ApiService(dio, baseUrl: baseUrl);
  }

  // Login service
  @GET(AppUrls.allCharacters) // enter your api method
  Future<CharactersResponse> getAllCharacters();
}
