import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth_screens/login_screen/login_screen.dart';
import '../home/home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading();
  }
  isloading()async{
    String userid=await FirebaseAuth.instance.currentUser!.uid;
    if(userid==null || userid=="")
      {
        Future.delayed(Duration(seconds: 5));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
    else{
      {
        Future.delayed(Duration(seconds: 5));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
