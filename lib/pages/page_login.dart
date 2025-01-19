// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:app_pos/main.dart';
import 'package:app_pos/public/apiUrl.dart';
import 'package:app_pos/public/public.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool sPass = true;

  @override
    dispose() {
    super.dispose();
  }

  showPass() {
    setState(() {
      sPass = false;
    });
  }
  
  hidePass() {
    setState(() {
      sPass = true;
    });
  }

  void validateInputs() {
    
    if(username.text.isEmpty || password.text.isEmpty){
      // modalAlert(context);
      AwesomeDialog(
        context: context,
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        dialogType: DialogType.error,
        headerAnimationLoop: true,
        animType: AnimType.bottomSlide,
        title: 'ERROR',
        reverseBtnOrder: true,
        btnOkText: 'Ok',
        btnOkColor: Colors.red,
        btnOkOnPress: () {
        },
        desc: 'Username / Password tidak boleh kosong.',
      ).show();
    }else{
      doLogin(username.text, password.text);
      // modalLoading();
    }
  }

  Future<void> doLogin(String username, String password) async {
    // Menampilkan dialog loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );

    try {
      final response = await http.post(
        Uri.parse("${baseUrl}api/login"),
        body: {
          "username": username,
          "password": password,
        },
      );

      final output = jsonDecode(response.body);

      if (response.statusCode == 201) {
        if (context.mounted) {
          Navigator.pop(context);
          saveSession(output['data']['nama'],output['data']['username'],output['data']['role'],output['data']['foto'], output['token']);
        }
      } else {
        debugPrint("Login Failed: $output");

        if (context.mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Error: ${output['message'] ?? 'Gagal Login'}",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Error: $e");

      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Terjadi kesalahan, coba beberapa saat lagi.: $e",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      }
    }
  }


  saveSession(String nama, String username, String role, String foto, String dtToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await savePref('fullname', nama.toString());
    await savePref('username', username.toString());
    await savePref('role', role.toString());
    await savePref('foto', foto.toString());
    await savePref('dtToken', dtToken.toString());
    await pref.setBool("is_login", true);

    if(context.mounted){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(title: 'Dashboard'),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(235, 56, 55, 1),
            Color.fromARGB(199, 2, 47, 54),
            // Color.fromARGB(255, 248, 246, 110),
          ],
        ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: FadeInUp(duration: Duration(milliseconds: 1800),
            child : Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.lock_person_rounded, size: 80, color: Colors.white),
                    Image.asset(
                      'assets/login.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text("Sign In", style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          textFormControl(
                            context,
                            astext: textAs.asString,
                            xtextEditingController: username,
                            xlabel: "Username",
                            xhintText: 'Username',
                            xhintColor: Colors.grey,
                            xlabelColor: Colors.white,
                            xIcon: Icons.account_circle_rounded,
                            onSuffixClick: (){},
                            xsuffixColorIcon: Colors.red,
                            xColorIcon: Colors.grey,
                            xborderBottomLeft: 15,
                            xborderTopLeft: 15,
                            xborderFocusBottomLeft: 15,
                            xborderFocusTopLeft: 15,
                            xborderBottomRight: 15,
                            xborderFocusBottomRight: 15,
                            xborderFocusTopRight: 15,
                            xborderTopRight: 15,
                          ),
                          SizedBox(height: 20),
                          textFormControl(
                            context,
                            astext: textAs.asString,
                            passwd: sPass ? true : false,
                            xtextEditingController: password,
                            xlabel: "Password",
                            xhintText: 'Password',
                            xhintColor: Colors.grey,
                            xlabelColor: Colors.white,
                            xIcon: Icons.lock_outline_rounded,
                            xsuffixIcon: sPass ? Icons.visibility_off : Icons.remove_red_eye,
                            onSuffixClick: (){sPass ? showPass() : hidePass();},
                            xsuffixColorIcon: Colors.red,
                            xColorIcon: Colors.grey,
                            xborderBottomLeft: 15,
                            xborderTopLeft: 15,
                            xborderFocusBottomLeft: 15,
                            xborderFocusTopLeft: 15,
                            xborderBottomRight: 15,
                            xborderFocusBottomRight: 15,
                            xborderFocusTopRight: 15,
                            xborderTopRight: 15,
                          ),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: (){
                              validateInputs();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 1, 94, 110),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                )
                              ),
                            ),
                          )
                        ],
                      )
                    )
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: SingleChildScrollView(
    //   	child: Container(
	  //       child: Column(
	  //         children: <Widget>[
	  //           Container(
	  //             height: 400,
	  //             decoration: BoxDecoration(
	  //               image: DecorationImage(
	  //                 image: AssetImage('assets/images/background.png'),
	  //                 fit: BoxFit.fill
	  //               )
	  //             ),
	  //             child: Stack(
	  //               children: <Widget>[
	  //                 Positioned(
	  //                   left: 30,
	  //                   width: 80,
	  //                   height: 200,
	  //                   child: FadeInUp(duration: Duration(seconds: 1), child: Container(
	  //                     decoration: BoxDecoration(
	  //                       image: DecorationImage(
	  //                         image: AssetImage('assets/images/light-1.png')
	  //                       )
	  //                     ),
	  //                   )),
	  //                 ),
	  //                 Positioned(
	  //                   left: 140,
	  //                   width: 80,
	  //                   height: 150,
	  //                   child: FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
	  //                     decoration: BoxDecoration(
	  //                       image: DecorationImage(
	  //                         image: AssetImage('assets/images/light-2.png')
	  //                       )
	  //                     ),
	  //                   )),
	  //                 ),
	  //                 Positioned(
	  //                   right: 40,
	  //                   top: 40,
	  //                   width: 80,
	  //                   height: 150,
	  //                   child: FadeInUp(duration: Duration(milliseconds: 1300), child: Container(
	  //                     decoration: BoxDecoration(
	  //                       image: DecorationImage(
	  //                         image: AssetImage('assets/images/clock.png')
	  //                       )
	  //                     ),
	  //                   )),
	  //                 ),
	  //                 Positioned(
	  //                   child: FadeInUp(duration: Duration(milliseconds: 1600), child: Container(
	  //                     margin: EdgeInsets.only(top: 50),
	  //                     child: Center(
	  //                       child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	  //                     ),
	  //                   )),
	  //                 )
	  //               ],
	  //             ),
	  //           ),
	  //           Padding(
	  //             padding: EdgeInsets.all(30.0),
	  //             child: Column(
	  //               children: <Widget>[
	  //                 FadeInUp(duration: Duration(milliseconds: 1800), child: Container(
	  //                   padding: EdgeInsets.all(5),
	  //                   decoration: BoxDecoration(
	  //                     color: Colors.white,
	  //                     borderRadius: BorderRadius.circular(10),
    //                     border: Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
	  //                     boxShadow: [
	  //                       BoxShadow(
	  //                         color: Color.fromRGBO(143, 148, 251, .2),
	  //                         blurRadius: 20.0,
	  //                         offset: Offset(0, 10)
	  //                       )
	  //                     ]
	  //                   ),
	  //                   child: Column(
	  //                     children: <Widget>[
	  //                       Container(
	  //                         padding: EdgeInsets.all(8.0),
	  //                         decoration: BoxDecoration(
	  //                           border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
	  //                         ),
	  //                         child: TextField(
	  //                           decoration: InputDecoration(
	  //                             border: InputBorder.none,
	  //                             hintText: "Email or Phone number",
	  //                             hintStyle: TextStyle(color: Colors.grey[700])
	  //                           ),
	  //                         ),
	  //                       ),
	  //                       Container(
	  //                         padding: EdgeInsets.all(8.0),
	  //                         child: TextField(
    //                           obscureText: true,
	  //                           decoration: InputDecoration(
	  //                             border: InputBorder.none,
	  //                             hintText: "Password",
	  //                             hintStyle: TextStyle(color: Colors.grey[700])
	  //                           ),
	  //                         ),
	  //                       )
	  //                     ],
	  //                   ),
	  //                 )),
	  //                 SizedBox(height: 30,),
	  //                 FadeInUp(duration: Duration(milliseconds: 1900), child: Container(
	  //                   height: 50,
	  //                   decoration: BoxDecoration(
	  //                     borderRadius: BorderRadius.circular(10),
	  //                     gradient: LinearGradient(
	  //                       colors: [
	  //                         Color.fromRGBO(143, 148, 251, 1),
	  //                         Color.fromRGBO(143, 148, 251, .6),
	  //                       ]
	  //                     )
	  //                   ),
	  //                   child: Center(
	  //                     child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	  //                   ),
	  //                 )),
	  //               ],
	  //             ),
	  //           )
	  //         ],
	  //       ),
	  //     ),
    //   )
    // );
  }
}