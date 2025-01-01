// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_pos/public/public.dart';
import 'package:app_pos/widgets/appbarcustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageHistori extends StatefulWidget {
  const PageHistori({super.key});

  @override
  State<PageHistori> createState() => _PageHistoriState();
}

class _PageHistoriState extends State<PageHistori> {
  TextEditingController searchData = TextEditingController();

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
                          Text("Histori Transaksi", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Mochammad Jamal", style: TextStyle(color: Colors.white, fontSize: 12)),
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
              
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text("List Data", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 1, 94, 110),
                                borderRadius: BorderRadius.circular(25),
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
                                                    Text("No. Transaksi",style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("INV/1224/0001",style: TextStyle(color: Colors.white, fontSize: 14)),
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
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(color: Colors.white)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Row(
                                                          children: [
                                                            Text("Detail", style: TextStyle(color: Colors.white))
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
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Kode Barang",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("BRG001",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Tanggal Transaksi",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("28/12/2024 15:08:00",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
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
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("No. Transaksi",style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("INV/1224/0002",style: TextStyle(color: Colors.white, fontSize: 14)),
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
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(color: Colors.white)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Row(
                                                          children: [
                                                            Text("Detail", style: TextStyle(color: Colors.white))
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
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Kode Barang",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("BRG001",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Tanggal Transaksi",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("28/12/2024 15:08:00",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
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
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("No. Transaksi",style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("INV/1224/0003",style: TextStyle(color: Colors.white, fontSize: 14)),
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
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(color: Colors.white)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Row(
                                                          children: [
                                                            Text("Detail", style: TextStyle(color: Colors.white))
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
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Kode Barang",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("BRG001",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Tanggal Transaksi",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("28/12/2024 15:08:00",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
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
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("No. Transaksi",style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("INV/1224/0004",style: TextStyle(color: Colors.white, fontSize: 14)),
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
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(color: Colors.white)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Row(
                                                          children: [
                                                            Text("Detail", style: TextStyle(color: Colors.white))
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
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Kode Barang",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("BRG001",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Tanggal Transaksi",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("28/12/2024 15:08:00",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
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
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("No. Transaksi",style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("INV/1224/0005",style: TextStyle(color: Colors.white, fontSize: 14)),
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
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(color: Colors.white)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Row(
                                                          children: [
                                                            Text("Detail", style: TextStyle(color: Colors.white))
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
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Kode Barang",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("BRG001",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Tanggal Transaksi",style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("28/12/2024 15:08:00",style: TextStyle(color: Color.fromARGB(255, 65, 64, 64), fontSize: 14)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
          
          Positioned(
            top: 100, // Posisi Container sedikit ke atas AppBar
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 10),
                        child: textFormControl(
                          context,
                          astext: textAs.asString,
                          xtextEditingController: searchData,
                          xhintText: 'Cari data transaksi?',
                          xhintColor: Colors.grey,
                          xlabelColor: Colors.grey,
                          xIcon: Icons.search,
                          xsuffixIcon: Icons.cancel,
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
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(right:0, top: 20),
                      child: InkWell(
                        onTap: (){
                          
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 1, 94, 110),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(Icons.search_rounded, size: 25, color: Colors.white)
                          )
                          )
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}