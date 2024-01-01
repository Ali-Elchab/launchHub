import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:launchhub_frontend/screens/start_screen.dart';
import 'package:launchhub_frontend/widgets/auth_widgets/google_button.dart';
import 'package:launchhub_frontend/widgets/custom_appbar.dart';
import 'package:launchhub_frontend/widgets/input_field.dart';
import 'package:launchhub_frontend/widgets/submit_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  void _forgotPassword(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const StartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Sign In'),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/auth_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Centered content with fixed width
          Center(
            child: SizedBox(
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const HeaderSection(),
                  Text(
                    'Welcome Back to LaunchHub!\nYour Startup Oasis',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 35),
                  const InputField(
                    label: 'Email',
                  ),
                  const SizedBox(height: 16),
                  const InputField(label: 'Password', isPassword: true),
                  const SizedBox(height: 8),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          _forgotPassword(context);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF326789),
                          ),
                        ),
                      )),
                  const SizedBox(height: 40),
                  SubmitButton('Sign In', () {}),
                  const SizedBox(height: 30),
                  const DividerWithText(text: 'or continue with'),
                  const SizedBox(height: 16),
                  SocialSignInButton(
                    text: 'Google',
                    imagePath: 'assets/images/google_logo.png',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: "Don't have an account? ",
                            style: Theme.of(context).textTheme.bodySmall!),
                        TextSpan(
                          text: "Sign Up",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: const Color(0xFF326789)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StartScreen()),
                              );
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: FractionallySizedBox(
          heightFactor: 0.37,
          child: Image.asset('assets/logos/logo-nobg.ico'),
        ),
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(child: Divider(thickness: 2)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text, style: Theme.of(context).textTheme.labelSmall!),
        ),
        const Expanded(child: Divider(thickness: 2)),
      ],
    );
  }
}