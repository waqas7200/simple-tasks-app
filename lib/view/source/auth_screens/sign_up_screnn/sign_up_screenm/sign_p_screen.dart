import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../component/Textformfield_custom/textformfield_custom.dart';
import '../../../../component/container_butoon/container_button.dart';
import '../../../../component/custom_text/custom_text.dart';
import '../../../home/home_screen.dart';
import '../../login_screen/login_screen.dart';
class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  bool isloading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //welcome text
          Padding(
              padding: const EdgeInsets.only(left: 80,top: 40),
              child:Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomText(text: 'Welcome back',fontWeight: FontWeight.bold,
                  color: Colors.black,size: 25,),
              ),
          ),

          //sign in text
          Padding(
            padding: const EdgeInsets.only(left: 40,top: 40),
            child:CustomText(text: 'SignIn',fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,size: 15,),
          ),

        //name textformfield
          Padding(
              padding: const EdgeInsets.only(left: 40,top: 10),
              child:Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Icon(Icons.person,size: 15,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomText(text: 'Name',fontWeight: FontWeight.normal,
                      color: Colors.black,size: 13,),
                  ),

                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 10),
            child: TextformfieldCustom(text: 'Name', height: 40,
              width: 300, controller: namecontroller,radius: BorderRadius.circular(12),
              border: Border.all(width: 0.1),),
          ),


          // email textformfield
          Padding(
              padding: const EdgeInsets.only(left: 40,top: 10),
              child:Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Icon(Icons.email,size: 15,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomText(text: 'Email',fontWeight: FontWeight.normal,
                      color: Colors.black,size: 13,),
                  ),

                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 10),
            child: TextformfieldCustom(text: 'Enter Email', height: 40,
              width: 300, controller: emailcontroller,radius: BorderRadius.circular(12),
              border: Border.all(width: 0.1),),
          ),


          //password textformfield
          Padding(
              padding: const EdgeInsets.only(left: 40,top: 10),
              child:Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Icon(Icons.lock,size: 15,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomText(text: 'Enter password',fontWeight: FontWeight.normal,
                      color: Colors.black,size: 13,),
                  ),

                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 10),
            child: TextformfieldCustom(text: 'password', height: 40,
              width: 300, controller: passwordcontroller,radius: BorderRadius.circular(12),
              border: Border.all(width: 0.1),),
          ),


          //container type buuton of sign up
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 30),
            child:
            isloading?CircularProgressIndicator():
            InkWell(
              onTap: ()async{
                isloading=true;
                setState(() {

                });
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailcontroller.text,
                  password: passwordcontroller.text,
              ).then((onValue)async{
                isloading=false;
                setState(() {

                });
                String userid= await FirebaseAuth.instance.currentUser!.uid;
                await FirebaseFirestore.instance.collection('user').doc(userid).set({
                  'name':namecontroller.text,
                  'email':emailcontroller.text,
                  'id':userid,
                });
                emailcontroller.clear();
                passwordcontroller.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }).onError((error,handleError){
                isloading=false;
                setState(() {

                });
                print('error:${error.toString()}=========error========================');
              });

              },
              child: ContainerButton(text: 'signUp', width: 300, height: 40,
                radius: BorderRadius.circular(10),fontWeight: FontWeight.bold,colortext: Colors.white,
                color: Colors.deepPurpleAccent,),
            ),
          ),

          //already  hav ean  account
          Padding(
              padding: const EdgeInsets.only(left: 70,top: 20),
              child:Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: CustomText(text: 'Already have an account?',fontWeight: FontWeight.normal,
                      color: Colors.black,size: 13,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: CustomText(text: 'Sign Ip',fontWeight: FontWeight.normal,
                        color: Colors.deepPurpleAccent,size: 13,),
                    ),
                  ),

                ],
              )
          ),
        ],
      ),
    );
  }
}
