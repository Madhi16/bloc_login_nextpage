import 'package:bloc_login_nextpage/constant/validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('EmailValidation', () {
    expect(TestCase.emailValidation('abcd@gmsal.com'), null);
  });
  test('PasswordValidation', () {
    expect(TestCase.passwordValidation('Madhi@123'), null);
  });
}