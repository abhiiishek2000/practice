import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen>
    with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Shaking Dialog Demo')),
        body: ShakeableDialog());
  }
}

class ShakeableDialog extends StatefulWidget {
  final Duration duration; // how fast to shake
  final double distance; // how far to shake

  const ShakeableDialog({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.distance = 6.0,
  }) : super(key: key);

  @override
  _ShakeableDialogState createState() => _ShakeableDialogState();
}

class _ShakeableDialogState extends State<ShakeableDialog>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          final dx = sin(_controller.value * 2 * pi) * widget.distance;
          return Transform.translate(
            offset: Offset(dx, 0),
            child: child,
          );
        },
        child: Center(
            child: Icon(Icons.arrow_forward, size: 32, color: Colors.indigo)));
  }
}
