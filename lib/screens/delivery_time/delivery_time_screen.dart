import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({super.key});

   static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => DeliveryTimeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DeliveryTime"),
      
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text("Home Screen"),
            ),
      ),
    );
  }
}