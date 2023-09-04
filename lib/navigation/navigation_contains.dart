import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/features/dash_board/dash_board.dart';
import 'package:botanic_gaze/features/gallery/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/features/search_plants/index.dart';
import 'package:botanic_gaze/features/splash/index.dart';

class NavigationContains {
  // static const String pathPrefix = '/';

  ///go to [SplashPage]
  static const String rootPage = '/';

  ///go to [SplashPage]
  static const String splashPage = '/splash_page';

  ///go to [DashBoardPage]
  static const String dashBoardPage = '/dash_board_page';

  ///go to [SearchPlantsPage]
  static const String searchPage = '/search_page';

  ///go to [SearchPlantsFilterPage]
  static const String searchPlantsFilterPage = 'search_plants_filter_page';

  ///go to [CameraPage]
  static const String scanPage = '/scan_page';

  ///go to [AnalysisImagePage]
  static const String analysisImagePage = '/analysis_image_page';

  ///go to [PlantDetailPage]
  static const String plantDetailPage = '/plant_detail_page';

  ///go to [GalleryPhotoWrapper]
  static const String galleryPhotoWrapper = '/gallery_photo_wrapper';
}
