import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  final String name;

  const RegisterScreen({super.key, required this.name});


  @override
  _RegisterScreen createState() => _RegisterScreen();


}

class _RegisterScreen  extends State<RegisterScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  closeScreen() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: const Center(
        child: Text("Profile Client"),
      ),
    );
  }
}