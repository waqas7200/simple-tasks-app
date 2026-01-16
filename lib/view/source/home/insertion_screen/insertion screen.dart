import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../component/Textformfield_custom/textformfield_custom.dart';
import '../../../component/container_butoon/container_button.dart';
class Insertion_screen extends StatefulWidget {
  const Insertion_screen({super.key});

  @override
  State<Insertion_screen> createState() => _Insertion_screenState();
}

class _Insertion_screenState extends State<Insertion_screen> {
  TextEditingController firstcontroller=TextEditingController();
  TextEditingController secondcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:

      // Column(children: [
      //   TextFormField(controller: firstcontroller,),
      //   TextFormField(controller: secondcontroller,),
      //   TextButton(onPressed: ()async{
      //     await FirebaseFirestore.instance .collection('user').add({
      //       'name':firstcontroller.text,
      //       'gmail':secondcontroller.text,
      //     }).then((onValue){
      //       print('adddddd=======================');
      //     }).onError((error,handleError){print('error:${error.toString()}eroor==============================');});
      //   }, child: Center(child: Text('Add'),))
      // ],)

      SingleChildScrollView(
        child: Column(
          children: [
            //first textformfield
            Padding(
              padding: const EdgeInsets.only(left: 30,top:100),
              child: TextformfieldCustom(text: 'Enter task', height: 40,
                width: 300, controller: firstcontroller,radius: BorderRadius.circular(12),
                border: Border.all(width: 0.1),),
            ),
            //2nd textformfield
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: TextformfieldCustom(text: 'Gmail', height: 40,
                width: 300, controller: secondcontroller,radius: BorderRadius.circular(12),
                border: Border.all(width: 0.1),),
            ),
            //add button
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30),
              child:   InkWell(
                onTap: ()async{
                  String id=DateTime.now().microsecond.toString();
                  String userid=await FirebaseAuth.instance.currentUser!.uid;
                  await FirebaseFirestore.instance.collection('user').
                  doc(userid).collection('insert').doc(id).set({
        
                    'name':firstcontroller.text,
                    'email':secondcontroller.text,
                    'id':id,
                  }).then((onValue){
                    Navigator.pop(context);
                  }).
                  onError((handleError,error){});
                },
                // onTap: ()async{
                //   String id=DateTime.now().microsecond.toString();
                //  await FirebaseFirestore.instance.collection('userid').doc(id).set({
                //    'name':firstcontroller.text,
                //    'gmail':secondcontroller.text,
                //    'id':id,
                //  }).
                //  then((onValue){
                //    print("dat added================================================");
                //  }).onError((handleError,error){
                //  print('error:${error.toString()}erorrororororororo dfjkfdfj===============================================');
                //  });
                // },
                child: ContainerButton(text: 'Add', width: 200, height: 40,
                  radius: BorderRadius.circular(10),fontWeight: FontWeight.bold,colortext: Colors.white,
                  color: Colors.deepPurpleAccent,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

