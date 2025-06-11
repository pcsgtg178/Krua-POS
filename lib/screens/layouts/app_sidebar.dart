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
                      title: const Text('Tables', style: TextStyle(fontSize: 18, color: Colors.grey),),
                      onTap: () {
                        context.go('/tables');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.circle, size: 14),
                      title: const Text('Menu Items', style: TextStyle(fontSize: 18, color: Colors.grey),),
                      onTap: () {
                        context.go('/menu-items');
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('System Setup', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  leading: const Icon(Icons.menu),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.circle, size: 14),
                      title: const Text('User Management', style: TextStyle(fontSize: 18, color: Colors.grey),),
                      onTap: () {
                        context.go('/user-management');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.circle, size: 14),
                      title: const Text('List of Value', style: TextStyle(fontSize: 18, color: Colors.grey),),
                      onTap: () {
                        context.go('/lov');
                      },
                    ),
                  ],
                ),
              ]
          ),
        )
      )
    );
  }
}