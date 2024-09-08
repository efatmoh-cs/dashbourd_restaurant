import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category/category.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],appBar: AppBar(centerTitle: true,title: Text('اداره المطعم'),backgroundColor: Colors.red,),
       endDrawer:  Drawer( child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/rest.jpg"),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPicture: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("images/rest1.jpg")),
                  accountEmail: Text(""),
                  accountName: Text("",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
                ListTile(
                  title: Text(
                    " القائمة الرئيسية",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                      Icons.home,
                      color: Colors.red

                    // Icons.download,
                    // size: 24.0,
                  ),
                  trailing:Icon(
                    Icons.arrow_back_ios,color: Colors.red,

                    // Icons.download,
                    // size: 24.0,
                  ),

                ),

                ExpansionTile(
                  leading: Icon(Icons.person,color: Colors.red,),
                  title: Text('حسابي'),
                  trailing: Icon(Icons.arrow_drop_down,color: Colors.red,
                    size: 30,),
                  children: [
                    Divider(color: Colors.black,),
                    ListTile(
                      title: Text("تغيير اعدادات الحساب",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black)),
                      leading: Icon(
                          Icons.settings, color: Colors.red
                      ), trailing: Icon(
                        Icons.arrow_back_ios,color: Colors.red

                      // Icons.download,
                      // size: 24.0,
                    ),
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Myprofile()));
                      },
                    ),
                    Divider(color: Colors.black,),
                    ListTile(
                      title: Text("تغيير كلمه المرور",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black)),
                      leading: Icon(
                          Icons.lock_open, color: Colors.red
                      ), trailing: Icon(
                        Icons.arrow_back_ios,color: Colors.red

                      // Icons.download,
                      // size: 24.0,
                    ),
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Changepassword()));
                      },
                    ),

                  ],

                )




                , ListTile(
                    title: Text(
                      'قائمه التصنيفات',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    leading: Icon(
                        Icons.favorite,
                        color: Colors.red

                    ),
                    trailing: Icon(
                        Icons.arrow_back_ios,color: Colors.red

                      // Icons.download,
                      // size: 24.0,
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) =>  Favorit()));
                    }),
                ListTile(
                    title: Text(
                      "الطلبيات",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                        Icons.history,
                        color: Colors.red

                      // Icons.download,
                      // size: 24.0,
                    ),
                    trailing:Icon(
                      Icons.arrow_back_ios,color: Colors.red,

                      // Icons.download,
                      // size: 24.0,
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) =>  Tracking()));
                    }
                ),
                ListTile(
                  title: Text(
                    "قائمة الماكولات",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                      Icons.menu,
                      color: Colors.red

                    // Icons.download,
                    // size: 24.0,
                  ),
                  trailing:Icon(
                    Icons.arrow_back_ios,color: Colors.red,

                    // Icons.download,
                    // size: 24.0,
                  ),
                  onTap: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => Category()));
                   },

                  ),

                ListTile(
                  title: Text(
                    "من نحن",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                      Icons.nature_people_rounded,
                      color: Colors.red

                    // Icons.download,
                    // size: 24.0,
                  ),
                  trailing:Icon(
                    Icons.arrow_back_ios,color: Colors.red,

                    // Icons.download,
                    // size: 24.0,
                  ),

                ),

              ],
            ),
          ],
        ),
        ),
        body: ListView(
        children: [
          ///////////////////////////////////////

          Row(
            children: [
              Expanded(
                child: Container(
                   margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: GestureDetector(onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => category()));
                    },
                      child: Column(
                        children: [
                          Icon(Icons.category,size:70,color: Colors.red,),
                          Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                 margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:80,color: Colors.blue,),
                        Text('الرئسيه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
          /////////////////////////////////////////////////////////////////////////////////

          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.fastfood,size:70,color: Colors.yellow,),
                        Text('الماكولات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.message,size:80,color: Colors.green,),
                        Text('الطلبات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),

          //////////////////////////////////////////////////////////////////////////////////////////////


          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.yellow,),
                        Text('الرئسيه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.blue,),
                        Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )
, Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.yellow,),
                        Text('الرئسيه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.blue,),
                        Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )
, Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.yellow,),
                        Text('الرئسيه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.blue,),
                        Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )
, Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.yellow,),
                        Text('الرئسيه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.blue,),
                        Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )
, Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.yellow,),
                        Text('الرئسيه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.blue,),
                        Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )
, Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.yellow,),
                        Text('الرئسيه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.blue,),
                        Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )
, Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.yellow,),
                        Text('الرئسيه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.home,size:50,color: Colors.blue,),
                        Text('التصنيفات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )



        ],
    ),
    );
  }
}
