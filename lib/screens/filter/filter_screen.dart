import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc';

import '/blocs/blocs.dart';
import '../../models/models.dart';
import 'widgets/widgets.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filters';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FilterScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider(
        //   create: (context) => FilterBloc()..add(LoadFilter()), // Provide the FilterBloc here
        //   child:
        Scaffold(
      appBar: AppBar(title: Text('Filter')),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FilterLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      child: Text('Apply'),
                      onPressed: () {
                        var categories = state.filter.categoryFilters
                            .where((filt) => filt.value)
                            .map((fli) => fli.category.name)
                            .toList();

                        var price = state.filter.priceFilters
                            .where((filt) => filt.value)
                            .map((fli) => fli.price.price)
                            .toList();

                        List<Restaurant> restaurants = Restaurant.restaurants
                            .where((restaurant) => categories.any((category) =>
                                restaurant.tags.contains(category)))
                            .where((restaurant) => price.any((price) =>
                                restaurant.priceCategory.contains(price)))
                            .toList();

                        Navigator.pushNamed(
                          context,
                          '/restaurant-listing',
                          arguments: restaurants,
                        );
                      },
                    );
                  } else {
                    return Text('Something went wrong.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            // CustomPriceFilter(),
            Text(
              'Category',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            // CustomCategoryFilter(),
          ],
        ),
      ),
    );
    // );
  }
}
