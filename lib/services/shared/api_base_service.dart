
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview_task/services/shared/preference_service.dart';
import 'package:interview_task/services/shared/request_method.dart';
import '../../core/model/base_model.dart';
import '../../core/model/exception/api_exception.dart';
import '../../locator.dart';
import '../../router.dart';
import 'api_base_helper.dart';
import 'api_model/error_response_exception.dart';
import 'api_model/no_response_exception.dart';
import 'api_model/request_settings.dart';
import 'dialog_service.dart';
import 'package:http/http.dart' as HTTP;


class ApiBaseService extends ApiBaseHelper {


  final PreferenceService _preferenceService = locator<PreferenceService>();
  final DialogService _dialogService = locator<DialogService>();
  var client = new HTTP.Client();

  Future<List<T>> requestList<T extends BaseModel>(RequestSettings settings) async {
    try {
      var response = await _sendAsync(settings.method, settings.endPoint, settings.params, authenticated: settings.authenticated);
      if (response != null) {
        var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        print("Decoded Response: $jsonResponse");

        if (response.statusCode == 200 || response.statusCode == 201) {
          final data = jsonResponse is List
              ? jsonResponse
              : jsonResponse['data']; // Adjust based on actual response

          return data.map((e) => BaseModel.createFromMap<T>(e)).cast<T>().toList();
        } else {
          throw ErrorResponseException.fromJson(jsonResponse);
        }
      }
    } on TimeoutException catch (exception, stacktrace) {
      _dialogService.showDialog(title: "Server Error", description: "There is a problem connecting to the server");
    } on ErrorResponseException catch (exception) {
      throw exception;
    } catch (exception, stacktrace) {
      print("Unexpected exception in requestList: $exception");
      print(stacktrace);
    }

    throw NoResponseException(message: "No Response: something error");
  }

  Future<T> request<T extends BaseModel>(RequestSettings settings) async {

    try {
      var response = await _sendAsync(settings.method, settings.endPoint, settings.params, authenticated: settings.authenticated);
      if (response != null) {
        var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
          return BaseModel.createFromMap<T>(jsonDecode(utf8.decode(response.bodyBytes)));
        } else {
          throw ErrorResponseException.fromJson(jsonResponse);
        }
      }
    } on TimeoutException catch (exception, stacktrace) {
      _dialogService.showDialog(title: "Server Error", description: "There is a problem connecting server");
    } on ErrorResponseException catch (exception) {
      throw exception;
    } catch (exception, stacktrace) {
    }
    throw NoResponseException(message: "No Response: something error",);
  }

  Future<HTTP.Response?> _sendAsync(String method, String endPoint, Object? body, { Map<String, String>? queryParams, bool authenticated = true}) async {

    String path =   endPoint ;

    var url = Uri.parse( path + (queryParams != null ? Uri(queryParameters: queryParams).query : ""));

    // Create Http Request using Method & URL
    HTTP.Request requestMessage = HTTP.Request(method, url);

    // Add Body Content to Request, Serialize Body Object if it is not a String
    // Add Headers to Request from _headers() function
    if (!(body is HTTP.MultipartRequest))
      requestMessage.body = (body is String) ? body : serialize(body);
    requestMessage.headers.addAll(_headers(body, authenticated));

    // Declared HTTP Response Object
    HTTP.Response? response;

    try {

      // If body Object is Multipart Request, add headers to body object
      if (body is HTTP.MultipartRequest) body.headers.addAll(requestMessage.headers);


      // Stream Response using HTTP
      // Send body if it is a Multipart Request, else send Request Message
      response =  await HTTP.Response.fromStream(await client.send(body is HTTP.MultipartRequest ? body : requestMessage));


    } on HttpException catch (e) {

      var error =  ApiException(handleConnectionError());
      if ((error!= null && error.error!= null)) {
        if(error.error.getSingleMessage()!=null){
          locator<DialogService>().showDialog(title: error.error.message ?? '');
         // description: error.error.getSingleMessage()
        }
      }
    }

    // [Returns]
    // Process and Return Response data according to the Response Status Code
    return _handleResponse(response);
  }

  Future<String?> uploadImageToServer(File file) async {
    HTTP.MultipartRequest request = _initMultipartRequest(RequestMethod.POST, '/core/s3-upload/');

    if (file != null){
      request.files.add(await HTTP.MultipartFile.fromPath('file', file.path,));
    }

    var response = await _sendAsync(RequestMethod.POST, '/core/s3-upload/', request, authenticated: true);
    if (response != null){
      print(jsonDecode(response.body)['file']);
      return jsonDecode(response.body)['file'];
    }
    return null;
  }

  HTTP.MultipartRequest _initMultipartRequest(String method, String path){
    String? baseUrl = '';
    var url = Uri.parse(baseUrl + path);
    return new HTTP.MultipartRequest(method, url);
  }

  // [Returns]
  // Add Headers according to [body] Object Type
  // Add Authentication Token if [authenticated] is true
  Map<String, String> _headers(Object? body, bool authenticated){
    Map<String, String> headerParams = {};
    headerParams["HttpHeaders.contentTypeHeader"] = "application/json";

    if (body is String) {
      headerParams["Content-Type"] = "application/x-www-form-urlencoded";
    } else if (body is Map) {
      headerParams['Accept'] = "application/json";
      headerParams["Content-Type"] = "application/json";
    } else if (body is HTTP.MultipartRequest) {
      headerParams['Accept'] = "application/json";
      headerParams["Content-Type"] = "multipart/form-data";
    }

    if (authenticated != null && authenticated) {
      headerParams['Authorization'] = "Token " + _preferenceService.getBearerToken();
      headerParams['student'] = locator<PreferenceService>().getStudentId().toString();
       headerParams['is-parent'] = locator<PreferenceService>().getIsParent() == true ? "1" : "2";
    }

    return headerParams;
  }

  // [Returns]
  // Process and Return Response data according to the Response Status Code
  Future<HTTP.Response?> _handleResponse(HTTP.Response? response) async {
    if (response == null){
      return null;
    }

    debugPrint(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("response printing from hagle responce $response");
      return response;

    } else if (response.statusCode == 401) {
      Fluttertoast.showToast(msg: "Your session has expired. Please login again");
      _preferenceService.clearData();
      navigationService.popAllAndPushNamed(Routes.home);
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      var error = await handleApiError(response, false);
      if (error != null ) {
        if(error.getSingleMessage() != null ){
          locator<DialogService>().showDialog(title: error.message ?? '',);
          // description: error.getSingleMessage()
        }
      }
    } else if (response.statusCode >= 500) {
      Fluttertoast.showToast(msg: "Your session has expired. Please login again");
      _preferenceService.clearData();
      navigationService.popAllAndPushNamed(Routes.home);
      print("response printing from hagle responce $response   500");
    }

    return null;
  }
}