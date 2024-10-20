//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';  // For picking images
// import 'package:http/http.dart' as http;  // For making HTTP requests
// import 'package:path/path.dart';  // To get filename from the picked file
// import 'package:async/async.dart';  // To handle multipart requests
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter PHP Image Upload',
//       home: ImageUpload(),
//     );
//   }
// }
//
// class ImageUpload extends StatefulWidget {
//   @override
//   _ImageUploadState createState() => _ImageUploadState();
// }
//
// class _ImageUploadState extends State<ImageUpload> {
//   File? _image;
//   final picker = ImagePicker();
//
//   // Pick an image from the gallery
//   Future<void> pickImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);  // Store the picked image as a File
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   // Upload the image to PHP server
//   Future<void> uploadImage() async {
//     if (_image == null) return;
//
//     // Set up the multipart request
//     var uri = Uri.parse('http://192.168.43.68/flutter_restrant/library/uploadimge.php');  // Your PHP script URL
//     var request = http.MultipartRequest('POST', uri);
//
//     // Create a multipart file from the selected image
//     var stream = http.ByteStream(DelegatingStream.typed(_image!.openRead()));
//     var length = await _image!.length();
//     var multipartFile = http.MultipartFile('image', stream, length, filename: basename(_image!.path));
//
//     // Add the file to the request
//     request.files.add(multipartFile);
//
//     // Send the request to the server
//     var response = await request.send();
//
//     // Check the response status
//     if (response.statusCode == 200) {
//       print('Image uploaded successfully');
//     } else {
//       print('Image upload failed with status: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!, height: 300, width: 300),  // Display selected image
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: pickImage,
//               child: Text('Select Image'),
//             ),
//             ElevatedButton(
//               onPressed: uploadImage,
//               child: Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
//        child: GestureDetector(
//          onTap: (){
//
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context){
//                    return Getstart() ;}
//              ),
//            );
//
//          },
//            child: Text('HELL')),
//       )
//
    );
  }
}
// ////////////////////////////////////////////////////////////////////////



//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   Future<void> loginUser(String email, String password) async {
//     final url = 'http://your-server-url/login.php'; // Replace with your PHP backend URL
//
//     final response = await http.post(
//       Uri.parse(url),
//       body: {
//         'email': email,
//         'password': password,
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = json.decode(response.body);
//
//       if (responseData['status'] == 'success') {
//         // Login successful, navigate to another screen or show success
//         print('Login successful');
//       } else {
//         // Login failed, show error message
//         print('Login failed: ${responseData['message']}');
//       }
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final email = emailController.text;
//                 final password = passwordController.text;
//
//                 if (email.isNotEmpty && password.isNotEmpty) {
//                   loginUser(email, password);
//                 } else {
//                   print("Fields cannot be empty");
//                 }
//               },
//               child: Text("Login"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
