import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static const String bearerToken = "BEARERTOKEN";
  static const String user = "USER";
  static const String studentId = "studentId";
  static const String isParent = "isParent";
  static const String mobileNumber = "mobileNumber";
  static const String usedTimer = "used_timers";


  SharedPreferences? pref;

  init() async {
    pref = await SharedPreferences.getInstance();
  }

  setBearerToken(String value) {
    pref?.setString(bearerToken, value);
    debugPrint("Bearer Token stored successfully");
  }

  setIsParent(bool value) {
    pref?.setBool(isParent, value);
    debugPrint("IsParent stored successfully");
  }

  String getBearerToken() {
    return pref?.getString(bearerToken) ?? "";
  }

  bool? getIsParent() {
    return pref?.getBool(isParent) ?? null;
  }

  String? getMobileNumber() {
    return pref?.getString(mobileNumber) ?? '';
  }

  int getStudentId() {
    return pref?.getInt(studentId) ?? 0;
  }

  markTimerUsed(String exerciseId)  {
    final usedTimers = pref?.getStringList(usedTimer) ?? [];
    if (!usedTimers.contains(exerciseId)) {
      usedTimers.add(exerciseId);
      pref?.setStringList(usedTimer, usedTimers);
    }
  }

  List<String> getMarkTimerUsed()  {
    return pref?.getStringList(usedTimer) ?? [];
  }



  setStudentId (int value) {
    pref?.setInt(studentId,value);
  }


  setMobileNumber(String value) {
    pref?.setString(mobileNumber,value);
  }


  clearData() async {
    pref?.clear();
  }

}
