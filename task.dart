import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Task'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showMyAlertDialog(context),
          child: const Text('Click Me'),
        ),
      ),
    );
  }
}

void showMyAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); 
              showHomePageMessage(context); 
            },
          ),
        ],
      );
    },
  );
}

void showHomePageMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Info'),
        content: const Text('You are in Home Page'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}

