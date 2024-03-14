import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final bool isEmail;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.isEmail = false,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  late String? _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _errorText = null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          const SizedBox(
            height: 6,
          ),
          Stack(
            children: [
              TextFormField(
                cursorColor: kBlackColor,
                obscureText: _obscureText,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  errorText: _errorText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      color: _errorText != null ? Colors.red : kBlackColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      color: _errorText != null ? Colors.red : kPrimaryColor,
                    ),
                  ),
                ),
                validator: widget.isEmail ? _validateEmail : null,
                onChanged: (value) {
                  setState(() {
                    if (widget.isEmail) {
                      _errorText = _validateEmail(value);
                    }
                  });
                },
              ),
              if (widget.obscureText)
                Transform.translate(
                  offset: const Offset(-20, 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
