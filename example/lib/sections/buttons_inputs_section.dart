import 'package:flutter/material.dart';
import 'package:smart_ui_kit/smart_ui_kit.dart';

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
          textColor: Colors.white,
          iconAfterLabel: true,
          backgroundColor: Colors.amber,
          fontSize: 16,
          borderRadius: 20,
          elevation: 0,
        ),
        const SizedBox(height: 16),
        SmartButtonAlt(
          isOutlined: true,
          label: "Cancel",
          onPressed: () {},
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

        SmartAnimation(
          animationType: AnimationType.slide,
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 700),
          child: SmartButtonAlt(
            label: "Subscribe Now",
            onPressed: () {},
            backgroundColor: Colors.deepPurpleAccent,
            textColor: Colors.white,
            fontSize: 18,
            borderRadius: 30,
            icon: const Icon(Icons.star, size: 20, color: Colors.white),
          ),
        ),

        const SizedBox(height: 16),
        SmartButtonAlt(
          label: "Edit Profile",
          onPressed: () {},
          textColor: Colors.white,
          borderColor: Colors.blueAccent,
          backgroundColor: Colors.teal,
          fontSize: 16,
          borderRadius: 40,

          icon: const Icon(Icons.edit, size: 18, color: Colors.white),
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
