import 'package:flutter/material.dart';

class SizeSelectionScreen extends StatefulWidget {
  @override
  _SizeSelectionScreenState createState() => _SizeSelectionScreenState();
}

class _SizeSelectionScreenState extends State<SizeSelectionScreen> {
  String selectedSize = "";
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void showSnackbar(String size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Selected Size: $size"),
      ),
    );
  }

  void selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
    showSnackbar(size);
  }

  Color getButtonColor(String size) {
    return size == selectedSize ? Colors.yellow : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Size Selection"),
      ),
      body: Center(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => selectSize("S"),
              style: ElevatedButton.styleFrom(backgroundColor: getButtonColor("S")),
              child: Text("S"),
            ),
            ElevatedButton(
              onPressed: () => selectSize("M"),
              style: ElevatedButton.styleFrom(backgroundColor: getButtonColor("M")),
              child: Text("M"),
            ),
            ElevatedButton(
              onPressed: () => selectSize("L"),
              style: ElevatedButton.styleFrom(backgroundColor: getButtonColor("L")),
              child: Text("L"),
            ),
            ElevatedButton(
              onPressed: () => selectSize("XL"),
              style: ElevatedButton.styleFrom(backgroundColor: getButtonColor("XL")),
              child: Text("XL"),
            ),
            ElevatedButton(
              onPressed: () => selectSize("XXL"),
              style: ElevatedButton.styleFrom(backgroundColor: getButtonColor("XXL")),
              child: Text("XXL"),
            ),
            ElevatedButton(
              onPressed: () => selectSize("XXXL"),
              style: ElevatedButton.styleFrom(backgroundColor: getButtonColor("XXXL")),
              child: Text("XXXL"),
            ),
          ],
        ),
      ),
    );
  }
}
