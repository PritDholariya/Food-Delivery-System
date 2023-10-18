import 'package:equatable/equatable.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/models/models.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.tags,
    required this.menuItems,
    required this.priceCategory,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
  });

  List<Object?> get props => [
        id,
        name,
        imageUrl,
        tags,
        menuItems,
        priceCategory,
        deliveryFee,
        distance
      ];
  // static List<Category> categories = [

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: 'Golden Ice 1',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXDLIebAK26AjV_0t7SZ_icirDxFiA6XMz3aPhFzyBuo78OMOMas1g1vmOqQDwbqnAqHQ&usqp=CAU',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .map((menuItems) => menuItems.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      priceCategory: '\$',
      deliveryTime: 30,
      deliveryFee: 3,
      distance: 2,
    ),
    Restaurant(
      id: 2,
      name: 'Golden Ice 2',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXDLIebAK26AjV_0t7SZ_icirDxFiA6XMz3aPhFzyBuo78OMOMas1g1vmOqQDwbqnAqHQ&usqp=CAU',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 2)
          .map((menuItems) => menuItems.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      priceCategory: '\$',
      deliveryTime: 30,
      deliveryFee: 3,
      distance: 2,
    ),
    Restaurant(
      id: 3,
      name: 'Golden Ice 3',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXDLIebAK26AjV_0t7SZ_icirDxFiA6XMz3aPhFzyBuo78OMOMas1g1vmOqQDwbqnAqHQ&usqp=CAU',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .map((menuItems) => menuItems.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      priceCategory: '\$',
      deliveryTime: 30,
      deliveryFee: 3,
      distance: 2,
    ),
    Restaurant(
      id: 4,
      name: 'Golden Ice 4',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXDLIebAK26AjV_0t7SZ_icirDxFiA6XMz3aPhFzyBuo78OMOMas1g1vmOqQDwbqnAqHQ&usqp=CAU',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .map((menuItems) => menuItems.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      priceCategory: '\$',
      deliveryTime: 30,
      deliveryFee: 3,
      distance: 2,
    ),
  ];
}
