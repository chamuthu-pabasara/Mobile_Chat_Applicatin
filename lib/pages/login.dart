import 'package:chat_bot/sevicies/auth/authservice.dart';
import 'package:chat_bot/components/my_textfields.dart';
import 'package:chat_bot/components/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();

 final void Function()? onTap;

   Loginpage({super.key,required this.onTap});
   void login(BuildContext context) async{
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(_emailcontroller.text,_pwcontroller.text);
    }
    catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),);
    }
   }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
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
            Text("WELCOME BACK ! , you've been missed",
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
            const SizedBox(height: 25,),
        
            Mybutton(
              text: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(height: 25,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ",
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register now",style: TextStyle(fontWeight: FontWeight.bold,
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