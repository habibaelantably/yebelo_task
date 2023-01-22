
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:yebelo_task/bussiness_layer/counter_cubit/counter_cubit.dart';
import 'package:yebelo_task/presentation_layer/constants/styles/colors.dart';
import 'package:yebelo_task/presentation_layer/routers/app_routers.dart';

import 'bloc_observer.dart';
import 'bussiness_layer/cart_cubit/cart_cubit.dart';
import 'bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'data_layer/local/cache_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeScreenCubit()..getHomeData()
        ),
        BlocProvider(
            create: (context) => CartCubit()..getCart(context: context)
        ),
        BlocProvider(
            create: (context) => CounterCubit()
        ),


      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  color: AppColor.white,
                ),
                centerTitle: true,
                elevation: 0.0,
                iconTheme: IconThemeData(color: Colors.white),
                actionsIconTheme: IconThemeData(color: Colors.white),
                backgroundColor: AppColor.appDefaultColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),

              ),
            ),
            onGenerateRoute: appRouter.onGenerateRoute,

          );
        },
      ),
    );
  }
}

