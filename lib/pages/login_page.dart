import 'package:flutter/material.dart';
import '../routes.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// w Simulated login function
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, Routes.matchWithTherapist);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                hintText: "Email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email can't be empty";
                  final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                  return emailRegex.hasMatch(value) ? null : "Enter a valid email";
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hintText: "Password",
                controller: _passwordController,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.length < 8) return "Password must be at least 8 characters";
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Log In",
                onPressed: _handleLogin,
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement Forgot Password Flow
                },
                child: const Text("Forgot Password?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
