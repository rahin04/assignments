import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:homeActivity());
  }

}

class homeActivity extends StatelessWidget{
  const homeActivity({super.key});

  //final items = [
   // (icon: Icons.shopping_basket, name: 'Apples'),
   // (icon: Icons.shopping_basket, name: 'Bananas'),
   // (icon: Icons.shopping_basket, name: 'Milk'),
  //  (icon: Icons.shopping_basket, name: 'Bread'),
  //  (icon: Icons.shopping_basket, name: 'Eggs'),
 // ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("My shopping List"),
          titleSpacing: 0,
          centerTitle: true,
          toolbarHeight: 100,
          elevation: 70,
          backgroundColor: Colors.blue,

          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){},)
          ],

        ),
        body: ListView(
          children:[
              ListTile(

                title: Text("Apples"),
                leading: Icon(Icons.shopping_basket),

              ),
              ListTile(

                title: Text("Bananas"),
                leading: Icon(Icons.shopping_basket),

              ),
               ListTile(

                 title: Text("Bread"),
                 leading: Icon(Icons.shopping_basket),

            ),
            ListTile(

              title: Text("Milk"),
              leading: Icon(Icons.shopping_basket),

            ),
            ListTile(

              title: Text("Eggs"),
              leading: Icon(Icons.shopping_basket),

            ),
          ],
        ),
    );
  }
}



