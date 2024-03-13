import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
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
