import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController animationController;
  late final Animation<double> animationIcon1;
  late final Animation<double> animationIcon2;

  double position = 0;
  final duration = const Duration(seconds: 3);
  final curve = Curves.ease;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        position = MediaQuery.of(context).size.height;
      });
    });

    animationController = AnimationController(vsync: this, duration: duration);
    animationIcon1 = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 1), weight: 0.5),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 1, end: 0), weight: 0.5),
      ],
    ).chain(CurveTween(curve: Curves.easeInCirc)).animate(animationController);

    animationIcon2 = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 1), weight: 0.5),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 1, end: 0), weight: 0.5),
      ],
    ).chain(CurveTween(curve: Curves.bounceInOut)).animate(animationController);

    Future.delayed(const Duration(seconds: 2), () => scrollTo());
  }

  scrollTo() => socialWidget()
      .whenComplete(() => animateSocialWidgets())
      .whenComplete(() => initialPosition());

  socialWidget() =>
      _scrollController.animateTo(position, duration: duration, curve: curve);

  animateSocialWidgets() => animationController.forward();

  initialPosition() =>
      _scrollController.animateTo(0, duration: duration, curve: curve);

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: ListView(
            controller: _scrollController,
            children: [
              GestureDetector(
                onTap: () {},
                child: const FlutterLogo(
                  size: 110,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'Do excepteur tempor culpa dolore dolore. Cillum ea velit ad nisi esse. Incididunt proident dolor officia duis ut tempor. Et sit est ad officia proident.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Trocar Senha'),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Login Social:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.add_event,
                      progress: animationIcon1,
                      size: 32,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.add_event,
                      progress: animationIcon2,
                      size: 32,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
