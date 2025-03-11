import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  /// ✅ Handles Sign Up Logic
  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      final user = await _authService.signUpWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (user != null) {
        // TODO: Navigate to home or profile setup page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sign up successful!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sign up failed. Please try again.")),
        );
      }
    }
  }

  /// ✅ Handles Anonymous Sign Up
  void _handleAnonymousSignUp() async {
    final user = await _authService.signUpAnonymously();
    if (user != null) {
      // TODO: Navigate to anonymous user flow
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signed up anonymously!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
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
                text: "Sign Up",
                onPressed: _handleSignUp,
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _handleAnonymousSignUp,
                child: const Text("Sign up anonymously"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
