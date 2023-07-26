import 'package:flutter/material.dart';

import '../../constant.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key, required this.hint, this.iconData, required this.controller})
      : super(key: key);
  final String hint;
  final IconData? iconData;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obs = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextFormField(
            validator: (data) {
              if (data == "") {
                return ("fill requirement field");
              }
            },
            obscureText:
                widget.hint == "Password" || widget.hint == " Confirm Password"
                    ? obs
                    : false,
            style: const TextStyle(color: Colors.white),
            cursorColor: mainColor,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: widget.hint == "Password" ||
                      widget.hint == " Confirm Password"
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          obs = !obs;
                        });
                      },
                      child: obs
                          ? Icon(
                              Icons.visibility,
                              color: Colors.grey.shade200,
                            )
                          : const Icon(Icons.visibility_off))
                  : null,
              suffixIconColor: Colors.grey.shade200,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 1.0),
              ),
              hintStyle: TextStyle(color: Colors.grey.shade200),
              iconColor: Colors.grey.shade200,
              hintText: widget.hint,
              icon: Icon(widget.iconData),
            )),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.type ,
    required this.hint,
    this.validate ,
    this.controller,
  }) : super(key: key);
  final String hint;
final String? Function(String?)? validate ;
  final TextEditingController? controller;
  final TextInputType? type ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: .5, color: Colors.grey.shade600),
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: TextFormField(
            keyboardType: type,
            validator: validate,
            controller: controller,
            cursorColor: mainColor,
            decoration:
                InputDecoration(hintText: hint, border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
