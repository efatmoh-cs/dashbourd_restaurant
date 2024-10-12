import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';





class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   XFile? img;//////////////////////img picker
  ImagePicker imgpik = ImagePicker();
  getImg(id)async{
   final pic =await imgpik.pickImage(source: ImageSource.gallery);
   setState(() {
    img = XFile(pic!.path);
   });
   addImge(id);
  }



  final TextEditingController _nameController = TextEditingController();
   final TextEditingController _mobileController = TextEditingController();
  List data = [];

//////read data//////////////////////////////////
  fetchData() async {
    // final response = await http.get(Uri.parse('http:/ 192.168.43.68/flutter_restrant/library/function.php'));
    String url = 'http://192.168.43.68/flutter_restrant/library/function.php';
    var response = await http.get(Uri.parse(url));


    if (response.statusCode == 200) {
      var red = json.decode(response.body);
      setState(() {
        _streamController.add(red);

      });
      // print(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
  ///////add data/////////////////////////////
  Future<void> _insertData() async {
    final String name = _nameController.text;
    final String mobile = _mobileController.text;

    final response = await http.post(
      Uri.parse('https://192.168.43.68/flutter_restrant/library/send.php'), // Replace with your server's URL
      body: {
        'name': name,
        'mobile': mobile,
      },
    );

    final data = json.decode(response.body);

    if (data['success']) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data['message']),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data['message']),
      ));
    }
  }
  //////////////////////////////delete data////////////////////////
  Future<void> _deleteData(int id) async{
    final response = await http.post(
      Uri.parse('https://192.168.43.68/flutter_restrant/library/delete.php'),
      body: {'id': id.toString()},
    );

     if (response.statusCode == 200) {

      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success']) {
        print("Data deleted successfully");
      } else {
        print("Failed to delete data: ${jsonResponse['message']}");
      }
    } else {
  print("Server error: ${response.statusCode}");
  }
  }
///////////////////////////////update data//////////////////////
  Future<void> updateData(id) async {
    final String name = _nameController.text;
    final String mobile = _mobileController.text;


    final response = await http.post(
      Uri.parse('http://192.168.43.68/flutter_restrant/library/update.php'), // Replace with your server's URL
      body: {
        'id': id.toString(),
        'name': name,
        'mobile': mobile.toString(),
      },
    );

    final data = json.decode(response.body);

    if (data['success']) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data['message']),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data['message']),
      ));
    }

    }

late StreamController  <List <dynamic>> _streamController;
late Stream  <List <dynamic>>_stream;

  @override
  void initState() {
    super.initState();
    getData();
    setState(() {
      _streamController=StreamController();
      _stream = _streamController.stream ;
    });
  }
  getData()async{
    await fetchData();
  }
  ///////////////////////////uploadimage//////////////////////

  Future<void> uploadImage(id) async {
    var url='http://192.168.43.68/flutter_restrant/library/uploadimge.php';
    var req = http.MultipartRequest( 'POST',
      Uri.parse(url), // Update with your PHP server URL
    );
    req.fields['id']=id.toString();
    var pic =  await http.MultipartFile.fromPath('img',img!.path);
req.files.add(pic);
var res=await req.send();
    // final request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse('http://yourserver.com/upload.php'), // Update with your PHP server URL
    // );
    //
    // // Attach the image file to the request
    // request.files.add(
    //   await http.MultipartFile.fromPath(
    //     'image',
    //     imageFile.path,
    //   ),
    // );

    // final response = await request.send();

    if (res.statusCode == 200) {
      print('done');}
  }

  /////////////////////alert add data////////////////////
AddData(){
    showDialog(context: context, builder: (context){
     return AlertDialog(
       content: Container(
         height: 300,
         child: Column(children: [

           TextFormField(
             controller: _nameController,
           ),
           TextFormField(
             controller: _mobileController,
           ),

           ElevatedButton(onPressed: (){
             // print(id.text);
             print(_nameController.text);
             print(_mobileController.text);
             _insertData();
             fetchData();////////after insert re read data
             Navigator.pop(context);
           }, child:Text('sand') )
         ],),
       ),
     );
    });
}
////////////////////////////// alert update ////////////////////
  updateeeeData(id){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Container(
          height: 300,
          child: Column(children: [

            TextFormField(
              controller: _nameController,
            ),
            TextFormField(
              controller: _mobileController,
            ),
            ElevatedButton(onPressed: (){
              // print(id.text);
              print(_nameController.text);
              print(_mobileController.text);
              print(id);
               updateData(id);
              fetchData();///////after update read data/////
              Navigator.pop(context);
            }, child:Text('sand') )
          ],),
        ),
      );
    });
  }
  /////////showdialog add img/////////////////////////
  addImge(id){
   showDialog(context: context, builder: (context){
return AlertDialog(
  content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    ElevatedButton(onPressed: (){
      uploadImage(id);
      Navigator.pop(context);
    }, child: Text('UPLOAD')),
    ElevatedButton(onPressed: (){
      Navigator.pop(context);
    }, child: Text('Cancel')),
  ],),
);
   });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(appBar: AppBar(title: Text('List'),actions: [
      IconButton(onPressed: (){AddData();}, icon: Icon(Icons.add))///////////add data////////////
    ],),

       body:
//       Column(children: [
//         ElevatedButton(onPressed: (){
//           getImg();
//         }, child: Text('PICK IMAGE')),
//         Container(
// child: img == null? Container():Image.file(File(img!.path)),
//         )
//       ],)
      StreamBuilder<List <dynamic>>/////put listview in streambuilder to refresh data imediatly
        (stream: _stream, builder: (stx,snap){
    if (snap.connectionState == ConnectionState.waiting) {
    return CircularProgressIndicator();
    } else if (snap.hasError) {
    return Text('Error: ${snap.error}');
    } else if (!snap.hasData || snap.data == null) {
    return Text('No data found');
    } else {
      // Your data rendering logic
      final data = snap.data!;


      return ListView.builder(itemCount: snap.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return
              ListTile(
                title: Text(data[index]['use_name']),
                leading: InkWell(onTap: (){
                  getImg(data[index]['use_id']);
                },
                  child: CircleAvatar(radius: 20,
                     // foregroundImage: NetworkImage('http://192.168.43.68/flutter_restrant/library/${snap.data![index]['image']}'),
                    child: Text( snap.data![index]['use_name'].toString().substring(0,2).toUpperCase()),

                    // backgroundImage: AssetImage('images/cat1.png')
                  ),
                ),

                trailing: Container(
                  width: 108,
                  child: Row(children: [
                    IconButton(onPressed: () {
                      updateeeeData(
                          snap.data![index]['use_id']); /////////update///////////////////


                    }, icon: Icon(Icons.edit, color: Colors.cyan,)),
                    IconButton(onPressed: () {
                      _deleteData(
                          snap.data![index]['use_id']); ///////delete////////////////////////////
                      fetchData();///////after update read data/////
                    }, icon: Icon(Icons.delete, color: Colors.red,))
                  ],),
                ),
                // list[index]['cat_name']
                subtitle: Text(snap.data![index]['use_mobile']),

              );
          });
    } })
    );
  }
}
