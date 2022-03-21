import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rebuild only when necessary'),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 16),
              SizedBox(
                width: 300,
                child: Text('Flutter\'s algorithms for rebuilding and '
                    'repainting widgets are linear in the worst case, '
                    'and typically sub-linear. Try clicking one of '
                    'buttons below -- they\'ll tell you exactly '
                    'when they rebuild!'),
              ),
              SizedBox(height: 32),
              ClickyBuilder(),
              SizedBox(height: 16),
              ClickyBuilder(),
              SizedBox(height: 16),
              ClickyBuilder(),
              SizedBox(height: 66),
              CalculadoraWidget()
            ],
          ),
        ),
      ),
    );
  }
}




//Calculadora
class CalculadoraWidget extends StatefulWidget{
  const CalculadoraWidget({Key? key}) : super(key:key);
  
  @override
  _CalculadoraWidgetState createState() => _CalculadoraWidgetState();
}

class _CalculadoraWidgetState extends State<CalculadoraWidget>{
  int counter=0;
  @override
  Widget build(BuildContext context){
    return Column(
      children:<Widget>[
       Text("Hello world $counter"),
       ElevatedButton(
         child:Text("ADD"),
         onPressed:(){
           print(counter);
           ++counter;
           
         }
       )
        
      ]
      
    );
  }
}







class ClickyBuilder extends StatefulWidget {
  const ClickyBuilder({Key? key}) : super(key: key);

  @override
  _ClickyBuilderState createState() => _ClickyBuilderState();
}

class _ClickyBuilderState extends State<ClickyBuilder> {
  Color color = Colors.blue;

  String pad(int i) => i.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color),
      child: Text('Built at ${now.hour}:${pad(now.month)}:'
          '${pad(now.second)}'),
      onPressed: () => setState(() {
        color = getRandomColor();
      }),
    );
  }
}

final rng = Random();

const randomColors = [
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.indigo,
  Colors.deepPurple,
  Colors.white10,
];

Color getRandomColor() {
  return randomColors[rng.nextInt(randomColors.length)];
}
