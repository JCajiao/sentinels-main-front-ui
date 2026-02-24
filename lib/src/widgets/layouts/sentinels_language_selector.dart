import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsLanguageSelector extends StatelessWidget {
  const SentinelsLanguageSelector({
    super.key,
    required this.currentLanguage,
    required this.languages,
    required this.onLanguageChanged,
  });

  final String currentLanguage;
  final List<String> languages;
  final ValueChanged<String> onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    final adminTheme = Theme.of(context).sentinelsAdminTheme;

    return PopupMenuButton<String>(
      initialValue: currentLanguage,
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.language, color: adminTheme.topBarOnBackground),
          const SizedBox(width: SentinelsSpacing.xs),
          Text(
            currentLanguage.toUpperCase(),
            style: TextStyle(
              color: adminTheme.topBarOnBackground,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Icon(Icons.arrow_drop_down,
              color: adminTheme.topBarOnBackground, size: 16),
        ],
      ),
      offset: const Offset(0, 40),
      color: adminTheme.contentBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SentinelsRadius.md),
      ),
      onSelected: onLanguageChanged,
      itemBuilder: (BuildContext context) {
        return languages.map((String lang) {
          return PopupMenuItem<String>(
            value: lang,
            child: Text(
              lang.toUpperCase(),
              style: TextStyle(color: adminTheme.contentOnBackground),
            ),
          );
        }).toList();
      },
    );
  }
}
