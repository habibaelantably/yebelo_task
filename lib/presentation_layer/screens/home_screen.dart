
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:yebelo_task/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:yebelo_task/bussiness_layer/home_screen_cubit/home_screen_states.dart';
import 'package:yebelo_task/presentation_layer/constants/assets_manager.dart';
import 'package:yebelo_task/presentation_layer/constants/styles/colors.dart';
import 'package:yebelo_task/presentation_layer/routers/app_routers.dart';
import 'package:yebelo_task/presentation_layer/views/home_screen_views/home_view.dart';
import 'package:yebelo_task/presentation_layer/widgets/shared/regular_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String> productImages=[
    //   AssetsManager.apple,
    //   AssetsManager.mango,
    //   AssetsManager.banana,
    //   AssetsManager.orange,
    // ];
    return Scaffold(
        appBar: AppBar(
          title: const RegularText(
            text: 'Home',
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouterNames.cartScreen);
                },
                icon: const Icon(Icons.shopping_cart_rounded))
          ],
        ),
        body: BlocBuilder<HomeScreenCubit,HomeScreenStates>(
          builder: (BuildContext context, state) {
            return  SingleChildScrollView(
              child: Column(
                children:  [
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            HomeScreenCubit.get(context).filterValue='All';
                            HomeScreenCubit.get(context).getHomeData();
                          },
                          child: Container(
                            decoration:  const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: AppColor.green
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1.h),
                              child: const RegularText(text: 'All',),
                            ),
                          ),
                        ),
                        SizedBox(width: 1.h,),
                        InkWell(
                          onTap: (){
                            HomeScreenCubit.get(context).filterValue='Premium';
                            HomeScreenCubit.get(context).getHomeData();
                          },
                          child: Container(
                            decoration:  const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: AppColor.green
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1.h),
                              child: const RegularText(text: 'Premium',),
                            ),
                          ),
                        ),
                        SizedBox(width: 1.h,),
                        InkWell(
                          onTap: (){
                            HomeScreenCubit.get(context).filterValue='Tamilnadu';
                            HomeScreenCubit.get(context).getHomeData();
                          },
                          child: Container(
                            decoration:  const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: AppColor.green
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(1.h),
                              child: const RegularText(text: 'Tamilnadu',),
                            ),


                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      itemBuilder:(context,index)=>   ProductCard(
                          id: HomeScreenCubit.get(context).filterValue=='All' ?
                          HomeScreenCubit.get(context).productsList[index]['p_id']:
                          HomeScreenCubit.get(context).filteredProducts[index]['p_id'],

                          availableQuantity: HomeScreenCubit.get(context).filterValue=='All'?
                          HomeScreenCubit.get(context).productsList[index]['p_availability']:
                          HomeScreenCubit.get(context).filteredProducts[index]['p_availability'],

                          name: HomeScreenCubit.get(context).filterValue=='All'?
                          HomeScreenCubit.get(context).productsList[index]['p_name']:
                          HomeScreenCubit.get(context).filteredProducts[index]['p_name'],

                          cost: HomeScreenCubit.get(context).filterValue=='All'?
                          HomeScreenCubit.get(context).productsList[index]['p_cost']:
                          HomeScreenCubit.get(context).filteredProducts[index]['p_cost'],

                          details: HomeScreenCubit.get(context).filterValue=='All'?
                          HomeScreenCubit.get(context).productsList[index]['p_details']:
                          HomeScreenCubit.get(context).filteredProducts[index]['p_details'],

                          category:  HomeScreenCubit.get(context).filterValue=='All'?
                          HomeScreenCubit.get(context).productsList[index]['p_category']:
                          HomeScreenCubit.get(context).filteredProducts[index]['p_category'],

                        productImage: HomeScreenCubit.get(context).filterValue=='All'?
                        HomeScreenCubit.get(context).productsList[index]['p_image']:
                        HomeScreenCubit.get(context).filteredProducts[index]['p_image'],
                        index: index,
                      ),
                      separatorBuilder:(context,index)=> const SizedBox(height: 10,),
                      itemCount:HomeScreenCubit.get(context).filterValue=='All'?
                      HomeScreenCubit.get(context).productsList.length :
                      HomeScreenCubit.get(context).filteredProducts.length,
                      shrinkWrap: true,

                    ),
                  ),
                ],
              ),
            );
          },
        ));


  }
}
