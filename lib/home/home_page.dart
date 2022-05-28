import 'package:checkpoint3/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override 
  State<StatefulWidget> createState(){
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  final controller = HomeController();


  @override 
  void initState(){
    super.initState();
    controller.fetchCharacter();
    controller.addListener(() {
      setState(() {
        
      });
    });
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
          body: Padding(padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 40,
        ),
        child: Container( 
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 63, 243, 18), width: 4),
            color:const Color.fromARGB(255, 193, 255, 177),
          ),
          height: 500,
          width: 500,
          child: Column(children: [
        Image.network(controller.imageCharacterUrl),
        const SizedBox(height: 25),
        Text('Nome: '+ controller.nameCharacter,
         style:const TextStyle(fontWeight: FontWeight.bold, 
         fontSize: 24),),
        const SizedBox(height: 25),
        Text('Status: '+controller.statusCharacter, 
        style: const TextStyle(fontSize: 18),),
        Text('Espécie: '+controller.speciesCharacter, 
        style: const TextStyle(fontSize: 18),)
      ],),
        
      )
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
        controller.changeBodyFunction();
        },
        backgroundColor: const Color.fromARGB(255, 63, 243, 18) ,
        child: const Icon(Icons.refresh),
        ),
    );
    
  }
}