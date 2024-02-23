

export 'src/views/fortune_wheel.dart';
export 'src/models/models.dart';
import 'splashscreen.dart';
import 'firstscreen.dart';

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spinner_brahma/firstscreen.dart';
import 'package:spinner_brahma/splashscreen.dart';
import 'package:spinner_brahma/splashscreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<int> items = [
    100,400,200,600,500,700,800,0,111,222
  ];
  final selected = BehaviorSubject<int>();
  int result = 0;
  int userchoice = 999999 ;


  @override
  void dispose() {
    // TODO: implement dispose
    selected.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Container(
                   height: 150,
                   width: double.infinity,

                   child:
                        Column(
                          children: [
                            Text("CHOOSE AMONG 4 POSSIBILITY \n           THEN SPIN" ,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    userchoice=100;
                                  });
                                }, child: Text("100")),
                                ElevatedButton(onPressed: (){setState(() {
                                  userchoice=200;
                                });}, child: Text("200")),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(onPressed: (){setState(() {
                                  userchoice=500;
                                });}, child: Text("500")),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    userchoice=0;
                                  });
                                }, child: Text("0  ")),

                              ],
                            ),
                          ],
                        ),
                 ),









                  SizedBox(
                    height:400,
                    width: 400,
                    child: FortuneWheel(
                      selected: selected.stream,
                      animateFirst: false,
                      items: [
                        for (int i = 0; i < items.length; i++) ...<FortuneItem>{
                          FortuneItem(
                            child: Text(
                              items[i].toString(),
                              style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                        },
                      ],
                      onAnimationEnd: () {
                        setState(() {
                          result = items[selected.value];
                        });
                       if(result == userchoice){
                        showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text(
                                  "YOUR CHOICE IS : $userchoice \n ACTUAL RESULT IS : $result \n YOU WON 100 RUPEES😊",
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                content: Text(
                                  "YEH YOUR ASSUMPTION IS AWESOME",
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      color: Colors.black54,
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        "OKAY",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                        );


                        }else {
                         showDialog(
                           context: context,
                           builder: (context) =>
                               AlertDialog(
                                 backgroundColor: Colors.black,
                                 title: Text(
                                   "YOUR CHOICE IS : $userchoice \n ACTUAL RESULT IS : $result  \n YOU LOSE 100 RUPEES",
                                   style: TextStyle(color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 20),
                                 ),
                                 content: Text(
                                   "YOU LOSE \n YOU HAVE TO GIVE MORE FOCUS ON IT ",
                                   style: TextStyle(color: Colors.white),
                                 ),
                                 actions: <Widget>[
                                   TextButton(
                                     onPressed: () {
                                       Navigator.of(context).pop();
                                     },
                                     child: Container(
                                       color: Colors.black54,
                                       padding: EdgeInsets.all(15),
                                       child: Text(
                                           "OKAY",
                                         style: TextStyle(color: Colors.white),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                         );

                       }
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected.add(Fortune.randomInt(0, items.length));
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.black54,
                      child: Center(
                        child: Text("SPIN", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold , ),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}