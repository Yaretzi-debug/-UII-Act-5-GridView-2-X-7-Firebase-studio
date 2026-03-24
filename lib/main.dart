import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String imageUrl;
  final String name;
  final double rating;

  Product({
    required this.imageUrl,
    required this.name,
    required this.rating,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fresh tarts bakery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFCE4EC),
      ),
      home: const GridViewDemo(),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  static final List<Product> _products = [
    Product(name: 'Pastelito de Fresa', rating: 5.0, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/pastelito.jfif'),
    Product(name: 'Pastelería Especial', rating: 4.8, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/pasteleria.png'),
    Product(name: 'Pastel de Chocolate', rating: 4.9, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/pastel.webp'),
    Product(name: 'Panadería Artesanal', rating: 4.7, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/panaderia.webp'),
    Product(name: 'Macarons Variados', rating: 5.0, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/macaron.jfif'),
    Product(name: 'Nuestra Marca', rating: 5.0, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/logo.png'),
    Product(name: 'Galletas Premium', rating: 4.6, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/galletas.jfif'),
    Product(name: 'Galleta Gigante', rating: 4.9, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/galleta.jpg'),
    Product(name: 'Postre Especial', rating: 4.5, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/download.jpg'),
    Product(name: 'Cupcake de Vainilla', rating: 5.0, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/cupcake.jpg'),
    Product(name: 'Conejo de Buttercream', rating: 5.0, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/conejo-de-bizcocho-con-buttercream_2ad03934_1200x1200.jpg'),
    Product(name: 'Especialidad del Chef', rating: 4.8, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/chef.webp'),
    Product(name: 'Delicia del Día', rating: 4.9, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/4f59c06411873d236d904cc8a16f5d4b.jpg'),
    Product(name: 'Dona de cerdito con fresas', rating: 4.7, imageUrl: 'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/images.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fresh tarts bakery'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: _products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagen
          Expanded(
            flex: 7,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          // Nombre y estrellas
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      ...List.generate(5, (i) {
                        if (i < product.rating.floor()) {
                          return Icon(Icons.star, color: color, size: 18);
                        } else if (i == product.rating.floor() && (product.rating % 1) >= 0.5) {
                          return Icon(Icons.star_half, color: color, size: 18);
                        } else {
                          return Icon(Icons.star_border, color: color, size: 18);
                        }
                      }),
                      const SizedBox(width: 6),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}