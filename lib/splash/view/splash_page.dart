import 'package:alchemy/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 6, 6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: screenSize.width / 3,
              height: screenSize.height / 3,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () => context.go('/creation'),
              behavior: HitTestBehavior.opaque,
              child: GlowingText(
                text: 'tap to create now!',
                style: GoogleFonts.dmMono(
                  color: const Color(0xFFFFF1D1),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
