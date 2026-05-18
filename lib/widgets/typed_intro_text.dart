import 'package:flutter/material.dart';

import '../core/app_brand.dart';

class TypedIntroText extends StatefulWidget {
  const TypedIntroText({super.key});

  @override
  State<TypedIntroText> createState() => _TypedIntroTextState();
}

class _TypedIntroTextState extends State<TypedIntroText>
    with SingleTickerProviderStateMixin {
  static const _firstPhrase = 'Construieste-ti viitorul';
  static const _secondPhrase = 'Gaseste oportunitati reale';
  static const _firstWord = 'viitorul';
  static const _secondWord = 'reale';

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final state = _typingState(_controller.value);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFFFFFFFF), AppBrand.softBlue],
              ).createShader(bounds),
              child: _OutlinedWordText(
                text: state.text,
                outlinedWord: state.outlinedWord,
              ),
            ),
            const SizedBox(height: 12),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 160),
              opacity: state.showCursor ? 1 : 0,
              child: Container(
                width: 2,
                height: 24,
                decoration: BoxDecoration(
                  color: AppBrand.softBlue,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _IntroTypingState _typingState(double value) {
    if (value < 0.34) {
      return _IntroTypingState(
        text: _firstPhrase.substring(
          0,
          (value / 0.34 * _firstPhrase.length).floor(),
        ),
      );
    }
    if (value < 0.46) {
      return const _IntroTypingState(
        text: _firstPhrase,
        outlinedWord: _firstWord,
      );
    }
    if (value < 0.62) {
      final progress = (value - 0.46) / 0.16;
      final count = (_firstPhrase.length * (1 - progress)).floor();
      return _IntroTypingState(text: _firstPhrase.substring(0, count));
    }
    if (value < 0.90) {
      final progress = (value - 0.62) / 0.28;
      final count = (progress * _secondPhrase.length).floor();
      return _IntroTypingState(text: _secondPhrase.substring(0, count));
    }
    return const _IntroTypingState(
      text: _secondPhrase,
      outlinedWord: _secondWord,
    );
  }
}

class _IntroTypingState {
  const _IntroTypingState({required this.text, this.outlinedWord});

  final String text;
  final String? outlinedWord;

  bool get showCursor => outlinedWord == null;
}

class _OutlinedWordText extends StatelessWidget {
  const _OutlinedWordText({required this.text, this.outlinedWord});

  final String text;
  final String? outlinedWord;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displaySmall?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      height: 1.05,
    );
    final word = outlinedWord;
    if (word == null || !text.endsWith(word)) {
      return Text(
        text.isEmpty ? ' ' : text,
        textAlign: TextAlign.center,
        style: style,
      );
    }
    final prefix = text.substring(0, text.length - word.length);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: prefix),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              margin: const EdgeInsets.only(left: 3),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Colors.white, width: 1.4),
              ),
              child: Text(word, style: style),
            ),
          ),
        ],
      ),
    );
  }
}
