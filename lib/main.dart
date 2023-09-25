import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  ProductListState createState() {
    return ProductListState();
  }
}

class ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: "Product 1", price: 10),
    Product(name: "Product 2", price: 20),
    Product(name: "Product 3", price: 30),
    Product(name: "Product 4", price: 10),
    Product(name: "Product 5", price: 20),
    Product(name: "Product 6", price: 10),
    Product(name: "Product 7", price: 35),
    Product(name: "Product 8", price: 55),
    Product(name: "Product 9", price: 55),
    Product(name: "Product 10", price: 10),
    Product(name: "Product 11", price: 50),
    Product(name: "Product 12", price: 30),
    Product(name: "Product 13", price: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Product List')),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: ProductCounter(
              initialCount: products[index].count,
              BuyNow: () {
                setState(() {
                  products[index].incrementCount();
                  if (products[index].count == 5) {
                    showCongratulationsDialog(products[index].name);
                  }
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartPage(products: products);
              },
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void showCongratulationsDialog(String productName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You\'ve bought 5 $productName!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Product {
  final String name;
  final int price;
  int count = 0;

  Product({required this.name, required this.price});

  void incrementCount() {
    count++;
  }
}

class ProductCounter extends StatefulWidget {
  final VoidCallback BuyNow;
  final int initialCount;

  ProductCounter({required this.BuyNow, this.initialCount = 0});

  @override
  ProductCounterState createState() {
    return ProductCounterState();
  }
}

class ProductCounterState extends State<ProductCounter> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
              if (count == 5) {
                widget.BuyNow();
              }
            });
          },
          child: Text('Buy Now'),
        ),
      ],
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  int getTotalBoughtProducts() {
    return products.map((product) => product.count).fold(0, (a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Products Bought:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${getTotalBoughtProducts()}',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
