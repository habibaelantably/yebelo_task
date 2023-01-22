
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yebelo_task/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:yebelo_task/data_layer/local/cache_helper.dart';
import 'counter_states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(InitialCounterState());

  static CounterCubit get(context)=>BlocProvider.of(context);

  int counter=1;

  void addCounter(BuildContext context,int index)async
  {
    if(counter != HomeScreenCubit.get(context).productsList[index]['p_availability']  &&
        HomeScreenCubit.get(context).productsList[index]['p_availability'] != 0 ){
    counter++;
    HomeScreenCubit.get(context).productsList[index]['p_availability']-1;
    await CacheHelper.saveDataSharedPreference(key: "Counter", value: counter);
    emit(PlusCounterState(counter));}
  }

  void minusCounter(BuildContext context,int index)async
  {
    if(counter != 1) {
      counter--;
      HomeScreenCubit.get(context).productsList[index]['p_availability']+1;
      await CacheHelper.saveDataSharedPreference(key: "Counter", value: counter);
      emit(MinusCounterState(counter));
    }


  }

}

