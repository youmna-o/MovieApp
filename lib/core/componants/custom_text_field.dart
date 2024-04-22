import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hint,
    required this.validator,
    required this.controller,
    this.obscure= false,

  });

  final TextEditingController controller ;
  final String hint ;
  final String? Function(String?)? validator ;
  bool obscure ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/12,
      child: Padding(
        padding: const EdgeInsets.only(right: 5,bottom: 1),
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: obscure ,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:  TextStyle(
                fontSize: 10,color: Colors.white),
            filled: true,
           // fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:BorderSide(
                  color : Colors.grey.withOpacity(0.5),
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2,
                color:Color(0xFFF48D15).withOpacity(1),),


            ),
          ),
          validator: validator ,),
      ),
    );

  }
}