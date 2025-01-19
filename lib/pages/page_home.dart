// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, depend_on_referenced_packages

import 'dart:convert';

import 'package:app_pos/pages/page_login.dart';
import 'package:app_pos/public/apiUrl.dart';
import 'package:app_pos/public/public.dart';
import 'package:app_pos/widgets/appbarcustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  String getToken = '';
  String getUsername = '';
  String statusToken = '';
  String getFullName = '';
  String getRoleUser = '';

  getPref()async{
    getToken = await readPref('dtToken') ?? '-';
    getUsername = await readPref('username') ?? '-';
    getFullName = await readPref('fullname') ?? '-';
    getRoleUser = await readPref('role') ?? '-';
    setState(() {
      print("token : "+getToken);
      getToken;
      getUsername;
      getFullName;
      getRoleUser;
      validasiToken();
    });
  }

  validasiToken() async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}api/check-token"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*',
          'Accept': '*/*',
          'Authorization': 'Bearer $getToken'
        },
      );

      if (response.statusCode == 200) {
        final output = jsonDecode(response.body);
        if (context.mounted) {
          setState(() {
            statusToken = output['message'] ?? "Token ditemukan tapi tidak ada pesan.";
          });
          
          if(statusToken != 'token_valid'){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Token kadaluarsa, harap login kembali.",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => PageLogin(),
              ),
              (route) => false,
            );
          }
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Token kadaluarsa, harap login kembali.",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PageLogin(),
            ),
            (route) => false,
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Token kadaluarsa, harap login kembali.",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
        Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => PageLogin(),
        ),
        (route) => false,
      );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          AppBarCustom(
            title: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(getFullName.toString().toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.more_vert)
                    ],
                  )
                ],
              ),
            ),
            onClickBack: (){
              Navigator.pop(context);
            },
          ),
   
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: const Color.fromARGB(255, 238, 237, 237)
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.70,
              // color: Colors.white,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      
                    ],
                  ),
                ),
              ),
            )
          ),
          
          Positioned(
            top: 120, // Posisi Container sedikit ke atas AppBar
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("Informasi Lokasi", style: TextStyle(color: Colors.white)),
                Container(
                  // height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 94, 110),
                    borderRadius: BorderRadius.circular(25),
                    // border: Border.all(color:  const Color.fromARGB(255, 168, 168, 168)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4), // Bayangan
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("120",style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.white)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text("Item Terjual",style: TextStyle(color: Colors.white, fontSize: 14)),
                                          )
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.white)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Icon(Icons.restaurant_rounded, size: 20, color: Colors.white,)
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  children: [
                                                    Text("80",style: TextStyle(color: Colors.white, fontSize: 20)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.white)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Icon(Icons.local_cafe_rounded, size: 20, color: Colors.white,)
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  children: [
                                                    Text("40",style: TextStyle(color: Colors.white, fontSize: 20)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        
                                      ],
                                    ),
                                    
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                     
                      Container(
                        // height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color.fromARGB(255, 168, 168, 168),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(Icons.fastfood_rounded, size: 50, color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("Produk Terlaris")
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color.fromARGB(255, 168, 168, 168),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(Icons.deck_rounded, size: 50, color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("Data Meja")
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color.fromARGB(255, 168, 168, 168),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(Icons.account_circle_rounded, size: 50, color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("Data Pelanggan")
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 94, 110),
                    borderRadius: BorderRadius.circular(25),
                    // border: Border.all(color:  const Color.fromARGB(255, 168, 168, 168)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4), // Bayangan
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.bar_chart_rounded, color: Colors.white, size: 70)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.white)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text("Laporan Penjualan",style: TextStyle(color: Colors.white, fontSize: 14)),
                                          )
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: Colors.white)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Colors.white,)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                     
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 94, 110),
                    borderRadius: BorderRadius.circular(25),
                    // border: Border.all(color:  const Color.fromARGB(255, 168, 168, 168)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4), // Bayangan
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.bar_chart_rounded, color: Colors.white, size: 70)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.white)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text("Laporan Laba/Rugi",style: TextStyle(color: Colors.white, fontSize: 14)),
                                          )
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: Colors.white)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Colors.white,)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}