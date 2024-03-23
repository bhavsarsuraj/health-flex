import 'package:health_flex/app/controllers/api_controller.dart';
import 'package:health_flex/app/data/models/request/trending/trending_gifs_request.dto.dart';
import 'package:health_flex/app/data/models/response/trending/trending_gifs_response.dart';
import 'package:health_flex/app/utils/urls.dart';

class GiphyRepository {
  final APIController apiController;
  GiphyRepository({required this.apiController});

  Future<TrendingGIFsResponse> getTrendingGIFs(
    TrendingGIFRequestDTO query,
  ) async {
    final response = await apiController.get(
      path: Urls.trendingGIFs,
      query: query.toJson(),
    );
    return TrendingGIFsResponse.fromJson(response);
  }
}
