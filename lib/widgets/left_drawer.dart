import 'package:flutter/material.dart';
import 'package:lucylocket/screens/menu.dart';
import 'package:lucylocket/screens/productentry_form.dart';
import 'package:lucylocket/screens/product_entry_list.dart';

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
                Text(
                  'Lucy Locket',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Kelola produk toko kamu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          // ==================== HALAMAN UTAMA ====================
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),

          // ==================== TAMBAH PRODUK ====================
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),
              );
            },
          ),

          // ==================== PRODUCT LIST ====================
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Product List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProductEntryListPage(isMyProduct: false),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
