import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shpopping_cart_provider_state_management/Cart_Provider.dart';
import 'package:shpopping_cart_provider_state_management/Product_list.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context){
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
      }),
       );
  }
}