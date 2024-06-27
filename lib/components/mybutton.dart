import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget{
  final void Function()? onTap;
  final String text;
  const Mybutton({super.key,required this.text,required this.onTap,});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 13, 170, 19),
          borderRadius: BorderRadius.circular(90),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,),),),
      ),
    );
  }
}