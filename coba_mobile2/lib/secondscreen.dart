import 'package:coba_mobile2/thridpage.dart';
import 'package:flutter/material.dart';
import 'package:coba_mobile2/data_buku.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman List"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final DataBuku buku = listBuku[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(buku: buku),
                  ));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(buku.imageLink),
                  ),
                  Text(buku.title)
                ],
              ),
            ),
          );
        },
        itemCount: listBuku.length,
      ),
    );
  }
}
