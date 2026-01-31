import 'dart:core';

class ErrorResponseException {
  bool? success;
  String? error;
  List<String>? errors;

  ErrorResponseException({ this.success, this.error, this.errors});

  ErrorResponseException.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error']?['message'];
    errors = json['errors']?.cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['errors'] = this.errors;
    return data;
  }

  @override
  String toString() {
    return 'ErrorResponseException{success: $success, error: $error, errors: $errors}';
  }
}
