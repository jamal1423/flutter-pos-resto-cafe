// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_pos/widgets/appbarcustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PagePos extends StatefulWidget {
  const PagePos({super.key});

  @override
  State<PagePos> createState() => _PagePosState();
}

class _PagePosState extends State<PagePos> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cari kode barang", style: TextStyle(color: const Color.fromARGB(255, 202, 201, 201), fontSize: 14)),
                              Icon(Icons.search_rounded, size: 20, color: Color.fromARGB(255, 202, 201, 201))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        onClickBack: (){
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("List Item Order", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                )
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 100),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(0, 4),
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
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Colors.black)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.edit_square, color: Colors.blue),
                                                    SizedBox(width: 10),
                                                    Text("Ubah", style: TextStyle(color: Colors.black))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Colors.black)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.delete_rounded, color: Colors.red),
                                                        SizedBox(width: 10),
                                                        Text("Hapus", style: TextStyle(color: Colors.black))
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Nama Barang",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Nasi Soto Babat",style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Qty",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("4",style: TextStyle(color: Colors.black, fontSize: 16)),
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
                                                    Text("Harga",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Rp. 17.000",style: TextStyle(color: Colors.black, fontSize: 16)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Sub Total",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                                                    SizedBox(width: 25),
                                                    Text("Rp. 68.000",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(0, 4),
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
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Colors.black)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.edit_square, color: Colors.blue),
                                                    SizedBox(width: 10),
                                                    Text("Ubah", style: TextStyle(color: Colors.black))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Colors.black)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.delete_rounded, color: Colors.red),
                                                        SizedBox(width: 10),
                                                        Text("Hapus", style: TextStyle(color: Colors.black))
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Nama Barang",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Lemon Tea",style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Qty",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("4",style: TextStyle(color: Colors.black, fontSize: 16)),
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
                                                    Text("Harga",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Rp. 9.000",style: TextStyle(color: Colors.black, fontSize: 16)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Sub Total",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                                                    SizedBox(width: 25),
                                                    Text("Rp. 36.000",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(0, 4),
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
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Colors.black)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.edit_square, color: Colors.blue),
                                                    SizedBox(width: 10),
                                                    Text("Ubah", style: TextStyle(color: Colors.black))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Colors.black)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.delete_rounded, color: Colors.red),
                                                        SizedBox(width: 10),
                                                        Text("Hapus", style: TextStyle(color: Colors.black))
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Nama Barang",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Kentang Goreng",style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Qty",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("4",style: TextStyle(color: Colors.black, fontSize: 16)),
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
                                                    Text("Harga",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Rp. 7.000",style: TextStyle(color: Colors.black, fontSize: 16)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Sub Total",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                                                    SizedBox(width: 25),
                                                    Text("Rp. 28.000",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Metode Pembayaran"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Switch(
                        activeColor: Colors.green,
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                      Text(
                        isSwitched ? "Non-Tunai" : "Tunai",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pilih Meja?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                      Text("24",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("Total Bayar"),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Rp. 132.000", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.30,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 1, 94, 110),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.payments_rounded, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text("Bayar", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
      // body: Stack(
      //   children: [
      //     Row(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(20.0),
      //           child: Text("List Item Order", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //         ),
      //       ],
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 220),
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: [
      //             Align(
      //               alignment: Alignment.bottomCenter,
      //               child: Container(
      //                 width: double.infinity,
      //                 // height: MediaQuery.of(context).size.height * 0.90,
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(10),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.black.withOpacity(0.2),
      //                       blurRadius: 8,
      //                       offset: Offset(0, 4),
      //                     ),
      //                   ],
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.all(20.0),
      //                       child: Column(
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Column(
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 children: [
      //                                   Row(
      //                                     children: [
      //                                       Text("Nama Barang",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                     ],
      //                                   ),
      //                                   Row(
      //                                     children: [
      //                                       Text("Nasi Soto Babat",style: TextStyle(color: Colors.black, fontSize: 14)),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                               Column(
      //                                 children: [
      //                                   Column(
      //                                     children: [
      //                                       Container(
      //                                         decoration: BoxDecoration(
      //                                           borderRadius: BorderRadius.circular(10),
      //                                           border: Border.all(color: Colors.black)
      //                                         ),
      //                                         child: Padding(
      //                                           padding: const EdgeInsets.all(5.0),
      //                                           child: Row(
      //                                             children: [
      //                                               Icon(Icons.delete_rounded, color: Colors.red),
      //                                               SizedBox(width: 10),
      //                                               Text("Hapus", style: TextStyle(color: Colors.black))
      //                                             ],
      //                                           ),
      //                                         ),
      //                                       )
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                           Divider(),
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Column(
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 children: [
      //                                   Row(
      //                                     children: [
      //                                       Text("Qty",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                     ],
      //                                   ),
      //                                   Row(
      //                                     children: [
      //                                       Text("4",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                               Column(
      //                                 children: [
      //                                   Column(
      //                                     crossAxisAlignment: CrossAxisAlignment.end,
      //                                     children: [
      //                                       Row(
      //                                         children: [
      //                                           Text("Harga",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                         ],
      //                                       ),
      //                                       Row(
      //                                         children: [
      //                                           Text("Rp. 17.000",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                         ],
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                           Divider(),
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Column(
      //                                 children: [
      //                                   Column(
      //                                     crossAxisAlignment: CrossAxisAlignment.start,
      //                                     children: [
      //                                       Row(
      //                                         children: [
      //                                           Container(
      //                                             decoration: BoxDecoration(
      //                                               color: Colors.red,
      //                                               borderRadius: BorderRadius.circular(5),
      //                                             ),
      //                                             child: Padding(
      //                                               padding: const EdgeInsets.all(5.0),
      //                                               child: Icon(Icons.remove, color: Colors.white),
      //                                             ),
      //                                           ),
      //                                           SizedBox(width: 2),
      //                                           Container(
      //                                             decoration: BoxDecoration(
      //                                               color: Colors.blue,
      //                                               borderRadius: BorderRadius.circular(5),
      //                                             ),
      //                                             child: Padding(
      //                                               padding: const EdgeInsets.all(5.0),
      //                                               child: Icon(Icons.add, color: Colors.white),
      //                                             ),
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                               Column(
      //                                 children: [
      //                                   Column(
      //                                     crossAxisAlignment: CrossAxisAlignment.end,
      //                                     children: [
      //                                       Row(
      //                                         children: [
      //                                           Text("Sub Total",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
      //                                           SizedBox(width: 25),
      //                                           Text("Rp. 68.000",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      //                                         ],
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             SizedBox(height: 15),
                  
      //           ],
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       child: Expanded(
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             border: Border.all(color: Colors.grey)
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.all(10.0),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   children: [
      //                     Text("Metode Pembayaran"),
      //                   ],
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Switch(
      //                       activeColor: Colors.green,
      //                       value: isSwitched,
      //                       onChanged: (value) {
      //                         setState(() {
      //                           isSwitched = value;
      //                         });
      //                       },
      //                     ),
      //                     Text(
      //                       isSwitched ? "Non-Tunai" : "Tunai",
      //                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //                     ),
      //                   ],
      //                 ),
      //                 Divider(),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text("Pilih Meja?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
      //                     Text("24",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //                     ),
      //                   ],
      //                 ),
      //                 Divider(),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Column(
      //                           children: [
      //                             Text("Total Bayar"),
      //                           ],
      //                         ),
      //                         Column(
      //                           children: [
      //                             Text("Rp. 272.000", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                     Column(
      //                       mainAxisAlignment: MainAxisAlignment.end,
      //                       children: [
      //                         Container(
      //                           width: MediaQuery.of(context).size.width * 0.30,
      //                           decoration: BoxDecoration(
      //                             color: Color.fromARGB(255, 1, 94, 110),
      //                             borderRadius: BorderRadius.circular(10)
      //                           ),
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(10.0),
      //                             child: Row(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 Icon(Icons.payments_rounded, color: Colors.white),
      //                                 SizedBox(width: 10),
      //                                 Text("Bayar", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))
      //                               ],
      //                             ),
      //                           ),
      //                         )
      //                       ],
      //                     )
      //                   ],
      //                 ),
                      
      //               ],
      //             ),
      //           ),
      //         ),
      //       )
      //     )
      //   ],
      // ),



      // body: Stack(
      //   clipBehavior: Clip.none,
      //   children: [
      //     AppBarCustom(
      //       title: Padding(
      //         padding: const EdgeInsets.only(left: 20, right: 20),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.end,
      //               children: [
      //                 Row(
      //                   children: [
      //                     Container(
      //                       width: MediaQuery.of(context).size.width * 0.75,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(10)
      //                       ),
      //                       child: Padding(
      //                         padding: EdgeInsets.all(10),
      //                         child: Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Text("Cari kode barang", style: TextStyle(color: const Color.fromARGB(255, 202, 201, 201), fontSize: 14)),
      //                             Icon(Icons.search_rounded, size: 20, color: Color.fromARGB(255, 202, 201, 201))
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //       onClickBack: (){
      //         Navigator.pop(context);
      //       },
      //     ),
          
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           // borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      //           color: const Color.fromARGB(255, 238, 237, 237)
      //         ),
      //         width: double.infinity,
      //         height: MediaQuery.of(context).size.height * 0.90,
              
      //         child: Padding(
      //           padding: const EdgeInsets.all(20.0),
      //           child: SingleChildScrollView(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(10),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: Colors.black.withOpacity(0.2),
      //                         blurRadius: 8,
      //                         offset: Offset(0, 4), // Bayangan
      //                       ),
      //                     ],
      //                   ),
      //                   child: Column(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.all(20.0),
      //                         child: Column(
      //                           children: [
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     Row(
      //                                       children: [
      //                                         Text("Nama Barang",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                       ],
      //                                     ),
      //                                     Row(
      //                                       children: [
      //                                         Text("Nasi Soto Babat",style: TextStyle(color: Colors.black, fontSize: 14)),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       children: [
      //                                         Container(
      //                                           decoration: BoxDecoration(
      //                                             borderRadius: BorderRadius.circular(10),
      //                                             border: Border.all(color: Colors.black)
      //                                           ),
      //                                           child: Padding(
      //                                             padding: const EdgeInsets.all(5.0),
      //                                             child: Row(
      //                                               children: [
      //                                                 Icon(Icons.delete_rounded, color: Colors.red),
      //                                                 SizedBox(width: 10),
      //                                                 Text("Hapus", style: TextStyle(color: Colors.black))
      //                                               ],
      //                                             ),
      //                                           ),
      //                                         )
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                             Divider(),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     Row(
      //                                       children: [
      //                                         Text("Qty",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                       ],
      //                                     ),
      //                                     Row(
      //                                       children: [
      //                                         Text("4",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.end,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text("Harga",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                           ],
      //                                         ),
      //                                         Row(
      //                                           children: [
      //                                             Text("Rp. 17.000",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                             Divider(),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Container(
      //                                               decoration: BoxDecoration(
      //                                                 color: Colors.red,
      //                                                 borderRadius: BorderRadius.circular(5),
      //                                               ),
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(5.0),
      //                                                 child: Icon(Icons.remove, color: Colors.white),
      //                                               ),
      //                                             ),
      //                                             SizedBox(width: 2),
      //                                             Container(
      //                                               decoration: BoxDecoration(
      //                                                 color: Colors.blue,
      //                                                 borderRadius: BorderRadius.circular(5),
      //                                               ),
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(5.0),
      //                                                 child: Icon(Icons.add, color: Colors.white),
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.end,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text("Sub Total",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
      //                                             SizedBox(width: 25),
      //                                             Text("Rp. 68.000",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 15),
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(10),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: Colors.black.withOpacity(0.2),
      //                         blurRadius: 8,
      //                         offset: Offset(0, 4), // Bayangan
      //                       ),
      //                     ],
      //                   ),
      //                   child: Column(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.all(20.0),
      //                         child: Column(
      //                           children: [
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     Row(
      //                                       children: [
      //                                         Text("Nama Barang",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                       ],
      //                                     ),
      //                                     Row(
      //                                       children: [
      //                                         Text("Ice Cappucino",style: TextStyle(color: Colors.black, fontSize: 14)),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       children: [
      //                                         Container(
      //                                           decoration: BoxDecoration(
      //                                             borderRadius: BorderRadius.circular(10),
      //                                             border: Border.all(color: Colors.black)
      //                                           ),
      //                                           child: Padding(
      //                                             padding: const EdgeInsets.all(5.0),
      //                                             child: Row(
      //                                               children: [
      //                                                 Icon(Icons.delete_rounded, color: Colors.red),
      //                                                 SizedBox(width: 10),
      //                                                 Text("Hapus", style: TextStyle(color: Colors.black))
      //                                               ],
      //                                             ),
      //                                           ),
      //                                         )
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                             Divider(),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     Row(
      //                                       children: [
      //                                         Text("Qty",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                       ],
      //                                     ),
      //                                     Row(
      //                                       children: [
      //                                         Text("4",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.end,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text("Harga",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                           ],
      //                                         ),
      //                                         Row(
      //                                           children: [
      //                                             Text("Rp. 10.000",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                             Divider(),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Container(
      //                                               decoration: BoxDecoration(
      //                                                 color: Colors.red,
      //                                                 borderRadius: BorderRadius.circular(5),
      //                                               ),
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(5.0),
      //                                                 child: Icon(Icons.remove, color: Colors.white),
      //                                               ),
      //                                             ),
      //                                             SizedBox(width: 2),
      //                                             Container(
      //                                               decoration: BoxDecoration(
      //                                                 color: Colors.blue,
      //                                                 borderRadius: BorderRadius.circular(5),
      //                                               ),
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(5.0),
      //                                                 child: Icon(Icons.add, color: Colors.white),
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.end,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text("Sub Total",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
      //                                             SizedBox(width: 25),
      //                                             Text("Rp. 40.000",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 15),
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(10),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: Colors.black.withOpacity(0.2),
      //                         blurRadius: 8,
      //                         offset: Offset(0, 4), // Bayangan
      //                       ),
      //                     ],
      //                   ),
      //                   child: Column(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.all(20.0),
      //                         child: Column(
      //                           children: [
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     Row(
      //                                       children: [
      //                                         Text("Nama Barang",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                       ],
      //                                     ),
      //                                     Row(
      //                                       children: [
      //                                         Text("Mie Gacoan",style: TextStyle(color: Colors.black, fontSize: 14)),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       children: [
      //                                         Container(
      //                                           decoration: BoxDecoration(
      //                                             borderRadius: BorderRadius.circular(10),
      //                                             border: Border.all(color: Colors.black)
      //                                           ),
      //                                           child: Padding(
      //                                             padding: const EdgeInsets.all(5.0),
      //                                             child: Row(
      //                                               children: [
      //                                                 Icon(Icons.delete_rounded, color: Colors.red),
      //                                                 SizedBox(width: 10),
      //                                                 Text("Hapus", style: TextStyle(color: Colors.black))
      //                                               ],
      //                                             ),
      //                                           ),
      //                                         )
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                             Divider(),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     Row(
      //                                       children: [
      //                                         Text("Qty",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                       ],
      //                                     ),
      //                                     Row(
      //                                       children: [
      //                                         Text("3",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.end,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text("Harga",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                           ],
      //                                         ),
      //                                         Row(
      //                                           children: [
      //                                             Text("Rp. 10.000",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                             Divider(),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Container(
      //                                               decoration: BoxDecoration(
      //                                                 color: Colors.red,
      //                                                 borderRadius: BorderRadius.circular(5),
      //                                               ),
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(5.0),
      //                                                 child: Icon(Icons.remove, color: Colors.white),
      //                                               ),
      //                                             ),
      //                                             SizedBox(width: 2),
      //                                             Container(
      //                                               decoration: BoxDecoration(
      //                                                 color: Colors.blue,
      //                                                 borderRadius: BorderRadius.circular(5),
      //                                               ),
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(5.0),
      //                                                 child: Icon(Icons.add, color: Colors.white),
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.end,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text("Sub Total",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
      //                                             SizedBox(width: 25),
      //                                             Text("Rp. 30.000",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 15),
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(10),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: Colors.black.withOpacity(0.2),
      //                         blurRadius: 8,
      //                         offset: Offset(0, 4), // Bayangan
      //                       ),
      //                     ],
      //                   ),
      //                   child: Column(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.all(20.0),
      //                         child: Column(
      //                           children: [
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     Row(
      //                                       children: [
      //                                         Text("Nama Barang",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                       ],
      //                                     ),
      //                                     Row(
      //                                       children: [
      //                                         Text("Mie Gacoan",style: TextStyle(color: Colors.black, fontSize: 14)),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       children: [
      //                                         Container(
      //                                           decoration: BoxDecoration(
      //                                             borderRadius: BorderRadius.circular(10),
      //                                             border: Border.all(color: Colors.black)
      //                                           ),
      //                                           child: Padding(
      //                                             padding: const EdgeInsets.all(5.0),
      //                                             child: Row(
      //                                               children: [
      //                                                 Icon(Icons.delete_rounded, color: Colors.red),
      //                                                 SizedBox(width: 10),
      //                                                 Text("Hapus", style: TextStyle(color: Colors.black))
      //                                               ],
      //                                             ),
      //                                           ),
      //                                         )
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                             Divider(),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     Row(
      //                                       children: [
      //                                         Text("Qty",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                       ],
      //                                     ),
      //                                     Row(
      //                                       children: [
      //                                         Text("3",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.end,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text("Harga",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 12)),
      //                                           ],
      //                                         ),
      //                                         Row(
      //                                           children: [
      //                                             Text("Rp. 10.000",style: TextStyle(color: Colors.black, fontSize: 16)),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                             Divider(),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Container(
      //                                               decoration: BoxDecoration(
      //                                                 color: Colors.red,
      //                                                 borderRadius: BorderRadius.circular(5),
      //                                               ),
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(5.0),
      //                                                 child: Icon(Icons.remove, color: Colors.white),
      //                                               ),
      //                                             ),
      //                                             SizedBox(width: 2),
      //                                             Container(
      //                                               decoration: BoxDecoration(
      //                                                 color: Colors.blue,
      //                                                 borderRadius: BorderRadius.circular(5),
      //                                               ),
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(5.0),
      //                                                 child: Icon(Icons.add, color: Colors.white),
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Column(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.end,
      //                                       children: [
      //                                         Row(
      //                                           children: [
      //                                             Text("Sub Total",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
      //                                             SizedBox(width: 25),
      //                                             Text("Rp. 30.000",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 15),
      //               ],
      //             ),
      //           ),
      //         ),
      //       )
      //     ),
      
      //     Positioned(
      //       bottom: 0, // Posisi Container sedikit ke atas AppBar
      //       left: 0,
      //       right: 0,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(color: Colors.grey)
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.all(10.0),
      //           child: Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 5),
      //                 child: Row(
      //                   children: [
      //                     Text("Metode Pembayaran"),
      //                   ],
      //                 ),
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Switch(
      //                     value: isSwitched,
      //                     onChanged: (value) {
      //                       setState(() {
      //                         isSwitched = value;
      //                       });
      //                     },
      //                   ),
      //                   Text(
      //                     isSwitched ? "Non-Tunai" : "Tunai",
      //                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //                   ),
      //                 ],
      //               ),
      //               Divider(),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Column(
      //                         children: [
      //                           Text("Total Bayar"),
      //                         ],
      //                       ),
      //                       Column(
      //                         children: [
      //                           Text("Rp. 138.000", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                   Column(
      //                     mainAxisAlignment: MainAxisAlignment.end,
      //                     children: [
      //                       Container(
      //                         width: MediaQuery.of(context).size.width * 0.30,
      //                         decoration: BoxDecoration(
      //                           color: Color.fromARGB(255, 1, 94, 110),
      //                           borderRadius: BorderRadius.circular(10)
      //                         ),
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Row(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: [
      //                               Icon(Icons.payments_rounded, color: Colors.white),
      //                               SizedBox(width: 10),
      //                               Text("Bayar", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))
      //                             ],
      //                           ),
      //                         ),
      //                       )
      //                     ],
      //                   )
      //                 ],
      //               ),
                    
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}