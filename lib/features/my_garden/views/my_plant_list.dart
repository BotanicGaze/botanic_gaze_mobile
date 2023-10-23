// import 'package:app_ui/app_ui.dart';
// import 'package:base_bloc/base_bloc.dart';
// import 'package:botanic_gaze/constants/index.dart';
// import 'package:botanic_gaze/models/index.dart';
// import 'package:botanic_gaze/navigation/index.dart';
// import 'package:botanic_gaze/widgets/index.dart';
// import 'package:flutter/material.dart';

// class MyPlantListView extends StatelessWidget {
//   const MyPlantListView({required this.listMyPlants, super.key});

//   final List<MyPlantModel> listMyPlants;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
//           child: Row(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     context.pushNamed(NavigationContains.searchPage);
//                   },
//                   child: AppTextField(
//                     hintText: 'Monstera Albo',
//                     enabled: false,
//                     prefixIcon: Hero(
//                       tag: AppIcons.iconSearch,
//                       child: Image.asset(
//                         AppIcons.iconSearch,
//                         width: Dimens.d16.responsive(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: Dimens.d8.responsive()),
//               SizedBox(
//                 child: GestureDetector(
//                   onTap: () {
//                     context.pushNamed(NavigationContains.scanPage);
//                   },
//                   child: SizedBox(
//                     // width: Dimens.d50.responsive(),
//                     child: IconButton.filled(
//                       onPressed: () {},
//                       icon: Image.asset(
//                         AppIcons.iconCamera,
//                         // width: Dimens.d64.responsive(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: Dimens.d8),
//         Expanded(
//           child: ListView.separated(
//             itemCount: listMyPlants.length,
//             itemBuilder: (context, index) {
//               final item = listMyPlants[index];
//               return MyPlantItemWidget(item: item);
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return SizedBox(
//                 height: Dimens.d8.responsive(),
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
