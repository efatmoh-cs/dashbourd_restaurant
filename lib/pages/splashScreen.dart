import 'package:dashbourd_resturant/pages/category/apipage.dart';
import 'package:flutter/material.dart';

import 'acount/login.dart';
import 'home.dart';



class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  get item => null;

  @override
  void initState() {
    // Timer(Duration(seconds: 5),(){
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));
    // });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor:Colors.white,
      body:Stack (
        alignment: Alignment.center,
        children: [
          Image.asset(
            "images/adr.jpg",
            height: double.infinity,
            // width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(''),
                SizedBox(height: 20,),

                GestureDetector( onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage()));
                },
                  child: Text('القائمة الرئيسية',style: TextStyle(color: Colors.white,fontSize: 38,fontWeight: FontWeight.bold),),

                )
              ],),
          )

        ],
      ),
    );

  }
}
