import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mujjistore/Screen/Sign%20up/signup.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

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
        
        // Social media icons with background
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialMediaIcon(
              icon: FontAwesomeIcons.facebook,
              color: Colors.blue,
              onPressed: () {
                // Facebook login action
              },
            ),
            const SizedBox(width: 20), // Spacing between icons
            _buildSocialMediaIcon(
              icon: FontAwesomeIcons.twitter,
              color: Colors.lightBlue,
              onPressed: () {
                // Twitter login action
              },
            ),
            const SizedBox(width: 20),
            _buildSocialMediaIcon(
              icon: FontAwesomeIcons.google,
              color: Colors.red,
              onPressed: () {
                // Google login action
              },
            ),
          ],
        ),
        const SizedBox(height: 40),
        
        // Navigation to signup page
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupView()),
                );
              },
              child: const Text(
                'Sign Up',
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
