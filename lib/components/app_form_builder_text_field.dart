import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormBuilderTextField extends StatefulWidget {
  const AppFormBuilderTextField({
    Key? key,
    required this.name,
    this.labelText,
    this.valueTransformer,
    this.validator,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.labelColor,
    this.maxLines = 1,
    this.cursorColor,
    this.suffixIcon,
    this.textDirection,
    this.prefixIcon,
    this.enabled = true,
    this.isCollapsed = false,
  }) : super(key: key);

  final bool enabled, obscureText;
  final String? labelText;
  final int? maxLines;
  final String name;
  final String? hintText;
  final TextInputType? keyboardType;
  final Color? labelColor, cursorColor;
  final TextDirection? textDirection;
  final Widget? suffixIcon, prefixIcon;
  final String? Function(String?)? validator;
  final bool isCollapsed;
  final dynamic Function(String? value)? valueTransformer;
  @override
  State<AppFormBuilderTextField> createState() =>
      _AppFormBuilderTextFieldState();
}

class _AppFormBuilderTextFieldState extends State<AppFormBuilderTextField> {
  late bool isSecure = widget.obscureText;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: FormBuilderTextField(
        focusNode: myFocusNode,
        name: widget.name,
        obscureText: isSecure,
        valueTransformer: widget.valueTransformer,
        keyboardType: widget.keyboardType,
        textDirection: widget.textDirection,
        maxLines: widget.maxLines,
        cursorColor: widget.cursorColor ?? Colors.black,
        decoration: InputDecoration(
          isCollapsed: widget.isCollapsed,
          labelText: widget.labelText,
          hintText: widget.hintText,
          floatingLabelStyle: TextStyle(
            color: widget.labelColor,
          ),
          enabled: widget.enabled,
          focusColor: Colors.black,
          suffixIcon: widget.suffixIcon ??
              (widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isSecure = !isSecure;
                        });
                      },
                      icon: Icon(
                        isSecure ? Icons.visibility_off : Icons.remove_red_eye,
                      ),
                    )
                  : null),
          prefixIcon: widget.prefixIcon,
        ),
        validator: widget.validator,
      ),
    );
  }
}
