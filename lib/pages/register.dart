import 'package:chat_bot/sevicies/auth/authservice.dart';
import 'package:chat_bot/components/my_textfields.dart';
import 'package:chat_bot/components/mybutton.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget{
   final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
   final TextEditingController _confirmpwcontroller = TextEditingController();

   final Function()? onTap;
  RegisterPage ({super.key,required this.onTap,});

  void register(BuildContext context){
    final auth = AuthService();
    if(_pwcontroller.text==_confirmpwcontroller.text){
      try {
        auth.signUpWithEmailPassword(_emailcontroller.text,_pwcontroller.text);
      }catch (e){
        showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),));
      }
    }
    else{
      showDialog(context: context, builder: (context) => const AlertDialog(
        title: Text("Password don't match ! "),));
    }
  }
  @override
  Widget build(BuildContext context){
   return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Container(
                height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
       //   Color.fromARGB(255, 242, 215, 218),
        //  Color.fromARGB(255, 254, 49, 70)
        Theme.of(context).colorScheme.background,
        Theme.of(context).colorScheme.primary,
        
          

        ],
                  begin: Alignment.topLeft,
          end: Alignment.bottomRight,)
        ),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 50),
            Text("Welcome back,you've been missed",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
            ),
            ),
            const SizedBox(height: 25,),
            mytextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailcontroller,
              icona: Icon(Icons.email),
            ),
            const SizedBox(height: 10,),
           mytextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwcontroller,
              icona: Icon(Icons.password),
            ),
             const SizedBox(height: 10,),
           mytextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpwcontroller,
              icona: Icon(Icons.lock),
            ),
            const SizedBox(height: 25,),
        
            Mybutton(
              text: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(height: 25,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? ",
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Login now",style: TextStyle(fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background),),
                ),
              ],
            ),
        
        
        
        
        ],
          ),
        ),
      ),
    );
  }
}