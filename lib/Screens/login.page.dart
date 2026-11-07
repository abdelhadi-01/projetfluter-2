
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();
      final ValueNotifier<bool> _passwordVisible = ValueNotifier<bool>(false);

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
    final regexp = RegExp(emailPattern);

    if (!regexp.hasMatch(value)) {
      return 'Enter a valid Email';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          "Login Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),

                Image.asset(
                  "images/avatare.png",
                  width: 80,
                  height: 80,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Welcome back !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),

                const SizedBox(height: 30),

                
ValueListenableBuilder<bool>(
  valueListenable: _passwordVisible,
  builder: (context, passwordVisible, child) {
    return TextFormField(
      controller: _passwordController,
      obscureText: !passwordVisible,
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            _passwordVisible.value = !_passwordVisible.value;
          },
          icon: Icon(
            passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
          ),
        ),
      ),
      validator: _validatePassword,
    );
  },
),


                const SizedBox(height: 30),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    final emailError =
                        _validateEmail(_emailController.text);

                    final passwordError =
                        _validatePassword(_passwordController.text);

                    if (emailError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(emailError)),
                      );
                    } else if (passwordError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(passwordError)),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Formulaire valide"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
