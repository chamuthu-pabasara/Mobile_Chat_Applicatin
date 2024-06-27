import 'package:chat_bot/pages/login.dart';
import 'package:chat_bot/pages/register.dart';
import 'package:flutter/material.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showloginpage = true;

  void togglepages(){
    setState(() {
      showloginpage = !showloginpage;
    });
  }
  @override
  Widget build(BuildContext context) {
   if (showloginpage){
    return Loginpage(
      onTap:togglepages,
      );
   }else {
    return RegisterPage(
      onTap:togglepages,
    );
   }
  }
}