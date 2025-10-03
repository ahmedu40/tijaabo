import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: const LoginScreen(), 
    );
  }
}

// ----------------------------------------------------
// LoginScreen oo ah StatefulWidget si ay u maamusho Controllers-ka
// ----------------------------------------------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginPressed() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      print('Galitaan la guuleystay!');
      print('Email: $email');
      print('Password: $password');
      
      // Halkan ku dar koodhka u gudbinta shaashadda xigta
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galitaanka App-ka'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView( 
          padding: const EdgeInsets.all(24.0), 
          child: Form(
            key: _formKey, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch, 
              children: <Widget>[
                // Summadda App-ka
                const Icon(
                  Icons.lock_open,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 40), 

                // Goobta Email-ka
                TextFormField(
                  controller: _emailController, 
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Fadlan geli email-kaaga',
                    border: OutlineInputBorder(), 
                    prefixIcon: Icon(Icons.email),
                  ),
                  // HAGAAJINTA: Waa 'TextInputType.emailAddress'
                  keyboardType: TextInputType.emailAddress, 
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fadlan geli email-kaaga';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20), 

                // Goobta Password-ka
                TextFormField(
                  controller: _passwordController, 
                  obscureText: true, 
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Fadlan geli password-kaaga',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fadlan geli password-kaaga';
                    }
                    if (value.length < 6) {
                      return 'Password-ku waa inuu ka badan yahay 6 xaraf';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30), 

                // Batoonka Galitaanka
                ElevatedButton(
                  onPressed: _loginPressed,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    backgroundColor: Colors.blue, 
                  ),
                  child: const Text(
                    'GAL',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20), 

                // Batoonka "Password-ka i hilmaamay"
                TextButton(
                  onPressed: () {
                    print('Password-ka la hilmaamay waa la riixay!');
                  },
                  child: const Text('Password-ka i hilmaamay?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}