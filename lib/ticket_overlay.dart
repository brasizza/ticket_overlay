library ticket_overlay;

import 'package:flutter/material.dart';
import 'package:ticket_overlay/default/shimmer_receipt.dart';

export 'default/shimmer_receipt.dart';

class TicketAnimation {
  static Widget get ticketDefault => const ShimmerPOSPlaceholder();
  static void show({
    double startAt = .5,
    required BuildContext context,
    required Duration duration,
    required Widget child,
    Alignment alignment = Alignment.center,
    Curve curve = Curves.easeInOut,
  }) {
    final overlayState = Overlay.of(context);

    late OverlayEntry overlayEntry; // Declare the variable as late.

    overlayEntry = OverlayEntry(
      builder: (context) => _OverlayAnimationWidget(
        startAt: startAt,
        duration: duration,
        curve: curve,
        alignment: alignment,
        child: child,
        onAnimationComplete: () {
          // Remove the overlay entry when the animation finishes.
          overlayEntry.remove();
        },
      ),
    );

    // Insert the overlay entry into the overlay.
    overlayState.insert(overlayEntry);
  }
}

class _OverlayAnimationWidget extends StatefulWidget {
  final Duration duration;
  final double startAt;
  final Curve curve;
  final Alignment alignment;
  final Widget child;
  final VoidCallback onAnimationComplete;

  const _OverlayAnimationWidget({required this.duration, required this.curve, required this.alignment, required this.child, required this.onAnimationComplete, required this.startAt});

  @override
  State<_OverlayAnimationWidget> createState() => _OverlayAnimationWidgetState();
}

class _OverlayAnimationWidgetState extends State<_OverlayAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: widget.startAt,
      end: -1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.curve,
      ),
    );

    _animationController.forward().then((_) {
      if (mounted) {
        widget.onAnimationComplete();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(
            0,
            MediaQuery.of(context).size.height * _animation.value,
          ),
          child: Align(
            alignment: widget.alignment,
            child: widget.child,
          ),
        );
      },
    );
  }
}
