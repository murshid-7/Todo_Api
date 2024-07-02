import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_api/controller/provider_todo.dart';
import 'package:todo_app_api/view/home/home_todo_list.dart';

void main(){
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Todooprovider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:TodoScreenpage() ,
      ),
    );
  }
}