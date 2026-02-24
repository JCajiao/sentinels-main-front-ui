import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsSkeleton extends StatefulWidget {
  const SentinelsSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = SentinelsRadius.sm,
  });

  final double? width;
  final double? height;
  final double borderRadius;

  @override
  State<SentinelsSkeleton> createState() => _SentinelsSkeletonState();
}

class _SentinelsSkeletonState extends State<SentinelsSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).sentinelsAdminTheme.borderColor;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height ?? 16,
          decoration: BoxDecoration(
            color: color.withValues(alpha: _animation.value),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        );
      },
    );
  }
}
