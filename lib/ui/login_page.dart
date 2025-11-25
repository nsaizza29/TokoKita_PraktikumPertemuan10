import 'package:flutter/material.dart';
import 'package:tokokita/ui/registrasi_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  void dispose() {
    _emailTextboxController.dispose();
    _passwordTextboxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Izza'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _emailTextField(),
                _passwordTextField(),
                const SizedBox(height: 20),
                _buttonLogin(),
                const SizedBox(height: 30),
                _menuRegistrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Textbox Email
  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email harus diisi';
        }
        return null;
      },
    );
  }

  // Textbox Password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password harus diisi";
        }
        return null;
      },
    );
  }

  // Tombol Login
  Widget _buttonLogin() {
    return ElevatedButton(
      child: _isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text("Login"),
      onPressed: _isLoading ? null : _loginProses,
    );
  }

  void _loginProses() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulasi proses login
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Berhasil")),
        );
      });
    }
  }

  // Menu ke halaman registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          "Registrasi",
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegistrasiPage()),
          );
        },
      ),
    );
  }
}