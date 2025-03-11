enum PaymentStatus { Completed, Pending, Failed }
enum PaymentMethod { CreditCard, PayPal, BankTransfer, Other }

class Payment {
  final String id;
  final String userId;
  final double amount;
  final String currency;
  final PaymentStatus status;
  final DateTime transactionDate;
  final PaymentMethod paymentMethod;

  Payment({
    required this.id,
    required this.userId,
    required this.amount,
    required this.currency,
    required this.status,
    required this.transactionDate,
    required this.paymentMethod,
  });

  /// ✅ Convert JSON to Payment Object (Handles missing fields safely)
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0, // ✅ Ensures double type
      currency: json['currency'] ?? 'USD', // ✅ Default currency if missing
      status: _parseStatus(json['status']),
      transactionDate: DateTime.tryParse(json['transactionDate'] ?? '') ?? DateTime.now(),
      paymentMethod: _parsePaymentMethod(json['paymentMethod']),
    );
  }

  /// ✅ Convert Payment Object to JSON (Stores enums as strings)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'currency': currency,
      'status': status.name, // ✅ Store as readable string
      'transactionDate': transactionDate.toIso8601String(),
      'paymentMethod': paymentMethod.name, // ✅ Store as readable string
    };
  }

  /// ✅ Private helper function to parse `status` safely
  static PaymentStatus _parseStatus(String? status) {
    switch (status?.toLowerCase()) {
      case 'completed':
        return PaymentStatus.Completed;
      case 'pending':
        return PaymentStatus.Pending;
      case 'failed':
        return PaymentStatus.Failed;
      default:
        return PaymentStatus.Pending; // ✅ Default to Pending
    }
  }

  /// ✅ Private helper function to parse `paymentMethod` safely
  static PaymentMethod _parsePaymentMethod(String? method) {
    switch (method?.toLowerCase()) {
      case 'creditcard':
        return PaymentMethod.CreditCard;
      case 'paypal':
        return PaymentMethod.PayPal;
      case 'banktransfer':
        return PaymentMethod.BankTransfer;
      default:
        return PaymentMethod.Other; // ✅ Default to Other if unknown
    }
  }
}
