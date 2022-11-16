
class TestCase{

  static emailValidation(String val){
    if (val.isEmpty) {
      return 'This field is required';
    }
    if(val.trim().length < 4){
      return "Email must be at least 4 characters in length";
    }
    if(val.trim().length > 50){
      return "Please enter a valid email address";
    }
    if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(val)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static passwordValidation(String val){
    if (val.isEmpty) {
      return 'This field is required';
    }
    if(val.trim().length < 8){
      return "password must be at least 8 characters in length";
    }
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])\S{8,}$').hasMatch(val)) {
      return "Please enter a valid password";
    }
    return null;
  }


}