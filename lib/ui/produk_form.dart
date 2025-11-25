import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';

// ignore: must_be_immutable
class ProdukForm extends StatefulWidget {
  Produk? produk;
  ProdukForm({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String judul = "TAMBAH PRODUK";
  String tombolSubmit = "SIMPAN";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  void isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK";
        tombolSubmit = "UBAH";
        _kodeProdukTextboxController.text = widget.produk!.kodeProduk ?? '';
        _namaProdukTextboxController.text = widget.produk!.namaProduk ?? '';
        _hargaProdukTextboxController.text =
            widget.produk!.hargaProduk.toString();
      });
    }
  }

  @override
  void dispose() {
    _kodeProdukTextboxController.dispose();
    _namaProdukTextboxController.dispose();
    _hargaProdukTextboxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeProdukTextField(),
                _namaProdukTextField(),
                _hargaProdukTextField(),
                const SizedBox(height: 20),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Textbox Kode Produk
  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  }

  // Textbox Nama Produk
  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  }

  // Textbox Harga Produk
  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Harga harus diisi";
        }
        if (int.tryParse(value) == null) {
          return "Harga harus berupa angka";
        }
        return null;
      },
    );
  }

  // Tombol Simpan / Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
      child: _isLoading
          ? const CircularProgressIndicator()
          : Text(tombolSubmit),
      onPressed: _isLoading ? null : _submitForm,
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulasi proses simpan/update
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$judul berhasil")),
        );

        Navigator.pop(context);
      });
    }
  }
}