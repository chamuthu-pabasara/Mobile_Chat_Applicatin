import 'package:chat_bot/sevicies/auth/authservice.dart';
import 'package:chat_bot/pages/settingpage.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout(){
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          DrawerHeader(child: Center(
            
            child: Icon(Icons.message,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 40,)
            ),
            ),
            Padding(padding:
            const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text ("H O M E",style: TextStyle(color: Colors.black,),),
              leading: const Icon(Icons.home,color: Color.fromARGB(255, 0, 0, 0)),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ),
                        Padding(padding:
            const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text ("S E T T I N G S",style: TextStyle(color: Colors.black),),
              leading: const Icon(Icons.settings,color: Color.fromARGB(255, 0, 0, 0)),
              onTap: (){
                 Navigator.pop(context);
                 Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingPage(),),);
              },
            ),
            ),
             Padding(padding:
            const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title:const  Text ("L O G O U T",style: TextStyle(color:  Colors.black),),
              leading: const Icon(Icons.logout,color: Color.fromARGB(255, 0, 0, 0),),
              onTap:logout,
            ),
            )

        ],
      ),
    );
  }
}