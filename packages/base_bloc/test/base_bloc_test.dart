// import 'package:flutter_test/flutter_test.dart';
// import 'package:base_bloc/base_bloc.dart';
// import 'package:base_bloc/base_bloc_platform_interface.dart';
// import 'package:base_bloc/base_bloc_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockBaseBlocPlatform
//     with MockPlatformInterfaceMixin
//     implements BaseBlocPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final BaseBlocPlatform initialPlatform = BaseBlocPlatform.instance;

//   test('$MethodChannelBaseBloc is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelBaseBloc>());
//   });

//   test('getPlatformVersion', () async {
//     BaseBloc baseBlocPlugin = BaseBloc();
//     MockBaseBlocPlatform fakePlatform = MockBaseBlocPlatform();
//     BaseBlocPlatform.instance = fakePlatform;

//     expect(await baseBlocPlugin.getPlatformVersion(), '42');
//   });
// }
