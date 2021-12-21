class PasswordModel{
  late int Password;
  PasswordModel({
    required this.Password,
  });
  PasswordModel.fromJson(Map<String, dynamic> json){
    Password=json['Password'];
  }
  Map<String, dynamic> toMap(){
return{
  'Password':Password,
};
  }
}