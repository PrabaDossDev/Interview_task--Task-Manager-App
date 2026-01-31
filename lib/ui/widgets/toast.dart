
import 'package:fluttertoast/fluttertoast.dart';

errorToast(String msg){
  Fluttertoast.showToast(
    msg:msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity:ToastGravity.BOTTOM,
  );
}