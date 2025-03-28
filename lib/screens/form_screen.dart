import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/loading_overlay.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _isLoading = false;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final user = UserModel(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
    );

    final userRepository = context.read<UserRepository>();
    final result = await userRepository.registerUser(user);

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result['message']),
        backgroundColor: result['success'] ? Colors.green : Colors.red,
      ),
    );

    if (result['success']) {
      _resetForm();
    }
  }

  void _resetForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  validator:
                      (value) =>
                          value!.isEmpty ? 'Please enter your name' : null,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter an email';
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    return !emailRegex.hasMatch(value)
                        ? 'Invalid email format'
                        : null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _phoneController,
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a phone number';
                    final phoneRegex = RegExp(r'^\+?[0-9]{10,14}$');
                    return !phoneRegex.hasMatch(value)
                        ? 'Invalid phone number'
                        : null;
                  },
                ),
                SizedBox(height: 24),
                ElevatedButton(onPressed: _submitForm, child: Text('Register')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
