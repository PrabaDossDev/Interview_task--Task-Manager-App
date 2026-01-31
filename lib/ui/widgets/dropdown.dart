import 'package:flutter/material.dart';
import '../../core/model/base_model.dart';
import '../../core/res/colors.dart';
import '../../core/res/styles.dart';

class DropDown<T extends BaseModel> extends StatelessWidget {

  String? title;
  List<T>? items;
  T? selectedItem;
  Key valueKey;
  String? itemValue;
  String? itemText;
  String? hint;
  EdgeInsets? margin;
  FocusNode? focusNode;
  Function(T?)? onChange;
  bool? validate;
  String? errorText;

  bool removeDecoration = false;

  DropDown(this.valueKey, { this.itemText, this.itemValue, this.hint, this.focusNode, this.validate, this.errorText, this.title, this.items, this.margin, this.selectedItem, this.onChange});

  DropDown.noDecoration(this.valueKey, { this.itemText, this.itemValue, this.hint, this.focusNode, this.validate, this.errorText, this.title, this.items, this.margin, this.selectedItem, this.onChange}){
    removeDecoration = true;
  }

  BorderRadius borderRadius = BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.all(0) : margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(!removeDecoration)
          Text(title!, textScaleFactor: 1, style:  AppTextStyle.label3Medium.copyWith(fontSize: 12, fontWeight: FontWeight.w500)),

          if(!removeDecoration)
          Padding(padding: EdgeInsets.only(top: 10),),

          DropdownButtonFormField<T>(
              key: valueKey,
              value: selectedItem,
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 30,
              elevation: 16,
              hint: Text(hint!, textScaleFactor: 1,),
              style: removeDecoration ? AppTextStyle.subtitle : AppTextStyle.body,
              isExpanded: true,
              focusNode: focusNode,
              decoration: InputDecoration(
                errorText: validate! ? errorText == null ? "Required *" : errorText : null,
                errorMaxLines: 2,
                errorStyle: TextStyle(color: Colors.red),
                hintStyle: TextStyle(color: Colors.black54),
                labelStyle: focusNode == null ? new TextStyle(color: Colors.black54,) : (focusNode!.hasFocus ? TextStyle(color: AppColor.primary) : TextStyle(color: Colors.black54)),
                fillColor: Colors.grey.shade200,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: removeDecoration ? Colors.transparent: Colors.black54),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: removeDecoration ? Colors.transparent: Colors.black12),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: removeDecoration ? Colors.transparent: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: removeDecoration ? Colors.transparent: AppColor.primary, width: 2),
                ),
                prefixStyle: AppTextStyle.body,
              ),
              validator: validate! ? (value) => errorText : null,
              onChanged: (T? newValue) {
                onChange!(newValue);
              },
              items: items!.map<DropdownMenuItem<T>>((T value) {
                Map data = value.toJson();
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(data[itemText], textScaleFactor: 1,),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

}

// class DropDown extends StatefulWidget {
//   final String value;
//   final String title;
//   final List<Map<String, dynamic>> items;
//   final ValueChanged<dynamic> onChanged;
//
//   DropDown({
//     this.title,
//     @required this.value,
//     @required this.items,
//     @required this.onChanged,
//   });
//
//   DropDown.withTitle(
//     this.title, {
//     @required this.value,
//     @required this.items,
//     @required this.onChanged,
//   });
//
//   @override
//   _DropDownState createState() => _DropDownState();
// }
//
// class _DropDownState extends State<DropDown> {
//   List<DropdownMenuItem> dropdownData = new List();
//
//   @override
//   void initState() {
//     super.initState();
//
//     for (Map<String, dynamic> data in items) {
//       dropdownData.add(DropdownMenuItem<String>(
//         child: Text(data['value']),
//         value: data['code'],
//       ));
//     }
//     setState(() {});
//
//     print(dropdownData.length);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       alignment: Alignment.center,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           title == null
//               ? Container()
//               : new Text(
//                   title,
//                   textScaleFactor: 1,
//                   style: TextStyle(
//                       color: AppColor.secondaryText,
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal),
//                 ),
//           title == null
//               ? Container()
//               : new Padding(padding: EdgeInsets.only(top: 0)),
//           dropdownData == null
//               ? Container()
//               : Container(
//                   // decoration: BoxDecoration(
//                   //     color: whiteColor,
//                   //     shape: BoxShape.rectangle,
//                   //     boxShadow: AppStyle.cardShadow,
//                   // ),
//                   //padding: EdgeInsets.only(left: 10, right: 10),
//                   child: DropdownButton(
//                     style: TextStyle(
//                         color: AppColor.text,
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal),
//                     items: dropdownData,
//                     onChanged: onChanged,
//                     isExpanded: true,
//                     value: value,
//                   ),
//                 )
//         ],
//       ),
//     );
//   }
// }
