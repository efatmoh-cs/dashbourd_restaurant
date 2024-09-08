

import 'dart:io';

import 'package:dashbourd_resturant/pages/splashScreen.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override


  // ///hide your splash screen
  // Future<void> hideScreen() async {
  //   Future.delayed(const Duration(milliseconds: 1), () {
  //     FlutterSplashScreen.hide();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:splashScreen()
      // Center(
      //  child: GestureDetector(
      //    onTap: (){
      //
      //      Navigator.push(
      //        context,
      //        MaterialPageRoute(
      //          builder: (context){
      //              return Getstart() ;}
      //        ),
      //      );
      //
      //    },
      //      child: Text('HELL')),
      // )

    );
    // theme: ThemeData(fontFamily: 'GE_ar'),
    // debugShowCheckedModeBanner: false,
    // home: new SplashScreen(
    //   seconds: 3,
    //   routeName: "/",
    //   // navigateAfterSeconds:
    //   // G_use_id_val == null ? new Login() : new Home(),
    //   title: new Text(
    //     'مرحبا بكم في تطبيق ادارة المطعم',
    //     style: new TextStyle(
    //         fontWeight: FontWeight.bold,
    //         fontSize: 20.0,
    //         color: Colors.white),
    //   ),
    //   /*image: new Image.network(
    //   'https://flutter.io/images/catalog-widget-placeholder.png'),*/
    //   backgroundColor: ,
    //   styleTextUnderTheLoader: new TextStyle(),
    //   photoSize: 100.0,
    //   onClick: () => print("restaurant"),
    //   loaderColor: Colors.white,
    // ));

  }
}
//////////////////////////////////////////////////////////////////////////
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: InsertDataPage(),
//     );
//   }
// }
//
// class InsertDataPage extends StatefulWidget {
//   @override
//   _InsertDataPageState createState() => _InsertDataPageState();
// }
//
// class _InsertDataPageState extends State<InsertDataPage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//
//   Future<void> _insertData() async {
//     final String name = _nameController.text;
//     final String mobile = _mobileController.text;
//
//     final response = await http.post(
//       Uri.parse('http://192.168.1.6/flutter_restrant/library/send.php'), // Replace with your server's URL
//       body: {
//         'name': name,
//         'mobile': mobile,
//       },
//     );
//
//     final data = json.decode(response.body);
//
//     if (data['success']) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(data['message']),
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(data['message']),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Insert Data'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _mobileController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _insertData,
//               child: Text('Insert Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }