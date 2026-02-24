import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsAuthLayout extends StatelessWidget {
  const SentinelsAuthLayout({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.imageSide,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final Widget? imageSide;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 992;
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;
    final isDark = theme.brightness == Brightness.dark;

    final Widget logo = isDark
        ? Image.asset('assets/logos/sentinels-white-no-tagline-hub.png',
            package: 'sentinels_main_front_ui', height: 48)
        : Image.asset('assets/logos/sentinels-no-tagline-hub.png',
            package: 'sentinels_main_front_ui', height: 48);

    if (isDesktop) {
      return Scaffold(
        backgroundColor: adminTheme.contentBackground,
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: theme.primaryColor,
                child: imageSide ??
                    const Center(
                      child: Icon(Icons.security,
                          size: 200, color: Colors.white24),
                    ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(child: logo),
                      const SizedBox(height: SentinelsSpacing.xxl),
                      if (title != null) ...[
                        Text(
                          title!,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: adminTheme.contentOnBackground,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: SentinelsSpacing.sm),
                      ],
                      if (subtitle != null) ...[
                        Text(
                          subtitle!,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color:
                                adminTheme.contentOnBackground.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: SentinelsSpacing.xxl),
                      ],
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: adminTheme.contentBackground,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(SentinelsSpacing.xl),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              elevation: SentinelsElevation.sm,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SentinelsRadius.lg),
              ),
              child: Padding(
                padding: const EdgeInsets.all(SentinelsSpacing.xxl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: logo),
                    const SizedBox(height: SentinelsSpacing.xxl),
                    if (title != null) ...[
                      Text(
                        title!,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: adminTheme.contentOnBackground,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: SentinelsSpacing.sm),
                    ],
                    if (subtitle != null) ...[
                      Text(
                        subtitle!,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color:
                              adminTheme.contentOnBackground.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: SentinelsSpacing.xl),
                    ],
                    child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
