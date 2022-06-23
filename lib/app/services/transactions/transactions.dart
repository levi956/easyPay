import '../domain/banking_response.dart';

class BankingTransactions {
  // transfer money
  BankingResponse transfer({int? amount, int? recipentNumber, num? balance}) {
    if (balance! > amount!) {
      final ref = balance - amount;
      return BankingResponse<num>(
        status: true,
        message: "Amount $amount successfully transferred",
        data: ref,
      );
    } else {
      return BankingResponse(status: false, message: "Insufficeint funds");
    }
  }

  // fund wallet
  BankingResponse fundWallet({int? amount, int? balance}) {
    var fund = amount! + balance!;
    var ref = fund;
    return BankingResponse<num>(
      status: true,
      message: "Account $amount sucessfully funded",
      data: ref,
    );
  }
}
