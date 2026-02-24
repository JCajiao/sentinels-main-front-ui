import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsStepper extends StatelessWidget {
  const SentinelsStepper({
    super.key,
    required this.steps,
    required this.currentStep,
    this.onStepTapped,
  });

  final List<String> steps;
  final int currentStep;
  final ValueChanged<int>? onStepTapped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Divider
          final stepIndex = index ~/ 2;
          final isCompleted = currentStep > stepIndex;
          return Expanded(
            child: Container(
              height: 2,
              color: isCompleted ? theme.primaryColor : theme.dividerColor,
            ),
          );
        }

        // Step indicator
        final stepIndex = index ~/ 2;
        final isActive = currentStep == stepIndex;
        final isCompleted = currentStep > stepIndex;

        Color bgColor;
        Color textColor;

        if (isActive) {
          bgColor = theme.primaryColor;
          textColor = Colors.white;
        } else if (isCompleted) {
          bgColor = theme.primaryColor.withValues(alpha: 0.1);
          textColor = theme.primaryColor;
        } else {
          bgColor = theme.dividerColor.withValues(alpha: 0.3);
          textColor =
              theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5) ??
                  Colors.grey;
        }

        return InkWell(
          onTap: onStepTapped != null ? () => onStepTapped!(stepIndex) : null,
          borderRadius: BorderRadius.circular(SentinelsRadius.pill),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: isCompleted
                ? Icon(Icons.check, color: textColor, size: 20)
                : Text(
                    '\${stepIndex + 1}',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
