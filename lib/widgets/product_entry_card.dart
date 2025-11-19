import 'package:flutter/material.dart';
import 'package:lucylocket/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                if (product.thumbnail != null && product.thumbnail!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail!)}',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.broken_image)),
                      ),
                    ),
                  ),
                const SizedBox(height: 8),
                
                // Product Name
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                
                // Price
                Text(
                  'Rp ${product.price.toString()}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 6),
                
                // Category
                Text('Category: ${product.category}'),
                const SizedBox(height: 6),
                
                // Description preview
                Text(
                  product.description.length > 100
                      ? '${product.description.substring(0, 100)}...'
                      : product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),
                
                // Stock info
                Row(
                  children: [
                    Text(
                      'Stock: ${product.stock}',
                      style: TextStyle(
                        color: product.stock > 0 ? Colors.black87 : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (product.color != null && product.color!.isNotEmpty) ...[
                      const SizedBox(width: 12),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: _parseColor(product.color!),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                
                // Featured indicator
                if (product.isFeatured)
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Featured',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to parse color string
  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }
}