import 'package:flutter/material.dart';

class MyData extends StatefulWidget {
  @override
  _MyDataState createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  final List<String> items = List<String>.generate(20, (i) => 'Text $i');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissible List Items',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dismissible List Items'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              key: Key(item),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });

                // Show a Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$item dismissed')),
                );

              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.warning,color: Colors.redAccent,),
                      Text("Item $item->Deleted")
                    ],
                    
                    
                  ),
                  content: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_forever,color: Colors.red,),

                      Text("The Item:- $item has been Deleted")
                    ],
                  ),
                  actions: [
                    TextButton(child: Text("Ok"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    autofocus: true,
                    )
                    
                  ],
                );
              }) ; // Show a dialog after dismissal
         
              },
              background: Container(color: Colors.red),
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        ),
      ),
    );
  }
}
