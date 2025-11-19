import 'package:flutter/material.dart';
import 'package:lucylocket/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  Color _parseColor(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return Colors.grey;
    }
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image
            if (product.thumbnail != null && product.thumbnail!.isNotEmpty)
              Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail!)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.black87),
                          SizedBox(width: 4),
                          Text(
                            'Featured',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Price
                  Text(
                    'Rp ${product.price.toString()}',
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Category and Stock
                  Row(
                    children: [
                      // Category badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // Stock indicator
                      Icon(
                        Icons.inventory_2,
                        size: 16,
                        color: product.stock > 0 ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Stock: ${product.stock}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: product.stock > 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Color indicator
                  if (product.color != null && product.color!.isNotEmpty)
                    Row(
                      children: [
                        const Text(
                          'Color: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: _parseColor(product.color),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          product.color!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  
                  const Divider(height: 32),

                  // Description title
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Full description
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),

                  // Add to cart button (optional)
                  if (product.stock > 0)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product.name} added to cart!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  
                  // Out of stock message
                  if (product.stock <= 0)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.warning, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            'Out of Stock',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}