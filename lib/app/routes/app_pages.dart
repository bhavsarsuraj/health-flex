import 'package:get/get.dart';
import '../modules/trending_gifs/bindings/trending_gifs_binding.dart';
import '../modules/trending_gifs/views/trending_gifs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TRENDING_GIFS;

  static final routes = [
    GetPage(
      name: _Paths.TRENDING_GIFS,
      page: () => const TrendingGifsView(),
      binding: TrendingGifsBinding(),
    ),
  ];
}
