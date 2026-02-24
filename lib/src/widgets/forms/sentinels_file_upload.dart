import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsFileUpload extends StatelessWidget {
  const SentinelsFileUpload({
    super.key,
    required this.onFileSelected,
    this.label = 'Drop files here or click to upload.',
    this.height = 150,
  });

  final VoidCallback onFileSelected;
  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;

    return InkWell(
      onTap: onFileSelected,
      borderRadius: BorderRadius.circular(SentinelsRadius.md),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: adminTheme.contentBackground,
          borderRadius: BorderRadius.circular(SentinelsRadius.md),
          border: Border.all(
            color: adminTheme.borderColor,
            width: 2,
            style: BorderStyle
                .solid, // In a real app with dotted_border package we could use a dotted line here
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_upload_outlined,
              size: 48,
              color: theme.primaryColor.withValues(alpha: 0.5),
            ),
            const SizedBox(height: SentinelsSpacing.md),
            Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: adminTheme.contentOnBackground.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
