import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../component/Textformfield_custom/textformfield_custom.dart';
import '../../../component/container_butoon/container_button.dart';
import '../../../component/custom_text/custom_text.dart';
import '../../home/home_screen.dart';
import '../sign_up_screnn/sign_up_screenm/sign_p_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  bool isloading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //welcome back text
            Padding(
              padding: const EdgeInsets.only(left: 90,top: 30),
              child:CustomText(text: 'Welcome Back',fontWeight: FontWeight.bold,
              color: Colors.black,size: 25,)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50,top: 30),
              child:CustomText(text: 'Login',fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,size: 15,)
            ),
        
        
        
        
           // email
            Padding(
              padding: const EdgeInsets.only(left: 40,top: 40),
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
        
        
        
            //password
            Padding(
                padding: const EdgeInsets.only(left: 40,top: 20),
                child:Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Icon(Icons.lock,size: 15,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CustomText(text: 'password',fontWeight: FontWeight.normal,
                        color: Colors.black,size: 13,),
                    ),
        
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: TextformfieldCustom(text: 'Password', height: 40,
                width: 300, controller: passwordcontroller,radius: BorderRadius.circular(12),
                border: Border.all(width: 0.1),),
            ),
        
        
            //forget password
            Padding(
                padding: const EdgeInsets.only(left: 130,top: 30),
                child:CustomText(text: 'Forgot Password?',fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,size: 12,)
            ),
        
        
            //container button
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30),
              child:   InkWell(
                onTap: ()async{
                  isloading=true;
                  setState(() {
        
                  });
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailcontroller.text, password: passwordcontroller.text
                  ).then((onValue){
                    isloading=false;
                    setState(() {
        
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  }).onError((handleError,error){
                    isloading=false;
                    setState(() {
        
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${error.toString()}'),
                    duration: Duration(seconds: 2),)
                    );
                  });
        
                },
                child: isloading?Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: CircularProgressIndicator(),
                ):ContainerButton(text: 'Login', width: 300, height: 40,
                  radius: BorderRadius.circular(10),fontWeight: FontWeight.bold,colortext: Colors.white,
                  color: Colors.deepPurpleAccent,),
              ),
            ),
        
        
            //dont have an account text
            Padding(
                padding: const EdgeInsets.only(left: 85,top: 20),
                child:Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: CustomText(text: 'Dont have a account?',fontWeight: FontWeight.normal,
                        color: Colors.black,size: 13,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Signupscreen()));
                        },
                        child: CustomText(text: 'Sign up',fontWeight: FontWeight.normal,
                          color: Colors.deepPurpleAccent,size: 13,),
                      ),
                    ),
        
                  ],
                )
            ),
        
        
            //circleAvator
            Padding(
                padding: const EdgeInsets.only(left: 120,top: 20),
                child:Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Center(child: Icon(Icons.facebook,size: 40,color: Colors.deepPurpleAccent,),)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 0),
                      child: CircleAvatar(child:  Center(child:Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: CustomText(text: 'G',size: 30,fontWeight: FontWeight.bold,color: Colors.deepOrange,),
                      ),))
                    ),
        
                  ],
                )
            ),
        
          ],
        ),
      ),
    );
  }
}


