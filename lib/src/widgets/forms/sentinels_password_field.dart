import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class SentinelsPasswordField extends StatefulWidget {
  const SentinelsPasswordField({
    super.key,
    this.label,
    this.hintText = 'Enter your password',
    this.controller,
    this.validator,
    this.onChanged,
  });

  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<SentinelsPasswordField> createState() => _SentinelsPasswordFieldState();
}

class _SentinelsPasswordFieldState extends State<SentinelsPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SentinelsTextField(
      label: widget.label,
      hintText: widget.hintText,
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
