import '../models/payment.dart';
import '../data/mock_data.dart';

class PaymentService {
  ///  Convert `mockPayments` to a list of `Payment` objects
  List<Payment> _getPayments() {
    return mockPayments.map((data) => Payment.fromJson(data)).toList(); //  Fixed conversion
  }

  /// Process a new payment securely (Returns `true` if successful)
  bool processPayment(Payment payment) {
    if (payment.userId.trim().isEmpty || payment.amount <= 0 || payment.currency.trim().isEmpty) {
      throw Exception("Error: Invalid payment details. User ID, amount, and currency are required.");
    }

    mockPayments.add(payment.toJson());
    return true;
  }

  ///  Fetch all payments for a specific user
  List<Payment> getUserPayments(String userId) {
    return _getPayments().where((payment) => payment.userId == userId).toList();
  }

  ///  Get the latest payment made by a user (or `null` if none found)
  Payment? getLatestPayment(String userId) {
    List<Payment> userPayments = getUserPayments(userId);
    return userPayments.isNotEmpty
        ? userPayments.reduce((curr, next) =>
    curr.transactionDate.isAfter(next.transactionDate) ? curr : next)
        : null;
  }
}
