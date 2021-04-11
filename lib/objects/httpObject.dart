class GetOTPRequest {
  final String
      phone; //phone number send to server for push otp into smart phone
  GetOTPRequest({this.phone});
}

class GetOTPResponse {
  //receive data from getOTP
  final String message; //
  final String key; // code reference 4 byte
  final int
      status; // status for check error  {0 : "phone used", 1 : "receive otp",500 : "server erroe"}

  GetOTPResponse({this.message, this.key, this.status});
}

class ConfirmOTPRequest {
  final String phone;
  final String code;
  ConfirmOTPRequest({this.phone, this.code});
}

class ConfirmOTPResponse {
  final String message;
  final int code;
  ConfirmOTPResponse({this.message, this.code});
}

class RegisterRequest {
  final String name;
  final String phone;
  final String email;
  final String password;

  RegisterRequest({this.name, this.phone, this.email, this.password});
}

class RegisterResponse {
  final String message;
  final int status;
  RegisterResponse({this.message, this.status});
}
