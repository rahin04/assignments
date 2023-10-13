import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Item> items = [
    Item("Item 1", false),
    Item("Item 2", false),
    Item("Item 3", false),
    Item("Item 4", false),
    Item("Item 5", false),
    Item("Item 6", false),
    Item("Item 7", false),
    Item("Item 8", false),
    Item("Item 9", false),
    Item("Item 10", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection Screen"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            tileColor: item.selected ? Colors.blue : null,
            onTap: () {
              setState(() {
                item.selected = !item.selected;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int selectedCount = 0;

          for (Item item in items) {
            if (item.selected) {
              selectedCount++;
            }
          }
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Selected Items"),
                content: Text("Number of selected items: $selectedCount"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class Item {
  final String name;
  bool selected;

  Item(this.name, this.selected);
}
