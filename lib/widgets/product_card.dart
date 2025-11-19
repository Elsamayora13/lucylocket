import 'package:flutter/material.dart';
import 'package:lucylocket/screens/productentry_form.dart';
import 'package:lucylocket/screens/menu.dart';
import 'package:lucylocket/screens/product_entry_list.dart'; 
import 'package:lucylocket/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Color backgroundColor;

    if (item.name == "All Products") {
      backgroundColor = Colors.blue;
    } else if (item.name == "My Products") {
      backgroundColor = Colors.green;
    } else if (item.name == "Create Product") {
      backgroundColor = Colors.red;
    } else {
      backgroundColor = Theme.of(context).colorScheme.secondary;
    }

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );

          // Navigasi ke halaman ProductEntryFormPage jika tombol "Create Product" ditekan
          if (item.name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          }else if (item.name == "All Products") {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryListPage(isMyProduct: false),
              ),
            );
          }else if (item.name == "My Products") {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const ProductEntryListPage(isMyProduct: true),
            ),
          );
        }
        else if (item.name == "Logout") {
                  final response = await request.logout(
                        "http://localhost:8000/auth/logout/");
                    String message = response["message"];
                    if (context.mounted) {
                        if (response['status']) {
                            String uname = response["username"];
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("$message See you again, $uname."),
                            ));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                        } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(message),
                                ),
                            );
                        }
                    }
        }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}