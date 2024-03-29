import 'package:flutter/material.dart';
import 'package:launchhub_frontend/screens/auth_screens/signin.dart';
import 'package:launchhub_frontend/widgets/submit_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/splashscreen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.73,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/splashscreen-img.png', width: 300),
                const SizedBox(height: 15),
                Text('Welcome To LunchHub',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                          fontSize: 22,
                        )),
                const SizedBox(height: 15),
                Text(
                  'Launch your startup journey with a fresh perspective',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 18,
                        color: const Color.fromARGB(204, 232, 232, 232),
                      ),
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    'Join us on a dynamic startup journey,  where we empower your business.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: const Color.fromARGB(204, 204, 204, 204),
                        ),
                  ),
                ),
                const SizedBox(height: 55),
                SubmitButton('Get Started', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
