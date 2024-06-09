import 'package:flutter/material.dart';
import 'package:notee_app/constants/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLines =1, this.onsaved });

  final String hintText ; 
  final int maxLines ;
  final void Function(String?)? onsaved ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      validator: (value){
          if (value?.isEmpty ?? true) {
            return 'Field Is Required';
          } else{
            return null;
          }
          
      },
      cursorColor: kPrimaryhColor,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kPrimaryhColor),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryhColor)),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}
