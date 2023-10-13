import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  List<bool> selectedItems = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              setState(() {
                selectedItems[index] = !selectedItems[index];
              });
            },
            tileColor: selectedItems[index] ? Colors.blue : Colors.white,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int count = selectedItems.where((item) => item).length;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Selected Items'),
                content: Text('Number of selected items: $count'),
                actions: <Widget>[
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
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
