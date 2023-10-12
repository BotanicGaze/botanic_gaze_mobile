// import 'package:background_fetch/background_fetch.dart';
// import 'package:shared/shared.dart';

// // [Android-only] This "Headless Task" is run when the Android app is terminated with `enableHeadless: true`
// // Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
// @pragma('vm:entry-point')
// Future<void> backgroundFetchHeadlessTask(HeadlessTask task) async {
//   final taskId = task.taskId;
//   final isTimeout = task.timeout;
//   if (isTimeout) {
//     // This task has exceeded its allowed running-time.
//     // You must stop what you're doing and immediately .finish(taskId)
//     Log.d('[BackgroundFetch] Headless task timed-out: $taskId');
//     BackgroundFetch.finish(taskId);
//     return;
//   }
//   Log.d('[BackgroundFetch] Headless event received.');
//   // Do your work here...
//   BackgroundFetch.finish(taskId);
// }

// class BackgroundFetchService {
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     // Configure BackgroundFetch.
//     final status = await BackgroundFetch.configure(
//         BackgroundFetchConfig(
//           minimumFetchInterval: 1,
//           stopOnTerminate: false,
//           enableHeadless: true,
//           requiresBatteryNotLow: false,
//           requiresCharging: false,
//           requiresStorageNotLow: false,
//           requiresDeviceIdle: false,
//           requiredNetworkType: NetworkType.NONE,
//         ), (String taskId) async {
//       // <-- Event handler
//       // This is the fetch-event callback.
//       print('[BackgroundFetch] Event received $taskId');
//       // setState(() {
//       //   _events.insert(0, new DateTime.now());
//       // });
//       // IMPORTANT:  You must signal completion of your task or the OS can punish your app
//       // for taking too long in the background.
//       BackgroundFetch.finish(taskId);
//     }, (String taskId) async {
//       // <-- Task timeout handler.
//       // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
//       print('[BackgroundFetch] TASK TIMEOUT taskId: $taskId');
//       BackgroundFetch.finish(taskId);
//     });
//     print('[BackgroundFetch] configure success: $status');
//     // setState(() {
//     //   _status = status;
//     // });

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     // if (!mounted) return;
//   }
// }
