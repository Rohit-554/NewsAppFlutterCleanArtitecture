import '../../../domain/models/responses/source.dart';
import '../../../utils/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.JsonSerializable)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<Source>> getBreakingNewsArticle({
    @Query('apiKey') String? apiKey,
    @Query('sources') String? sources,
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
  });
}
