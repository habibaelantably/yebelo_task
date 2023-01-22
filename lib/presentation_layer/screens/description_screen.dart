
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:yebelo_task/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:yebelo_task/bussiness_layer/home_screen_cubit/home_screen_states.dart';
import 'package:yebelo_task/presentation_layer/constants/styles/colors.dart';
import 'package:yebelo_task/presentation_layer/widgets/shared/regular_text.dart';

class ProductDetailsScreen extends StatelessWidget
{

  final int id;
  final String name;
  final int availableQuantity;
  final int cost;
  final String details;
  final String category;
  final String image;

   const ProductDetailsScreen({Key? key,
     required this.id,
     required this.name,
     required this.availableQuantity,
     required this.cost,
     required this.details,
     required this.category,
     required this.image,
   }) : super(key: key);


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const RegularText(text: 'Product details',),),
      body:  Padding(
        padding:  EdgeInsets.only(right: 2.0.w,left: 2.0.w,top: 1.h),
        child: SingleChildScrollView(
          child: BlocBuilder<HomeScreenCubit,HomeScreenStates>(
            builder: (BuildContext context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image,width: 90.w,),
                  SizedBox(height: 5.0.h,),
                  RegularText(text: name,color: AppColor.black,fontSize: 16.sp,),
                  SizedBox(height: 2.h,),
                  Row(
                    children:  [
                      RegularText(text:'price:',color: AppColor.black,fontWeight: FontWeight.bold,fontSize: 14.sp),
                      RegularText(text: cost.toString(),color: AppColor.grey,fontSize: 12.sp),
                    ],
                  ),

                  SizedBox(height: 2.h,),
                  RegularText(text:'description:',fontWeight: FontWeight.bold,color: AppColor.black,fontSize: 14.sp),
                  SizedBox(height: 1.h,),
                  RegularText(text:details,color: AppColor.greyOfText,),
                  SizedBox(height: 2.h,),
                  RegularText(text:'Category:',fontWeight: FontWeight.bold,color: AppColor.black,fontSize: 14.sp),
                  SizedBox(height: 1.h,),
                  RegularText(text:category,color: AppColor.greyOfText,),
                  SizedBox(height: 2.h,),
                  RegularText(text:'Available Quantity:',fontWeight: FontWeight.bold,color: AppColor.black,fontSize: 14.sp),
                  SizedBox(height: 1.h,),
                  RegularText(text:availableQuantity.toString(),color: AppColor.greyOfText,),

                ],
              );
            },
          ),
        ),
      ),

    );
  }

}