import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Application',
      initialRoute:'/',
      routes:{
        '/':(context)=> const FirstScreen(),
        '/second':(context)=> const SecondScreen(),
        '/third':(context)=> const ThirdScreen(),
          
      },

    );
  }
}

class FirstScreen extends StatelessWidget{
  const FirstScreen({super.key});
  @override
 Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/second' 
        );
      },);
    });

    return Scaffold(
      body: Center(
        child: Text('Login Application ',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
const SecondScreen({super.key});
@override
  Widget build(BuildContext context) {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  return Scaffold(
   body: Center(
   child: Column(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
   const Text("Login Page \n",
   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80),
            Container(
              height:350,
              width:350,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 240, 240),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
              child: Column(
              children: [
              TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
              labelText: 'Username:', ),
                    ),
                    TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                    labelText: 'Password:',),
                    obscureText: true,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;

                        if (username == 'sinuu' && password == '777') {
                        Navigator.pushReplacementNamed(context, '/third');
                        } else {
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                          return AlertDialog(
                          title: const Text("Login Failed"),
                          content: const Text("Incorrect username or password."),
                          actions: [
                          TextButton(
                          child: const Text("OK"),
                          onPressed: () {
                          Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text("Sign In "),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ThirdScreen extends StatelessWidget{
    const ThirdScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text('Home Page'),
      ),
            body: const Center(
      ),
      drawer:Drawer(
      child:ListView(
        padding:EdgeInsets.zero,
        children:[
          const DrawerHeader(
            decoration:BoxDecoration(
              color:Colors.deepOrange,
            ),
            child:Text("My App"),
          ),
          ListTile(title:const Text("HOME"),
          onTap:(){
          Navigator.pop(context);
          },
          ),
          ListTile(
            title:const Text("CONTACT"),
            onTap:(){},
          ),
          ListTile(
            title:const Text("ABOUT"),
            onTap:(){},
          ),
          ListTile(
            title:const Text("SETTINGS"),
            onTap:(){},
          ),
            Padding(
        padding: const EdgeInsets.only(bottom: 20),
          child:TextButton.icon(
            icon:Icon(Icons.logout),
            label: Text("Logout"),
            
            onPressed:(){
              Navigator.pushReplacementNamed(context, '/second');
            }
          )
            ),
         ] ,
      ),
      )
    );
  }
}









