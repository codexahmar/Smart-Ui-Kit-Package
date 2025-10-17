// lib/sections/buttons_inputs_section.dart
import 'package:flutter/material.dart';
import 'package:smart_ui/widgets/smart_section.dart';
import 'package:smart_ui/widgets/smart_button.dart';
import 'package:smart_ui/widgets/smart_input.dart';

class ButtonsInputsSection extends StatelessWidget {
  const ButtonsInputsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Buttons & Inputs",
      description: "Animated buttons and input fields.",
      children: [
        SmartButtonAlt(
          label: "Get Started",
          icon: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
          onPressed: () {},
          backgroundColor: Colors.teal,
          textColor: Colors.white,
          fontSize: 16,
          borderRadius: 20,
        ),
        const SizedBox(height: 16),
        SmartButtonAlt(
          isOutlined: true,
          label: "Cancel",
          onPressed: () {},
          backgroundColor: Colors.transparent,
          borderColor: Colors.red,
          textColor: Colors.red,
          fontSize: 15,
          borderRadius: 16,
        ),
        const SizedBox(height: 16),
        SmartButtonAlt(
          label: "Learn More",
          onPressed: () {},
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black87,
          elevation: 0,
          borderRadius: 8,
          fontSize: 14,
          icon: const Icon(Icons.info_outline, size: 18, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        SmartButtonAlt(
          label: "Dark Action",
          onPressed: () {},
          backgroundColor: Colors.black,
          textColor: Colors.white,
          borderRadius: 10,
          fontSize: 15,
          icon: const Icon(
            Icons.nightlight_round,
            size: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        SmartButtonAlt(
          label: "Subscribe Now",
          onPressed: () {},
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 18,
          borderRadius: 30,
          elevation: 6,
          icon: const Icon(Icons.star, size: 20, color: Colors.white),
        ),
        const SizedBox(height: 16),
        SmartButtonAlt(
          label: "Edit Profile",
          onPressed: () {},
          isOutlined: true,
          borderColor: Colors.blueAccent,
          textColor: Colors.blueAccent,
          fontSize: 16,
          borderRadius: 40,
          icon: const Icon(Icons.edit, size: 18, color: Colors.blueAccent),
        ),
        const SizedBox(height: 24),
        SmartInput(
          label: "Email",
          hint: "Enter your email",
          prefixIcon: const Icon(Icons.email),
        ),
        const SizedBox(height: 16),
        SmartInput(
          label: "Username",
          hint: "Type here...",
          textColor: Colors.deepPurple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
          ),
        ),
        const SizedBox(height: 16),
        SmartInput(
          label: "Description",
          maxLines: 5,
          minLines: 3,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(height: 16),
        SmartInput(
          label: "Password",
          hint: "Enter your password",
          obscureText: true,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: const Icon(Icons.visibility_off),
        ),
        const SizedBox(height: 16),
        SmartInput(
          label: "Full Name",
          hint: "Type your full name",
          textCapitalization: TextCapitalization.words,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          prefixIcon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
