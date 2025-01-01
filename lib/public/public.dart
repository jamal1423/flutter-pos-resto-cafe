// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:app_pos/public/currency.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


final GlobalKey<FormState> formKey = GlobalKey<FormState>();
// List<DataListKim> itemsData = [];


List listMenu = [];
NumberFormat formatter = NumberFormat('#,##0');
NumberFormat formatter2 = NumberFormat('#,##0.00');
List<String> listChoicePopUp = ['Ubah'];

// ignore: camel_case_types
enum textAs { asString, asNumber, asDigit, asMultiLine }

String iUserID = 'system';
String iUserIDNama = 'System';
String iDepartment = 'System';
// String wifiSerialIp = '10.16.46.250';
// String wifiSerialPort = '8899';
String wifiSerialIp = '';
String wifiSerialPort = '';
String appVersion = '-';
String appName = '-';

bool disableAll = false;
bool isUpdateTbg2 = false;

enum StatusToast { error, success, normal }

const Map<int, TableColumnWidth> twoColumnTable = {
  0: FlexColumnWidth(2),
  1: FlexColumnWidth(7),
};

const Map<int, TableColumnWidth> twoColumnLargeTable = {
  0: FlexColumnWidth(3),
  1: FlexColumnWidth(6),
};

Table tableWidget(
    {List<TableRow>? listtablerow,
    Map<int, TableColumnWidth> totColumn = twoColumnTable}) {
  return Table(
    columnWidths: totColumn,
    children: listtablerow!,
  );
}

TableRow tableRowWidgetList(List<Widget> list) {
  return TableRow(
    children: list,
  );
}

TableRow tableRowEmptyWidgetList(
    {Map<int, TableColumnWidth> totColumn = twoColumnTable}) {
  return TableRow(
    children: totColumn.entries.map((e) {
      return Container();
    }).toList(),
  );
}

TableRow tableRowSpaceHeightWidgetList(
    {Map<int, TableColumnWidth> totColumn = twoColumnTable,
    double height = 5}) {
  return TableRow(
    children: totColumn.entries.map((e) {
      return SizedBox(
        height: height,
      );
    }).toList(),
  );
}

Widget widgetWithRefresh(
  bool refresh, {
  Widget widgetMain = const Text(''),
  Widget? widgetRefresh,
  Color colorRefresh = Colors.white,
}) {
  return (!refresh)
      ? widgetMain
      : (widgetRefresh == null)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: colorRefresh,
                    strokeWidth: 2,
                  ),
                ),
              ],
            )
          : widgetRefresh;
}

Future toNextPage(context, String idx) async {
  /*Navigator.push(context,
      MaterialPageRoute(
          builder: (context) => _ssb(idx)
      )
  );*/
  Navigator.pushNamed(context, '/$idx');
}

dynamic nextPage(BuildContext context, Widget widget) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

dynamic nextPageReplace(BuildContext context, Widget widget) async {
  return await Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

dynamic nextPageReplaceRemove(BuildContext context, Widget widget) async {
  return await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

void soundPlay(bool ok) async {
  if (ok) {
    await AudioPlayer().play(AssetSource('audio/beep.mp3'));
  } else {
    await AudioPlayer().play(AssetSource('audio/wrong.mp3'));
  }
}

Widget noDataFoundWidget() {
  return Align(
    alignment: Alignment.center,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 180,
          child: Image.asset('assets/empty-box.webp'),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Data tidak ditemukan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget listDataCustom({
  required List data,
  List<Widget> Function(int index)? children,
  Function? onSelected,
  bool? onlyList = true,
  bool? disableChoice = false,
}) {
  return ListView.separated(
    itemCount: data.length,
    separatorBuilder: (buildcontext, index) {
      return const Padding(padding: EdgeInsets.all(4));
    },
    itemBuilder: (buildcontext, index) {
      return Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 8,
                    bottom: 8,
                    right: 8.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children!(index),
                  ),
                ),
              ),
              (disableChoice!)
                  ? Container()
                  : const VerticalDivider(
                      thickness: 1,
                      width: 1,
                    ),
              (disableChoice)
                  ? Container()
                  : !onlyList!
                      ? PopupMenuButton<String>(
                          onSelected: (value) {
                            onSelected!(value, index);
                          },
                          itemBuilder: (buildcontext) {
                            return listChoicePopUp.map((e) {
                              var ii = listChoicePopUp.indexOf(e);
                              return PopupMenuItem<String>(
                                value: listChoicePopUp[ii],
                                child: Text(listChoicePopUp[ii]),
                              );
                            }).toList();
                          },
                        )
                      : Checkbox(
                          value: data[index]['IPILIH'] == 1 ? true : false,
                          onChanged: (val) {
                            onSelected!(val, index);
                          },
                        ),
            ],
          ),
        ),
      );
    },
  );
}

// Shared Preference //

Future readPref(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future savePref(String key, value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future removePref(String key) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}


Widget scrollController({
required List<dynamic>? data,
Function? scrollController,
Function? itemBuildFunction,
int itemCount = 1,
int? indexData,
required bool cekLoading,
String? sendData,
String? itemSendData,
double? widthContainer,
double? heightContainer,
required Future<void> Function() onRefreshPage,
required ScrollController? scrollData,
required Widget Function(int index) dataWidget,
IndexedWidgetBuilder? itemBuilder,
}){
  return Expanded(
    child: RefreshIndicator(
      onRefresh: onRefreshPage,
      color: Colors.grey,
      child: ListView.builder(
        controller: scrollData,
        shrinkWrap: true,
        itemCount: data!.length + (cekLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == data.length) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            );
          }
          return dataWidget(index);
        }
      ),
    ),
  );
}

Widget textFormControl(
  BuildContext context, {
  String xlabel = '',
  String? xinitialValue,
  String? xhintText,
  String? xlabelText,
  double? xlabelStyleSize,
  double xborderBottomLeft = 0,
  double xborderBottomRight = 0,
  double xborderTopLeft = 0,
  double xborderTopRight = 0,
  double xborderFocusBottomLeft = 0,
  double xborderFocusBottomRight = 0,
  double xborderFocusTopLeft = 0,
  double xborderFocusTopRight = 0,
  double xIconSize = 23,
  double xsuffixIconSize = 23,
  int xMaxChar = 100,
  IconData? xIcon,
  IconData? xsuffixIcon,
  Color xColorIcon = Colors.black,
  Color xlabelColor = Colors.black,
  Color xlabelStyleColor = Colors.black,
  Color xhintColor = Colors.black,
  Color xsuffixColorIcon = Colors.black,
  required TextEditingController? xtextEditingController,
  textAs astext = textAs.asString,
  bool passwd = false,
  bool disableCounter = true,
  bool disableText = false,
  int maxLength = TextField.noMaxLength,
  Function? onSubmit,
  Function? onChange,
  Function? onSuffixClick,
  Function? onClearTextClick,
  TextAlign? xtextAlign,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        xlabel,
        style: TextStyle(
          fontSize: 13,
          color: xlabelColor,
        ),
      ),
      // TextField(
      TextFormField(
        cursorColor: Colors.black,
        // textCapitalization: TextCapitalization.characters,
        maxLines: (astext == textAs.asMultiLine) ? null : 1,
        maxLength: maxLength,
        obscureText: passwd,
        initialValue: xinitialValue,
        textAlign: xtextAlign ??
            ((astext == textAs.asNumber)
            ?
              TextAlign.right
            :
              (astext == textAs.asDigit)
              ?
                xtextEditingController!.text.isEmpty ? TextAlign.left : TextAlign.right
              :
              TextAlign.left),
        controller: xtextEditingController!,
        validator: (String? arg) {
          if (arg == null || arg.isEmpty) {
            return 'Inputan $xlabel tidak boleh kosong';
          } else {
            return null;
          }
        },
        onSaved: (String? val) {
          xtextEditingController.text = val!;
        },
        keyboardType: 
          (astext == textAs.asNumber) 
          ? 
            TextInputType.number
          : 
            (astext == textAs.asDigit) 
            ? 
              const TextInputType.numberWithOptions(decimal: true)
            : 
              (astext == textAs.asString) 
              ? 
                TextInputType.text
              : 
                TextInputType.multiline,
                inputFormatters: (astext == textAs.asNumber)
                ? 
                  <TextInputFormatter>[
                    // FilteringTextInputFormatter.digitsOnly
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))
                  ]
                : 
                (astext == textAs.asDigit)
                ?
                  [
                    CurrencyTextInputFormatter(
                      decimalDigits: 0,
                      symbol: '',
                    ),
                  ]
                :
                  // (astext == textAs.asMultiLine)
                  // ?
                  //   <TextInputFormatter>[
                  //     LengthLimitingTextInputFormatter(xMaxChar)
                  //   ]
                  // :
                    [
                      
                    ]
            ,
        cursorWidth: 1,
        style: const TextStyle(
          decoration: TextDecoration.none,
        ),
        // style: const TextStyle(fontSize: 16.0, color: Colors.black),
        readOnly: disableText,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 20),
          hintText: xhintText,
          hintStyle: TextStyle(color: xhintColor),
          labelText: xlabelText,
          labelStyle: TextStyle(color: xlabelStyleColor, fontSize: xlabelStyleSize),
          prefixIcon: xIcon == null ? null : Icon(xIcon, size: 23, color: xColorIcon),
          counterText: disableCounter ? '' : null,
          suffixIconConstraints: const BoxConstraints(minWidth: 40),
          // suffixIcon: Icon(xsuffixIcon, size: 23, color: xsuffixColorIcon),
          // suffixIcon: IconButton(
          //           icon: Icon(xsuffixIcon, size: 23, color: xsuffixColorIcon),
          //             onPressed: () {
          //               onSuffixClick;
          //             },
          //           ),
          suffixIcon: (onSuffixClick != null || onClearTextClick != null)
              ? IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (onSuffixClick != null || onClearTextClick != null)
                          ? 
                            // const Padding(
                            //   padding: EdgeInsets.only(
                            //     right: 10,
                            //   ),
                            //   child: VerticalDivider(
                            //     width: 1,
                            //     thickness: 1,
                            //     color: Colors.black54,
                            //   ),
                            // )
                            Container()
                          : Container(),
                      (onSuffixClick != null)
                          ? GestureDetector(
                              onTap: () {
                                onSuffixClick();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 20,
                                ),
                                child: Icon(xsuffixIcon, size: xsuffixIconSize, color: xsuffixColorIcon),
                              ),
                            )
                          : Container(),
                      (onClearTextClick != null)
                          ? GestureDetector(
                              onTap: () {
                                onClearTextClick();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 20,
                                ),
                                child: Icon(xsuffixIcon, size: xsuffixIconSize, color: xsuffixColorIcon),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              : null,
          // contentPadding:
          //     const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          isDense: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white70,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(xborderFocusBottomLeft), bottomRight: Radius.circular(xborderFocusBottomRight), topLeft: Radius.circular(xborderFocusTopLeft), topRight: Radius.circular(xborderFocusTopRight)),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(xborderBottomLeft), bottomRight: Radius.circular(xborderBottomRight), topLeft: Radius.circular(xborderTopLeft), topRight: Radius.circular(xborderTopRight)),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (str) {
          (onChange != null) ? onChange(str) : (str) {};
        },
        //aktifkan jika pakai "TexField"
        // onSubmitted: (value) {
        //   (onSubmit != null) ? onSubmit() : () {};
        // },
      ),
    ],
  );
}

// ignore: must_be_immutable
class UbahNumberModal extends StatefulWidget {
  UbahNumberModal(
      {Key? key, this.harga = '', this.notrans = '', this.title = 'harga beli', this.updatetbg2 = ''})
      : super(key: key);
  String harga;
  String notrans;
  String title;
  String updatetbg2;
  @override
  State<UbahNumberModal> createState() => _UbahNumberModalState();
}

class _UbahNumberModalState extends State<UbahNumberModal> {
  final TextEditingController _txtharga = TextEditingController();
  bool loadingSimpan = false;

  void _initState() {
    setState(() {
      _txtharga.text = widget.harga;
      if(widget.updatetbg2 == 'yes'){
        isUpdateTbg2 = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ubah ${widget.title}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textFormControl(
              context,
              xlabel: widget.title,
              xtextEditingController: _txtharga,
              xborderBottomRight: 20,
              xborderTopRight: 20,
              xborderFocusBottomRight: 20,
              xborderFocusTopRight: 20,
              xborderBottomLeft: 20,
              xborderFocusTopLeft: 20,
              xborderTopLeft: 20,
              xborderFocusBottomLeft: 20,
              astext: textAs.asDigit,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            Navigator.pop(context, _txtharga.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: !loadingSimpan
              ? const Text('Simpan', style: TextStyle(color: Colors.white))
              : const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                    strokeWidth: 2,
                  ),
                ),
        ),
      ],
    );
  }
}
