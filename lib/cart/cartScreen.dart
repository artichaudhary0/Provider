import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List item = [];

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>FavScreen(item: item,)));


            },
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("index $index"),
                  trailing: GestureDetector(
                    onTap: () {
                      item.add(index);

                      print(item);
                    },
                    child: Icon(Icons.add),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class FavScreen extends StatelessWidget {
  List item = [];
  FavScreen({  required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("fav screen"),),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("index ${item[index]}"),
                  trailing: GestureDetector(
                    onTap: () {
                      item.remove(index);
                      print(item);
                    },
                    child: const Icon(Icons.remove),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



