import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(home:homeActivity());
  }

}

class homeActivity extends StatelessWidget{
  const homeActivity({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 70,
        backgroundColor: Colors.green,
        leading: Icon(Icons.add_business),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){},)
        ],

      ),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("This is a mod 5 assignment", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "My ",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                TextSpan(
                  text: "phone ",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
                TextSpan(
                  text: "name ",
                  style: TextStyle(fontSize: 16, color: Colors.purple),
                ),

                TextSpan(
                  text: "Your ",
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
                TextSpan(
                  text: "phone ",
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
                TextSpan(
                  text: "name",
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
              ],
            ),
          ),

    ],
      )
      )
    );
  }


}


//that is my code, update the code so the "my phone name and your phone name " text come in single line