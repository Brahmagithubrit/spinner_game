import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spinner_brahma/contactUs.dart';
import 'package:spinner_brahma/main.dart';
import 'contactUs.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    int coin =1000;
    return Scaffold(
      appBar: AppBar(


        title: Padding(
          padding: const EdgeInsets.only(left: 150.0),
          child: Text(
            "HOME",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          colors:[
            Colors.indigo,Colors.black
          ]
        )
      ),
        child: Column(
          children: [
            Container(
              height: 70,
                width: double.infinity,

                child: Center(child: Text("Coin : $coin" , style: TextStyle(color: Colors.white, fontSize: 20 , fontWeight: FontWeight.bold),))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: "TRY YOUR LUCK ")));
                },
                child: Container(

                  child: Row(
                    children: [
                      Container(
                        height: 100,
                          width: 200,

                          child: Image.asset('assets/images/spinner.jpg')),
                      Text("PLAY",style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ,color: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Text("COMING SOON \n BRAHMA"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Text("COMING SOON \n BRAHMA"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>contactUs()));
                  }, child: Text("CONTACT ME"))),
            ),

          ],
        ),
      ),
    );
  }
}