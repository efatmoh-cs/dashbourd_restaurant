import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';





class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _nameController = TextEditingController();
   final TextEditingController _mobileController = TextEditingController();
  List data = [];

//////read data//////////////////////////////////
  fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.1.6/flutter_restrant/library/function.php'));

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
      print(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
  ///////add data/////////////////////////////
  Future<void> _insertData() async {
    final String name = _nameController.text;
    final String mobile = _mobileController.text;

    final response = await http.post(
      Uri.parse('http://192.168.1.6/flutter_restrant/library/send.php'), // Replace with your server's URL
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
      Uri.parse('https://192.168.1.6/flutter_restrant/library/delete.php'),
      body: {'id': id.toString()},
    );

    if (response.statusCode == 200) {
      var red =jsonDecode(response.body);
      print(red);
    //   var jsonResponse = jsonDecode(response.body);
    //   if (jsonResponse['success']) {
    //     print("Data deleted successfully");
    //   } else {
    //     print("Failed to delete data: ${jsonResponse['message']}");
    //   }
    // } else {
    //   print("Server error: ${response.statusCode}");
    }
  }





  @override
  void initState() {
    super.initState();
    getData();
  }
  getData()async{
    await fetchData();
  }
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
             Navigator.pop(context);
           }, child:Text('sand') )
         ],),
       ),
     );
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('List'),actions: [
      IconButton(onPressed: (){AddData();}, icon: Icon(Icons.add))///////////adddata
    ],),
      body: ListView.builder(  itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return
              ListTile(
                title: Text( data[index]['use_name']),
           leading: CircleAvatar(radius: 20,
           child: Text('ag'),),
           trailing: Container(
             width: 108,
             child: Row(children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.cyan,)),
               IconButton(onPressed: (){

                 _deleteData(data[index]['use_id']) ;
               }, icon: Icon(Icons.delete,color: Colors.red,))
             ],),
           ),
                // list[index]['cat_name']
                subtitle: Text(data[index]['use_mobile']),
                // list[index]['cat_kind']
              );

          }),
    );
  }
}
