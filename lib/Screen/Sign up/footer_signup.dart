import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mujjistore/Screen/Login/loginscreen.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "------- Or sign in with -------",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        
        // Social media icons with spacing and rounded background
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialMediaIcon(
              icon: FontAwesomeIcons.facebook,
              color: Colors.blue,
              onPressed: () {
                // Add Facebook sign-in logic
              },
            ),
            const SizedBox(width: 20), // Spacing between icons
            _buildSocialMediaIcon(
              icon: FontAwesomeIcons.twitter,
              color: Colors.lightBlue,
              onPressed: () {
                // Add Twitter sign-in logic
              },
            ),
            const SizedBox(width: 20),
            _buildSocialMediaIcon(
              icon: FontAwesomeIcons.google,
              color: Colors.red,
              onPressed: () {
                // Add Google sign-in logic
              },
            ),
          ],
        ),
        const SizedBox(height: 40),
        
        // Navigation to login screen
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account? ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: const Text(
                'Log In',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialMediaIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.1), // Light background for icons
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }
}

