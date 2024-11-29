import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ClothingScreen(),
    );
  }
}

class ClothingItem {
  final String name;
  final String description;
  final String price;
  final String image;

  ClothingItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class ClothingScreen extends StatefulWidget {
  const ClothingScreen({super.key});

  @override
  State<ClothingScreen> createState() => _ClothingScreenState();
}

class _ClothingScreenState extends State<ClothingScreen> {
  List<ClothingItem> clothes = [
    ClothingItem(
        name: "Jeans",
        image:
            "data:image/jpeg;base64,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",
        description: "Blue Jeans",
        price: "30"),
    ClothingItem(
        name: "Jacket",
        image:
            "https://cdni.llbean.net/is/image/wim/520163_699_41?hei=1095&wid=950&resMode=sharp2&defaultImage=llbprod/520163_699_41",
        description: "Blue Jacket",
        price: "100"),
    ClothingItem(
        name: "T-Shirt",
        image:
            "data:image/jpeg;base64,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",
        description: "White T-Shirt",
        price: "7")
  ];

  void addClothingItem() {
    String name = "";
    String description = "";
    String price = "";
    String image = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add a New Clothing Item"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: "Name"),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: "Image URL"),
                  onChanged: (value) {
                    image = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: "Description"),
                  onChanged: (value) {
                    description = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: "Price"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (name.isNotEmpty &&
                    image.isNotEmpty &&
                    description.isNotEmpty &&
                    price.isNotEmpty) {
                  setState(() {
                    clothes.add(ClothingItem(
                      name: name,
                      image: image,
                      description: description,
                      price: price,
                    ));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("211234",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(clothes[index].image, fit: BoxFit.cover),
              title: Text(clothes[index].name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('${clothes[index].price} \$'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: clothes[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addClothingItem();
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add_box),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final ClothingItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(item.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(item.image, fit: BoxFit.cover),
            ),
            Text(
              item.name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              item.description,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Price: ${item.price} \$',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
