import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Modulos')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: const [
            CardWidget(
              backgroundColor: Colors.green,
              icon: Icons.account_box,
              text: 'Proveedores',
              route: 'providers')
            ,
            CardWidget(
              backgroundColor: Colors.green,
              icon: Icons.shop,
              text: 'Productos',
              route: 'products',
            ),
            CardWidget(
              backgroundColor: Colors.green,
              icon: Icons.category,
              text: 'Categorias',
              route: 'categories',
            ),
          ]
        )
      ),
    );
  }
}