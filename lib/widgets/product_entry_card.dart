/*  */import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  String getReadableCategoryName(String categoryCode) {
    const categoryMapping = {
      'sepatu bola': 'Sepatu Bola',
      'jersey': 'Jersey',
      'bola': 'Bola',
      'aksesoris': 'Aksesoris',
      'alat latihan': 'Alat Latihan',
    };
    return categoryMapping[categoryCode] ?? categoryCode;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final categoryLabel = getReadableCategoryName(product.category);
    final isOwner = request.loggedIn && request.jsonData?['id'] == product.userId; // Assuming request has user data

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      shadowColor: Colors.blue.withOpacity(0.2),
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with overlays
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                    child: product.thumbnail != null && product.thumbnail!.isNotEmpty
                      ? Image.network(
                          'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail!)}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: const Color(0xFFE0F2FE),
                            child: const Center(child: Icon(Icons.sports_soccer, size: 48, color: Colors.blue)),
                          ),
                        )
                      : Container(
                          color: const Color(0xFFE0F2FE),
                          child: const Center(child: Icon(Icons.sports_soccer, size: 48, color: Colors.blue)),
                        ),
                  ),
                ),
                // Category Badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      categoryLabel,
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Featured Badge
                if (product.isFeatured)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFFA500)]),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: const Text(
                        '⭐ Featured',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                // Price Overlay
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Rp${product.price},00',
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: onTap,
                        icon: const Icon(Icons.visibility, size: 16),
                        label: const Text('View Details'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      if (isOwner)
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Edit action
                              },
                              icon: const Icon(Icons.edit, size: 16, color: Colors.blue),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            IconButton(
                              onPressed: () {
                                // Delete action
                              },
                              icon: const Icon(Icons.delete, size: 16, color: Colors.red),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                    ],
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
