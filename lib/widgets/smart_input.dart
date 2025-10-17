import 'package:flutter/material.dart';

/// A fully customizable input widget for forms and search fields.
class SmartInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? counter;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final Color? fillColor;
  final Color? textColor;
  final bool filled;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;

  const SmartInput({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.counter,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.disabledBorder,
    this.fillColor,
    this.textColor,
    this.filled = true,
    this.onChanged,
    this.onTap,
    this.validator,
  });

  @override
  State<SmartInput> createState() => _SmartInputState();
}

class _SmartInputState extends State<SmartInput> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveTextColor =
        widget.textColor ??
        widget.style?.color ??
        theme.textTheme.bodyMedium?.color;

    return Container(
      padding: widget.padding,
      child: TextField(
        controller: widget.controller,
        obscureText: _obscure,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        textAlign: widget.textAlign,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        style: widget.style ?? TextStyle(color: effectiveTextColor),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: widget.labelStyle,
          hintText: widget.hint,
          hintStyle: widget.hintStyle,
          errorStyle: widget.errorStyle,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                )
              : widget.suffixIcon,
          prefix: widget.prefix,
          suffix: widget.suffix,
          counter: widget.counter,
          filled: widget.filled,
          fillColor:
              widget.fillColor ?? theme.cardColor.withValues(alpha: 0.05),
          border:
              widget.border ??
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: widget.focusedBorder,
          enabledBorder: widget.enabledBorder,
          errorBorder: widget.errorBorder,
          disabledBorder: widget.disabledBorder,
        ),
      ),
    );
  }
}
