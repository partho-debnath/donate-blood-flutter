class NetworkResponse {
  String? status;
  int? statusCode;
  Map<String, dynamic>? data;
  String? message;
  NetworkResponse(this.status, this.statusCode, this.data, this.message);

  NetworkResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'];
    message = json['message'];
  }
}
