import 'package:flutter/material.dart';
import 'package:lucylocket/models/product_entry.dart';
import 'package:lucylocket/widgets/left_drawer.dart';
import 'package:lucylocket/screens/product_detail.dart';
import 'package:lucylocket/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool isMyProduct;

  const ProductEntryListPage({
    super.key,
    required this.isMyProduct,
  });

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  late Future<List<ProductEntry>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  Future<List<ProductEntry>> fetchProducts() async {
    final request = context.read<CookieRequest>();

    // URL sudah cukup, Django tahu user dari cookie
    String url = widget.isMyProduct
        ? "http://localhost:8000/json/my-products/"
        : "http://localhost:8000/json/";

    print("FETCH PRODUCT FROM → $url");

    final response = await request.get(url);

    List<ProductEntry> products = [];

    for (var item in response) {
      if (item != null) {
        products.add(ProductEntry.fromJson(item));
      }
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.isMyProduct ? "My Products" : "All Products")),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: futureProducts,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'There are no products yet.',
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              final product = snapshot.data![index];

              return ProductEntryCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
