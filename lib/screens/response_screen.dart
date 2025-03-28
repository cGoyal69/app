import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ResponseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the user data passed from the previous screen
    final UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Confirmation'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Registration Successful!',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  _buildInfoRow(
                    context, 
                    icon: Icons.person, 
                    label: 'Name', 
                    value: user.name
                  ),
                  SizedBox(height: 16),
                  _buildInfoRow(
                    context, 
                    icon: Icons.email, 
                    label: 'Email', 
                    value: user.email
                  ),
                  SizedBox(height: 16),
                  _buildInfoRow(
                    context, 
                    icon: Icons.phone, 
                    label: 'Phone', 
                    value: user.phone
                  ),
                  SizedBox(height: 16),
                  _buildInfoRow(
                    context, 
                    icon: Icons.numbers, 
                    label: 'Registration ID', 
                    value: user.id?.toString() ?? 'N/A'
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Back to Registration'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}