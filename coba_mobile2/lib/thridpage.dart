import 'package:flutter/material.dart';
import 'package:coba_mobile2/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final DataBuku buku;
  const DetailPage({super.key, required this.buku});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.buku.title),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            alignment: Alignment.topCenter,
            child: Image.network(widget.buku.imageLink),
          ),
          Text(
            widget.buku.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(widget.buku.author),
          Text(widget.buku.country),
          Text(widget.buku.year),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchedURrl('https://spada.upnyk.ac.id/');
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchedURrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not Launch $_url');
    }
  }
}
