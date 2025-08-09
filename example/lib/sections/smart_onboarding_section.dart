import 'package:flutter/material.dart';
import 'package:smart_ui_kit/smart_ui_kit.dart';

class SmartOnboardingSection extends StatelessWidget {
  const SmartOnboardingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartSection(
      title: "Smart Onboarding",
      description:
          "A fully customizable onboarding flow with images, "
          "titles, descriptions, and custom content widgets.",
      children: [
        // Demo card with button
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // Background image with dark overlay
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/splash.jpg",
                      fit: BoxFit.cover,
                      color: Colors.black.withValues(alpha: 0.3),
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                  // Centered button to launch onboarding
                  Center(
                    child: SmartButtonAlt(
                      label: "Show Custom Onboarding",
                      backgroundColor: Colors.deepPurple,
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SmartOnboarding(
                              indicatorActiveColor: Colors.deepPurple,
                              indicatorInactiveColor: Colors.white70,
                              imageFullScreen: true,

                              // Skip button
                              skipButtonBuilder: (ctx, onPressed, isLast) =>
                                  TextButton.icon(
                                    onPressed: onPressed,
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      "Skip",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),

                              // Back button
                              backButtonBuilder: (ctx, onPressed, isLast) =>
                                  InkWell(
                                    onTap: onPressed,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                              // Next button
                              nextButtonBuilder: (ctx, onPressed, isLast) =>
                                  InkWell(
                                    onTap: onPressed,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                              // Done button
                              doneButtonBuilder: (ctx, onPressed, isLast) =>
                                  TextButton(
                                    onPressed: onPressed,
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Finish",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(Icons.check, color: Colors.white),
                                      ],
                                    ),
                                  ),

                              // Onboarding pages (inline for clarity)
                              pages: [
                                SmartOnboardingPage(
                                  customContent: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.deepPurple.shade400,
                                          Colors.deepPurple.shade100,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.palette_rounded,
                                          size: 80,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(height: 32),
                                        Text(
                                          "Design Your Way!",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          "Every element is customizable, including navigation buttons.",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SmartOnboardingPage(
                                  customContent: Container(
                                    color: Colors.orangeAccent,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.bolt_rounded,
                                          size: 80,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 32),
                                        Text(
                                          "Fast & Flexible",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          "Create onboarding flows that match your brand in seconds.",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SmartOnboardingPage(
                                  customContent: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.amber.shade400,
                                          Colors.amber.shade100,
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.celebration_rounded,
                                          size: 80,
                                          color: Colors.deepPurple,
                                        ),
                                        const SizedBox(height: 32),
                                        Text(
                                          "Ready to Go!",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: Colors.deepPurple,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          "Let's build something amazing together.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color:
                                                    Colors.deepPurple.shade700,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.amber[50],
                                ),
                              ],

                              onSkip: () => Navigator.pop(context),
                              onDone: () => Navigator.pop(context),
                              indicatorPosition: IndicatorPosition.bottom,
                              swipeEnabled: true,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
