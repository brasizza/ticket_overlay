library ticket_overlay;

// A library to provide a customizable overlay animation for tickets or similar UI elements.

import 'package:flutter/material.dart';
import 'package:ticket_overlay/default/shimmer_receipt.dart';

export 'default/shimmer_receipt.dart';

/// A utility class that provides ticket overlay animations.
///
/// It includes a default shimmer placeholder for a ticket and a method to
/// show an animated overlay with a custom widget.
class TicketAnimation {
  /// A default shimmer widget that can be used as a placeholder for tickets.
  static Widget get ticketDefault => const ShimmerPOSPlaceholder();

  /// Displays a custom overlay animation.
  ///
  /// [startAt]: Specifies the initial vertical position of the animation as a fraction of the screen height. Defaults to 0.5.
  /// [context]: The `BuildContext` of the widget where the overlay will be displayed.
  /// [duration]: The duration of the animation.
  /// [child]: The widget to display within the overlay.
  /// [alignment]: The alignment of the child widget within the overlay. Defaults to `Alignment.center`.
  static void show({
    double startAt = .5,
    required BuildContext context,
    required Duration duration,
    required Widget child,
    Alignment alignment = Alignment.center,
  }) {
    final overlayState = Overlay.of(context);

    // OverlayEntry for the animation overlay.
    late OverlayEntry overlayEntry;

    // Create the overlay entry with the custom animation widget.
    overlayEntry = OverlayEntry(
      builder: (context) => _OverlayAnimationWidget(
        startAt: startAt,
        duration: duration,
        alignment: alignment,
        child: child,
        onAnimationComplete: () {
          // Remove the overlay entry after the animation completes.
          overlayEntry.remove();
        },
      ),
    );

    // Insert the overlay entry into the current overlay state.
    overlayState.insert(overlayEntry);
  }
}

class _OverlayAnimationWidget extends StatefulWidget {
  final Duration duration;
  final double startAt;
  final Alignment alignment;
  final Widget child;
  final VoidCallback onAnimationComplete;

  /// A widget that handles the overlay animation logic.
  ///
  /// [duration]: Duration of the animation.
  /// [startAt]: Initial vertical offset of the animation.
  /// [alignment]: Alignment of the child widget in the overlay.
  /// [child]: The widget to display in the overlay.
  /// [onAnimationComplete]: Callback triggered when the animation completes.
  const _OverlayAnimationWidget({
    required this.duration,
    required this.alignment,
    required this.child,
    required this.onAnimationComplete,
    required this.startAt,
  });

  @override
  State<_OverlayAnimationWidget> createState() => _OverlayAnimationWidgetState();
}

class _OverlayAnimationWidgetState extends State<_OverlayAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with the specified duration.
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Create a Tween animation from the starting offset to -1.0 (out of screen).
    _animation = Tween<double>(
      begin: widget.startAt,
      end: -1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Forward the animation and call the completion callback when done.
    _animationController.forward().then((_) {
      if (mounted) {
        widget.onAnimationComplete();
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller to free up resources.
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        // Apply a vertical translation to the child widget based on the animation value.
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
