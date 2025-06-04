import 'package:flutter/material.dart';
import 'package:tools_for_you/core/widgets/textfield/k_textfield.dart';

class NumberInputField extends StatefulWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const NumberInputField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  State<NumberInputField> createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.value == 0 ? '' : widget.value.toStringAsFixed(0),
    );
  }

  @override
  void didUpdateWidget(covariant NumberInputField oldWidget) {
    super.didUpdateWidget(oldWidget);

    final currentValue = double.tryParse(_controller.text);
    if (widget.value != currentValue) {
      _controller.text =
          widget.value == 0 ? '' : widget.value.toStringAsFixed(0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleChange(String input) {
    final number = double.tryParse(input);
    if (number != null) {
      widget.onChanged(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KTextfield(
      controller: _controller,
      labelText: widget.label,
      keyboardType: TextInputType.number,
      onChanged: _handleChange,
    );
  }
}
