import '../domain/banking_response.dart';

class Auth {
  BankingResponse validatePin({String? pin}) {
    if (pin != '08999') {
      return BankingResponse(
        status: false,
        message: 'Invalid pin!',
      );
    } else {
      return BankingResponse(status: true, message: 'Success');
    }
  }
}
