

class AccountLoginModel{
  final String email;
  final String password;

  AccountLoginModel(this.email, this.password);

}

class AccountRegistrationModel{
  final email, password, firstName, lastName, displayName;
  String id;
  AccountRegistrationModel({this.id, this.email, this.password, this.firstName, this.lastName, this.displayName});


  Map<String, dynamic> toJson() {
    return {
      'email' : email,
      'firstName' : firstName,
      'lastName' : lastName,
      'displayName' : displayName,
      'balance' : 10000,
      'limit' : -1000,
      'monthLimit' : 5000
    };
  }




}