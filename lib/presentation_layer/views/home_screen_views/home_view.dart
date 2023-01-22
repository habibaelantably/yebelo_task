import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:yebelo_task/bussiness_layer/cart_cubit/cart_cubit.dart';
import 'package:yebelo_task/bussiness_layer/counter_cubit/counter_cubit.dart';
import 'package:yebelo_task/bussiness_layer/counter_cubit/counter_states.dart';
import 'package:yebelo_task/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:yebelo_task/presentation_layer/constants/styles/colors.dart';
import 'package:yebelo_task/presentation_layer/routers/app_routers.dart';
import 'package:yebelo_task/presentation_layer/widgets/shared/regular_text.dart';

class ProductCard extends StatelessWidget {
  final int? id;
  final int? availableQuantity;
  final String? name;
  final int? cost;
  final String? details;
  final String? category;
  final String? productImage;
  final int? index;

  const ProductCard({
    Key? key,
    required this.id,
    required this.availableQuantity,
    required this.name,
    required this.cost,
    required this.details,
    required this.category,
    required this.productImage,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context,
                AppRouterNames.productDetailsScreen,
                arguments: {
                  "productId":id,
                  "productName": name,
                  "productImage":productImage,
                  "productCost": cost,
                  "productDetails": details,
                  "productCategory": category,
                  "availableQuantity": availableQuantity,
                });

          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0.w),
            ),
            elevation: 5.0,
            child: Row(
              children: [
                Container(
                  height: 18.h,
                  width: 30.w,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(productImage!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: RegularText(text: name!,color: AppColor.black,),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(child:  RegularText(text:'Price: $cost',color: AppColor.black,),),
                    const SizedBox(
                      height: 10,
                    ),
                    RegularText(text: 'available quantity: $availableQuantity',color: AppColor.black,),

                    BlocBuilder<CounterCubit, CounterStates>(
                      builder: (BuildContext context, state) {
                        return Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    CounterCubit.get(context).addCounter(context,index!);
                                  },
                                  child: Container(
                                    height: 4.h,
                                    width: 7.w,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: const FittedBox(
                                        child: Center(
                                            child: Text(
                                      '+',
                                    ))),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 1.h),
                                  child: Text(CounterCubit.get(context).counter.toString()),
                                ),
                                InkWell(
                                  onTap: () {
                                    CounterCubit.get(context).minusCounter(context,index!);
                                  },
                                  child: Container(
                                    height: 4.h,
                                    width: 7.w,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: const FittedBox(
                                        child: Center(
                                            child: Text(
                                      '-',
                                    ))),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 35.w,),
                            InkWell(
                              onTap: (){
                                if(HomeScreenCubit.get(context).productsList[index!]['p_availability']==0){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text("This product is not available at this moment"),
                                        actions: [
                                      TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      )
                                        ],
                                      );
                                    },
                                  );
                                 //showToast(text: 'This product is not available at this moment', state:ToastStates.ERROR);
                                }
                                else{
                                CartCubit.get(context).addToCart(
                                    productId: id!,
                                    productImage:productImage! ,
                                    productTitle:name!,
                                    productPrice:cost!,
                                    context: context);}
                              },
                              child: CircleAvatar(
                                  radius: 2.h,
                                  backgroundColor: AppColor.appDefaultColor,
                                  child: const Icon(
                                    Icons.shopping_cart_rounded,
                                    color: AppColor.white,
                                  )),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

