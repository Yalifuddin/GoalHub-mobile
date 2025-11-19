import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productlist_form.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import 'package:football_shop/screens/login.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Icon(
                  Icons.sports_soccer,
                  size: 50,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  'GoalHub',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text("Your Ultimate Sports Equipment Store",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),

          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text('Product List'),
            onTap: () {
              // Route to Product list page with default filter 'all'
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEntryListPage(filter: 'all')),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.inventory_2),
            title: const Text('My Products'),
            onTap: () {
              // Route to Product list page with default filter 'all'
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEntryListPage(filter: 'my')),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Create Product'),
            // Bagian redirection ke ProductFormPage
            onTap: () {
              // routing ke ProductFormPage
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductFormPage(),
                  ));
            },
          ),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Route to Product list page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),

        ],
      ),
    );
  }
}