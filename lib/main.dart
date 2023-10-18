import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/config/app_router.dart';
import 'package:food_delivery/config/theme.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
// import 'package:food_delivery/screens/restaurant_details/restaurant_details_screen.dart';

import 'blocs/blocs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
     MultiBlocProvider(
        providers: [
    //       // BlocProvider(
    //       //   create: (context) => RestaurantsBloc(
    //       //     restaurantRepository: context.read<RestaurantRepository>(),
    //       //   ),
    //       // ),
    //       // BlocProvider(
    //       //   create: (context) => AutocompleteBloc(
    //       //     placesRepository: context.read<PlacesRepository>(),
    //       //   )..add(LoadAutocomplete()),
    //       // ),
          BlocProvider(
            create: (context) => FilterBloc(
            )..add(LoadFilter()),
          ),

          BlocProvider(
            create: (context) => BasketBloc()
            ..add(StartBasket()),
          ),
    //       // BlocProvider(
    //       //   create: (context) => LocationBloc(
    //       //     geolocationRepository: context.read<GeolocationRepository>(),
    //       //     placesRepository: context.read<PlacesRepository>(),
    //       //     localStorageRepository: context.read<LocalStorageRepository>(),
    //       //     restaurantRepository: context.read<RestaurantRepository>(),
    //       //   )..add(LoadMap()),
          // ),
        ],
      child: 
      MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      )
    )
      ;
  }
}



// import 'package:flutter/material.dart';

// class RestaurantDetailsScreen extends StatelessWidget {
//   const RestaurantDetailsScreen({super.key});

//   static const String routeName = '/Restaurant-details';

//   static Route route() {
//     return MaterialPageRoute(
//       builder: (_) => RestaurantDetailsScreen(),
//       settings: RouteSettings(name: routeName),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("RestaurantDetails"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/');
//           },
//           child: Text("Home Screen"),
//         ),
//       ),
//     );
//   }
// }
