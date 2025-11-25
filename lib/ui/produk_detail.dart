import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/produk_page.dart';

// Jika belum ada, sementara buat dummy class agar tidak error saat compile
class ProdukBloc {
  static Future<bool> deleteProduk({required int id}) async {
    return Future.value(true);
  }
}

class WarningDialog extends StatelessWidget {
  final String description;
  const WarningDialog({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(description),
    );
  }
}

// ignore: must_be_immutable
class ProdukDetail extends StatefulWidget {
  Produk? produk;
  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    // Proteksi null
    if (widget.produk == null) {
      return const Scaffold(
        body: Center(child: Text("Data produk tidak tersedia")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk Izza'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Kode : ${widget.produk!.kodeProduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaProduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp ${widget.produk!.hargaProduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: const Text("EDIT"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(
                  produk: widget.produk!,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        // Tombol Hapus
        OutlinedButton(
          child: const Text("DELETE"),
          onPressed: confirmHapus,
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        // Tombol ya
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () async {
            try {
              final id = int.tryParse(widget.produk!.id ?? '');

              if (id == null) {
                throw Exception("ID tidak valid");
              }

              await ProdukBloc.deleteProduk(id: id);

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const ProdukPage()),
                (route) => false,
              );
            } catch (e) {
              showDialog(
                context: context,
                builder: (context) => const WarningDialog(
                  description: "Hapus gagal, silakan coba lagi",
                ),
              );
            }
          },
        ),
        // Tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }
}