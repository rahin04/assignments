import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Orientation",
      home: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return OrientationScreen();
  }

}

class OrientationScreen extends State<HomePage>{
  @override
  var items=[
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},
    {'img':'https://as1.ftcdn.net/v2/jpg/05/67/53/88/1000_F_567538837_sJqS6Kpt2xmj5GNAyfjcV5BgdsoTpYCs.jpg'},

  ];
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: OrientationBuilder(builder: (BuildContext context, Orientation orientation){
          if(orientation==Orientation.portrait){

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child:
                    Container(
                      height: 200,
                      width: 200,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child:ClipOval(
                        child: Image.network(
                          'https://as2.ftcdn.net/v2/jpg/05/62/99/31/1000_F_562993122_e7pGkeY8yMfXJcRmclsoIjtOoVDDgIlh.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text("John Doe", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Lorem ipsum dolor sit amel, consectetur adipiscing elit. Sed aliquet turpis eu enim tristique, in iaculis libero porttitor"),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){},
                          child: Container(
                            //margin: EdgeInsets.all(0),
                            width: 100,
                            height: 100,
                            child: Image.network(items[index]['img']!,fit: BoxFit.fill),

                          ),
                        );
                      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1.2
                    ),

                    ),
                  )

                ],
              ),

            );
          }
          else{
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child:ClipOval(
                    child: Image.network(
                      'https://as2.ftcdn.net/v2/jpg/05/62/99/31/1000_F_562993122_e7pGkeY8yMfXJcRmclsoIjtOoVDDgIlh.jpg', // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,

                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        child: Text(
                          "Lorem ipsum dolor sit amel, consectetur adipiscing elit. Sed aliquet turpis eu enim tristique, in iaculis libero porttitor",
                          //textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child:
                  GridView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            items[index]['img']!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.2,
                    ),
                  ),

                ),
              ],
            );

          }
        },

        )
    );
  }

}

