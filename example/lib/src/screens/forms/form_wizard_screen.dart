import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class FormWizardScreen extends StatefulWidget {
  const FormWizardScreen({super.key});

  @override
  State<FormWizardScreen> createState() => _FormWizardScreenState();
}

class _FormWizardScreenState extends State<FormWizardScreen> {
  int _currentStep = 0;
  final int _totalSteps = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Form Wizard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SentinelsStepper(
                steps: const ['Account', 'Profile', 'Finish'],
                currentStep: _currentStep,
                onStepTapped: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
              ),
              const SizedBox(height: SentinelsSpacing.xxl),
              _buildStepContent(),
              const SizedBox(height: SentinelsSpacing.xxl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SentinelsButton(
                    label: 'Previous',
                    type: SentinelsButtonType.secondary,
                    onPressed: _currentStep > 0
                        ? () => setState(() => _currentStep--)
                        : null,
                  ),
                  SentinelsButton(
                    label: _currentStep == _totalSteps - 1 ? 'Submit' : 'Next',
                    onPressed: () {
                      if (_currentStep < _totalSteps - 1) {
                        setState(() => _currentStep++);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return const Column(
          children: [
            SentinelsTextField(label: 'Username', hintText: 'johndoe'),
            SizedBox(height: SentinelsSpacing.lg),
            SentinelsPasswordField(label: 'Password'),
          ],
        );
      case 1:
        return Column(
          children: [
            const SentinelsTextField(label: 'Full Name', hintText: 'John Doe'),
            const SizedBox(height: SentinelsSpacing.lg),
            SentinelsFileUpload(
                onFileSelected: () {}, label: 'Upload Avatar (Optional)'),
          ],
        );
      case 2:
        return const Center(
          child: Column(
            children: [
              Icon(Icons.check_circle,
                  size: 64, color: SentinelsColors.success),
              SizedBox(height: SentinelsSpacing.md),
              Text('All set! Please confirm your submission.',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
