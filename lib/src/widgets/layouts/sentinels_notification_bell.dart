import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsNotificationBell extends StatelessWidget {
  const SentinelsNotificationBell({
    super.key,
    required this.itemCount,
    required this.onTap,
  });

  final int itemCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final adminTheme = Theme.of(context).sentinelsAdminTheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.notifications_none,
              color: adminTheme.topBarOnBackground),
          onPressed: onTap,
        ),
        if (itemCount > 0)
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: SentinelsColors.danger,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                itemCount > 99 ? '99+' : itemCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
