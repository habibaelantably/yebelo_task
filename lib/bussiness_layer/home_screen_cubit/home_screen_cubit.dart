
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yebelo_task/data_layer/model/product_model.dart';

import 'home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(InitialHomeScreenState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  List productsList = [];
  List filteredProducts=[];
  String? filterValue='All';


    Future<void> getHomeData() async {
      filteredProducts=[];
      productsList=[];
      emit(GetHomeDataLoadingState());
      final String response = await rootBundle.loadString('assets/json_file/sample.json');
      final data = await json.decode(response);
      if(filterValue=='All'){
        data['data'].forEach((product) {
          productsList.add(product);
        });
        print('All filter');
      }
      else{
        data['data'].forEach((product){
          if(filterValue==product['p_category']){
            filteredProducts.add(product);
          }

        });
      }

      emit(GetHomeDataSuccessState());

    }

}

