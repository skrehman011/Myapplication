

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // final XFile file=file;
  var file="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Google Map', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),),
        toolbarHeight: 70,
        actions: [
          Icon(Icons.search_rounded, color: Colors.black,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 327,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey
              ),
              child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(29.765, -120.456),
                zoom: 17,

              ),),
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.file(File(file)),
            ),
            TextButton(onPressed: (){
              pickImage();
            }, child:
            Text('Pick Image'),
            )

          ],
        ),
      ),
    );
  }
  void  pickImage() async{
    final ImagePicker picker = ImagePicker();

    XFile? image= await picker.pickImage(source: ImageSource.gallery);
    if (image!.path!=null) {
      file=image.path;
      setState(() {
      });

    }
  }
}
