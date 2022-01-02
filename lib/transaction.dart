class Transaction {
  late final String id;
  late final String title;
  late final double amount;
  late final DateTime dateTime;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.dateTime});
}
