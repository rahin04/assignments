
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextList extends StatefulWidget {
  @override
  _TextListState createState() => _TextListState();
}

class _TextListState extends State<TextList> {
  List<Item> items = [];
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Spacer(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Add Title',
              hintText: 'Add Title',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: 'Add Description',
              hintText: 'Add Description',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                addItem();
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white10,
                  padding: EdgeInsets.all(16),
                  child: ListTile(
                    title: Text(items[index].title),
                    subtitle: Text(items[index].description),
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onLongPress: () {
                      showOptionsDialog(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addItem() {
    String title = titleController.text;
    String description = descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      setState(() {
        items.add(Item(title, description));
        titleController.clear();
        descriptionController.clear();
      });
    }
  }

  void showOptionsDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          actions: <Widget>[
            TextButton(
              child: Text('Edit'),
              onPressed: () {
                Navigator.of(context).pop();
                showEditBottomSheet(index);
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  items.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showEditBottomSheet(int index) {
    String editedTitle = items[index].title;
    String editedDescription = items[index].description;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: editedTitle),
                onChanged: (value) {
                  editedTitle = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: editedDescription),
                onChanged: (value) {
                  editedDescription = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      items[index].title = editedTitle;
                      items[index].description = editedDescription;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Edit done'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Item {
  String title;
  String description;

  Item(this.title, this.description);
}