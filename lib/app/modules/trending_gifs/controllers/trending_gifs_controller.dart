import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_flex/app/controllers/api_controller.dart';
import 'package:health_flex/app/data/models/request/trending/trending_gifs_request.dto.dart';
import 'package:health_flex/app/data/models/response/gif/gif.dart';
import 'package:health_flex/app/data/repository/giphy_repository.dart';
import 'package:health_flex/app/utils/enums.dart';
import 'package:health_flex/app/utils/keys.dart';

class TrendingGifsController extends GetxController {
  late GiphyRepository _giphyRepository;

  final trendingGIFs = List<GIF>.empty().obs;

  final _gifsState = PaginatedWidgetState.initial.obs;
  PaginatedWidgetState get gifsState => this._gifsState.value;
  set gifsState(PaginatedWidgetState value) => this._gifsState.value = value;

  final _currentPage = 0.obs;
  int get currentPage => this._currentPage.value;
  set currentPage(int value) => this._currentPage.value = value;

  final _hasMoreData = true.obs;
  bool get hasMoreData => this._hasMoreData.value;
  set hasMoreData(bool value) => this._hasMoreData.value = value;

  @override
  void onInit() {
    _configure();
    super.onInit();
  }

  void _configure() {
    _initRepositories();
    getTrendingGIFs();
  }

  void _initRepositories() {
    final apiController = Get.find<APIController>();
    _giphyRepository = GiphyRepository(apiController: apiController);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getTrendingGIFs() async {
    try {
      gifsState = currentPage == 0
          ? PaginatedWidgetState.loading
          : PaginatedWidgetState.paginationLoading;

      final query = TrendingGIFRequestDTO(
        limit: 25,
        offset: currentPage,
        rating: 'g',
        bundle: 'messaging_non_clips',
        apiKey: Keys.giphyAPIKey,
      );
      final response = await _giphyRepository.getTrendingGIFs(query);
      if (response.data?.isEmpty ?? true) hasMoreData = false;
      trendingGIFs.addAll(response.data ?? []);
      currentPage++;
      gifsState = PaginatedWidgetState.success;
    } catch (e) {
      gifsState = currentPage == 0
          ? PaginatedWidgetState.error
          : PaginatedWidgetState.paginationError;
      debugPrint(e.toString());
    }
  }
}
