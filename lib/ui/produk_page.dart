import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {

  final List<Produk> _produkList = [
    Produk(
      id: "1",
      kodeProduk: 'A001',
      namaProduk: 'Kamera',
      hargaProduk: 5000000,
    ),
    Produk(
      id: "2",
      kodeProduk: 'A002',
      namaProduk: 'Kulkas',
      hargaProduk: 2500000,
    ),
    Produk(
      id: "3",
      kodeProduk: 'A003',
      namaProduk: 'Mesin Cuci',
      hargaProduk: 2000000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk Izza'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProdukForm()),
                );
                setState(() {});
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _produkList.length,
        itemBuilder: (context, index) {
          final produk = _produkList[index];
          return ItemProduk(produk: produk);
        },
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(produk: produk),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk ?? ''),
          subtitle: Text("Rp ${produk.hargaProduk}"),
        ),
      ),
    );
  }
}