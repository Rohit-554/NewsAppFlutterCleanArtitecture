import '../../domain/models/request/breaking_news_request.dart';
import '../../domain/models/responses/source.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../Base/base_api_repository.dart';
import '../datasources/remote/news_api_service.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService _newsApiService;
  ApiRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<Source>> getBreakingNews(
      {required BreakingNewsRequest request}) {
    return getStateOf<Source>(
      request: () => _newsApiService.getBreakingNewsArticle(
        apiKey: request.apiKey,
        sources: request.sources,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }
}
