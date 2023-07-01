import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList();
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<String> propList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List'),
      ),
      body: ListView.builder(
        itemCount: propList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context,index)=> Text(propList[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => propList.add('text')),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}