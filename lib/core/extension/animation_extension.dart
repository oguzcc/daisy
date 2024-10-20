import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AnimationExtension on Widget {
  // Effects run in parallel, but you can use a delay to run them sequentially:
  Animate get basic => animate().fade(duration: 500.ms).scale(delay: 500.ms);
  Animate get blur => animate()
      .fadeIn() // uses `Animate.defaultDuration`
      .scale() // inherits duration from fadeIn
      .move(
          delay: 300.ms,
          duration: 600.ms) // runs after the above w/new duration
      .blurXY();

  Animate get fadeIn => animate(
        delay: 1000.ms, // this delay only happens once at the very start
        onPlay: (controller) => controller.repeat(), // loop
      ).fadeIn(
          delay: 500.ms,
          curve: Curves.easeIn); // this delay happens at the start of each loop

  Animate get beginEnd => animate().fade(); // begin=0, end=1
  Animate get begin => animate().fade(begin: 0.5); // end=1
  Animate get end => animate().fade(end: 0.5); // begin=1

  Animate get then => animate()
      .fadeIn(duration: 600.ms)
      .then(delay: 200.ms) // baseline=800ms
      .slide();

  Animate get toggle => Animate().toggle(
        duration: 1.ms,
        builder: (_, value, __) => AnimatedContainer(
          duration: 1.seconds,
          color: value ? Colors.red : Colors.green,
        ),
      );

  Animate get swap => Animate().swap(builder: (_, __) => this);

  Animate get shader => animate()
      .shader(duration: 2.seconds)
      .fadeIn(duration: 300.ms); // shader can be combined with other effects

  Animate get callback => animate()
      .fadeIn(duration: 600.ms)
      .callback(duration: 300.ms, callback: (_) => debugPrint('halfway'));

  Animate get listen => animate()
      .fadeIn(curve: Curves.easeOutExpo)
      .listen(callback: (value) => debugPrint('current opacity: $value'));
}

extension AnimationListExtension on List<Widget> {
  AnimateList get columnAnimation =>
      animate(interval: 400.ms).fade(duration: 300.ms);
}
