import 'package:flutter/material.dart';
import 'package:lucylocket/widgets/left_drawer.dart';
import 'package:lucylocket/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Elsa Mayora Sidabutar"; 
  final String npm = "2406353250"; 
  final String kelas = "A"; 

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.list_alt),
    ItemHomepage("My Products", Icons.inventory),
    ItemHomepage("Create Product", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lucy Locket',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // ======================== INFO CARDS ==========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Selamat datang di Lucy Locket",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // ======================== GRID ITEMS ==========================
            // Expanded SUPAYA TIDAK ERROR & BISA SCROLL
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.7,
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              content,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}
