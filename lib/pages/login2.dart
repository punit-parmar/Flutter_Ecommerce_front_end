import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttershophome/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final GoogleSignIn googleSignIn=new GoogleSignIn();
  final FirebaseAuth firebaseAuth=  FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading=false;
  bool isloggedin=false;
  @override
  void initState(){
    super.initState();
    isSignedin();
  }
  void isSignedin() async {
    setState(() {
      loading=true;
    });

    preferences=await SharedPreferences.getInstance();
    isloggedin =await googleSignIn.isSignedIn();

    if(isloggedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homepage()));
    }

    setState(() {
      loading=false;
    });
  }

  Future handleSignedin() async{
     preferences=await SharedPreferences.getInstance();

     setState(() {
       loading=true;
     });

     GoogleSignInAccount googleUser= await googleSignIn.signIn();
     GoogleSignInAuthentication googleSignInAuthentication=await googleUser.authentication;
     final AuthCredential credential=GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken:googleSignInAuthentication.idToken);
     final AuthResult authResult=await FirebaseAuth.instance.signInWithCredential(credential);
     final FirebaseUser user=authResult.user;

     if(user != null){

       final QuerySnapshot result= await Firestore.instance.collection('Users').where('id',isEqualTo: user.uid).getDocuments();
       final List<DocumentSnapshot> documents = result.documents;
       if(documents.length == 0){
         Firestore.instance.collection('Users')
             .document(user.uid)
             .setData({
           'id' : user.uid,
           'Username' :user.displayName,
           'profilePicture' : user.photoUrl
         });

         await preferences.setString('id', user.uid);
         await preferences.setString('Username', user.displayName);
         await preferences.setString('profilePicture', user.photoUrl);
       }else{
         await preferences.setString('id', documents[0]['id']);
         await preferences.setString('Username', documents[0]['Username']);
         await preferences.setString('profilePicture', documents[0]['profilePicture']);
       }
       Fluttertoast.showToast(msg: 'Successfully logged In');
       setState(() {
         loading=false;
       });
     }
     else{

     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.1,
        title: Text('Login',style: TextStyle(color: Colors.green),),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child:  OutlineButton(
              splashColor: Colors.white,
              borderSide: BorderSide(color: Colors.green),
              child: Row(
                children: <Widget>[
                  Image.asset('images/google.png',height: 40,),
                  Text('Google')
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: (){
                handleSignedin();
              },
            ),
          ),

          Visibility(
            visible: loading ?? true,
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ))
        ],
      ),
    );
  }
}
