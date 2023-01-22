
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yebelo_task/bussiness_layer/counter_cubit/counter_cubit.dart';
import 'package:yebelo_task/presentation_layer/screens/cart_screen.dart';
import 'package:yebelo_task/presentation_layer/screens/description_screen.dart';
import 'package:yebelo_task/presentation_layer/screens/home_screen.dart';

class AppRouterNames {
  static const cartScreen = '/cartScreen';
  static const productDetailsScreen = '/productDetailsScreen';
  static const checkoutScreen = '/checkoutScreen';
}

class AppRouter {
  int? index;
  Route? onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>  const HomeScreen(),
        );
      case '/cartScreen':
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case '/productDetailsScreen':
        return MaterialPageRoute(
          builder: (_) =>  ProductDetailsScreen(
            name: (settings.arguments
          as Map<String, dynamic>)['productName'],
            id: (settings.arguments
            as Map<String, dynamic>)['productId'],
            cost: (settings.arguments
            as Map<String, dynamic>)['productCost'],
            image: (settings.arguments
            as Map<String, dynamic>)['productImage'],
            details: (settings.arguments
            as Map<String, dynamic>)['productDetails'],
            availableQuantity: (settings.arguments
            as Map<String, dynamic>)['availableQuantity'],
            category: (settings.arguments
            as Map<String, dynamic>)['productCategory'],
          ),
        );
      default:
        return null;
    }
  }
}
