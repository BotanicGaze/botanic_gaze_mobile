

// class PlantTypeView extends StatelessWidget {
//   const PlantTypeView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       childAspectRatio: 174 / 100,
//       mainAxisSpacing: Dimens.d16.responsive(),
//       crossAxisSpacing: Dimens.d16.responsive(),
//       padding: EdgeInsets.symmetric(
//         horizontal: Dimens.d16.responsive(),
//       ),
//       children: List.generate(PlantTypes.values.length, (index) {
//         return Stack(
//           children: [
//             Image.asset(
//               PlantTypes.values[index].imagePath,
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: Dimens.d24.responsive(),
//                 bottom: Dimens.d24.responsive(),
//                 left: Dimens.d12.responsive(),
//                 right: Dimens.d24.responsive(),
//               ),
//               child: Text(
//                 PlantTypes.values[index].title,
//                 style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                       color: AppColors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }