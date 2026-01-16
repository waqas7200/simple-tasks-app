import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class UpdateClass extends StatefulWidget {
  final String name;
  const UpdateClass({super.key,required this.name});

  @override
  State<UpdateClass> createState() => _UpdateClassState();
}

class _UpdateClassState extends State<UpdateClass> {
  TextEditingController namecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(controller: namecontroller,),
            InkWell(
              onTap: ()async{
                String userid=await FirebaseAuth.instance.currentUser!.uid;
                await FirebaseFirestore.instance.collection('user').doc(userid).collection('insert').doc(widget.name).update({
                  'name':namecontroller.text
                }).then((onValue){  Navigator.pop(context);}).onError((error,handleError){print('error');});
        
        
              },

               child: Container(
                  height: 40,
                  width: 100,
                  child: Text('Update')),
            ),
          ],
        ),
      ),
    );
  }
}
