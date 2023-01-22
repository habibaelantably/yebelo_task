//
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// import 'package:yebelo_task/presentation_layer/views/home_screen_views/home_view.dart';
//
// class ProductsList extends StatelessWidget {
//
//   final int? id;
//   final int? availability;
//   final String? name;
//   final double? cost;
//   final String? details;
//   final String? category;
//   const ProductsList({Key? key,
//     required this.id,
//     required this.availability,
//     required this.name,
//     required this.cost,
//     required this.details,
//     required this.category,
//   }) : super(key: key);
//   //final HomeScreenCubit homeScreenCubit;
//
//   @override
//   Widget build(BuildContext context) {
//     // List<ProductDataModel> displayList =
//     // homeScreenCubit.productsList;
//     return  Expanded(
//       child: ListView.separated(
//           shrinkWrap: true,
//           itemBuilder: (context, index) => ProductCard(cost: cost, name: name,
//             availability: availability, category: category, details: details, id: id,),
//           separatorBuilder: (context, index) => SizedBox(height: 0.h,),
//           itemCount:3),
//     );
//   }
// }