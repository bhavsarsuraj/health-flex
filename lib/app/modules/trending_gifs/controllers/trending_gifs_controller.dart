import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_flex/app/data/models/request/trending/trending_gifs_request.dto.dart';
import 'package:health_flex/app/data/models/response/gif/gif.dart';
import 'package:health_flex/app/data/models/response/trending/trending_gifs_response.dart';
import 'package:health_flex/app/utils/enums.dart';
import 'package:health_flex/app/utils/keys.dart';
import 'package:health_flex/app/utils/urls.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TrendingGifsController extends GetxController {
  // late GiphyRepository _giphyRepository;

  final trendingGIFs = List<GIF>.empty().obs;

  final _gifsState = WidgetState.initial.obs;
  WidgetState get gifsState => this._gifsState.value;
  set gifsState(WidgetState value) => this._gifsState.value = value;

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
    // final apiController = Get.find<APIController>();
    // _giphyRepository = GiphyRepository(apiController: apiController);
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
      gifsState = WidgetState.loading;
      final baseOptions = BaseOptions(
        baseUrl: 'https://api.giphy.com/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      );
      final dio = Dio(baseOptions);
      dio.interceptors.add(PrettyDioLogger());
      final query = TrendingGIFRequestDTO(
        limit: 25,
        offset: 0,
        rating: 'g',
        bundle: 'messaging_non_clips',
        apiKey: Keys.giphyAPIKey,
      );
      final response = await dio.get(
        Urls.trendingGIFs,
        queryParameters: query.toJson(),
      );
      final trendingGIFsResponse = TrendingGIFsResponse.fromJson(response.data);
      trendingGIFs.addAll(trendingGIFsResponse.data ?? []);
      gifsState = WidgetState.success;
    } catch (e) {
      gifsState = WidgetState.error;
      debugPrint(e.toString());
    }
  }
}
