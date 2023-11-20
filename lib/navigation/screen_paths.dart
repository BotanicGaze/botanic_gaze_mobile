import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/features/dash_board/dash_board.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/features/feedback/index.dart';
import 'package:botanic_gaze/features/gallery/index.dart';
import 'package:botanic_gaze/features/my_garden/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/features/search_plants/index.dart';
import 'package:botanic_gaze/features/splash/index.dart';

class ScreenPaths {
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

  ///go to [PopularPlantDetail]
  static const String popularPlantDetail = '/popular_plant_detail';

  ///go to [MyPlantDetailScreen]
  static const String myPlantDetail = '/my_plant_detail';

  ///go to [FeedbackScreen]
  static const String feedbackScreen = '/feedback_screen';

  ///go to [FrequentlyAskedQuestions]
  static const String frequentlyAskedQuestions = '/frequentlyAskedQuestions';
}
