import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'List',
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = <String>[];
  int counter = 0;
  int getTotal() {
    return items.fold(0, (total, item) {
      int? price = int.tryParse(item);
      if (price != null) {
        return total + price;
      } else {
        return total;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ...List.generate(
            items.length,
            (index) => TextField(
              onChanged: (value) => items[index] = value,
              decoration: InputDecoration(
                hintText: items[index],
                suffixIcon: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    items.remove(items[index]);
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          Text("Total price:${getTotal()}"),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () {
                  items.add('TextField ${counter + 1}');
                  counter++;
                  setState(() {});
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  items.clear();
                  counter = 0;
                  setState(() {});
                },
                child: const Text('Delete all'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
