import '../../utils/resources/data_state.dart';
import '../models/request/breaking_news_request.dart';
import '../models/responses/source.dart';

abstract class ApiRepository {
  Future<DataState<Source>> getBreakingNews({
    required BreakingNewsRequest request,
  });
}
