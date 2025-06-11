import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppSidebar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: SafeArea(
          child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Krua POS', style: TextStyle(fontSize: 20, color: Colors.amber)),
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Sale', style: TextStyle(fontSize: 18, color: Colors.grey),),
                  onTap: (){
                    context.go('/sale');
                  },
                ),
                ExpansionTile(
                  title: const Text('Master Data', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  leading: const Icon(Icons.menu),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.circle, size: 14),
                      title: const Text('Item', style: TextStyle(fontSize: 18, color: Colors.grey),),
                      onTap: () {
                        context.go('/product-data');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.circle, size: 14),
                      title: const Text('Menu', style: TextStyle(fontSize: 18, color: Colors.grey),),
                      onTap: () {
                        context.go('/menu');
                      },
                    ),
                  ],
                ),
                // ExpansionTile(
                //   title: const Text('System Setup', style: TextStyle(fontSize: 18, color: Colors.grey)),
                //   leading: const Icon(Icons.menu),
                //   children: [
                //
                //   ],
                // ),
              ]
          ),
        )
      )
    );
  }
}