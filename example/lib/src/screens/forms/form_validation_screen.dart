import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({super.key});

  @override
  State<FormValidationScreen> createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agree = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Form Validation',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'Validated Form Example',
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SentinelsTextField(
                  label: 'Email',
                  hintText: 'admin@sentinels.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: SentinelsSpacing.lg),
                SentinelsPasswordField(
                  label: 'Password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: SentinelsSpacing.lg),
                SentinelsCheckbox(
                  value: _agree,
                  label: 'I accept terms and conditions',
                  onChanged: (value) {
                    setState(() {
                      _agree = value ?? false;
                    });
                  },
                ),
                if (!_agree)
                  Padding(
                    padding: const EdgeInsets.only(left: SentinelsSpacing.xl),
                    child: Text(
                      'You must accept terms to continue',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
                const SizedBox(height: SentinelsSpacing.xl),
                SentinelsButton(
                  label: 'Validate and Submit',
                  isFullWidth: true,
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate() ?? false;
                    if (isValid && _agree) {
                      SentinelsToast.show(
                        context: context,
                        message: 'Form validated successfully',
                        type: SentinelsBadgeType.success,
                      );
                    } else {
                      SentinelsToast.show(
                        context: context,
                        message: 'Please fix validation errors',
                        type: SentinelsBadgeType.danger,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
