import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String RouteName="/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("detail"),
      ),
    );
  }
}