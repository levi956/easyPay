// handles transaction response
class BankingResponse<T> {
  String? message;
  bool status;
  T? data;

  BankingResponse({this.message, required this.status, this.data});
}
