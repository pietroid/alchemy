import 'package:alchimia/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _player.setAsset('assets/music/background_music2.mp3');
      await _player.setLoopMode(LoopMode.one);
      await _player.play();
    } catch (_) {
      // Audio is non-critical; silently ignore errors
    }
  }

  Future<void> _navigateToCreation() async {
    await _player.stop();
    if (mounted) context.go('/creation');
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _navigateToCreation,
        behavior: HitTestBehavior.opaque,
        child: Center(
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
              BlocBuilder<SplashCubit, String>(
                builder: (context, subtitle) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 800),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: GlowingText(
                      key: ValueKey(subtitle),
                      text: subtitle,
                      style: const TextStyle(
                        fontFamily: 'Menlo',
                        color: Color(0xFFFFF1D1),
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
