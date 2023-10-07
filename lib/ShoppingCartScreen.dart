import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<Item> cartItems = [
    Item('Polo', 'Black', 'L', 51.0, 1,
        'https://circleback.s3.ap-southeast-1.amazonaws.com/uploads/all/jlIueDtnyIOcyeCydn12xSvHzixujruA0jZ9VLME.png'),
    Item('T-Shirt', 'Gray', 'L', 30.0, 1,
        'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1686343279-img-3725-jpg-64838e65a46b3.jpg?crop=0.7265211640211641xw:1xh;center,top&resize=980:*'),
    Item('Sport Dress', 'Black', 'M', 43.0, 1,
        'https://image.made-in-china.com/43f34j00HKQabdLrOspt/Black-Men-Sports-Wear-with-Sleeve-Various-Lines.webp'),
  ];

  double totalAmount() {
    double total = 0;
    for (int i=0; i<cartItems.length;i++) {
      total += cartItems[i].price * cartItems[i].quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My Bag',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                width: 80.0,
                child: Image.network(
                  cartItems[index].imageUrl,
                  width: 60.0,
                  height: 60.0,
                  //fit: BoxFit.cover,
                ),
              ),
              title: Text(cartItems[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Color: ${cartItems[index].color}  Size: ${cartItems[index].size}'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (cartItems[index].quantity > 1) {
                              cartItems[index].quantity--;
                            }
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(cartItems[index].quantity.toString()),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            cartItems[index].quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Text(
                  '\$${(cartItems[index].price * cartItems[index].quantity).toStringAsFixed(2)}'),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // Ensure the Column takes minimum space
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Total Amount:'),
                  Spacer(),
                  Text("\$${totalAmount().toStringAsFixed(2)}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Congratulations!'),
                      ),
                    );
                  },
                  child: Text(
                    'CHECK OUT',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String color;
  final String size;
  final double price;
  int quantity;
  final String imageUrl;

  Item(this.name, this.color, this.size, this.price, this.quantity,
      this.imageUrl);
}
