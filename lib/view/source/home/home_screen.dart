import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproj/view/source/home/update/updateScreen.dart';

import 'insertion_screen/insertion screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userid='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getstarted();
  }
  getstarted()async{
    userid =await FirebaseAuth.instance.currentUser!.uid;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Insertion_screen();
        }));
      },child: Icon(Icons.check),),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').doc(userid).collection('insert').snapshots(),
            builder: (context,snapshots){
              return ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                      child: InkWell(
                        onLongPress: ()async{
                          await Navigator.push(context,MaterialPageRoute(builder:
                              (context)=>UpdateClass(name: snapshots.data!.docs[index].id,)));

                        },
                        child: Card(
                          child:ListTile(

                            title: Text(snapshots.data!.docs[index]['name'].toString()),
                         //
                            subtitle:  Text(snapshots.data!.docs[index]['email'].toString()),
                            trailing: InkWell(
                                onTap: ()async{
                                  await FirebaseFirestore.instance.collection('user').doc(userid).collection('insert').doc(snapshots.data!.docs[index].id).delete();
                                },
                                child: Icon(Icons.delete,color:Colors.red ,)),
                          ),
                        ),
                      ),
                    );
                  });
            }),

    );
  }
}

//update classssssssssssssssssssssssssssssssssssss
