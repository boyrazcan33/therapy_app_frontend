enum AppointmentStatus { Confirmed, Pending, Canceled }

class Appointment {
  final String id;
  final String userId;
  final String therapistId;
  final DateTime dateTime;
  final AppointmentStatus status;

  Appointment({
    required this.id,
    required this.userId,
    required this.therapistId,
    required this.dateTime,
    required this.status,
  });

  ///  Convert JSON to Appointment Object (Handles missing fields safely)
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      therapistId: json['therapistId'] ?? '',
      dateTime: DateTime.tryParse(json['dateTime'] ?? '') ?? DateTime.now(),
      status: _parseStatus(json['status']),
    );
  }

  /// ✅ Convert Appointment Object to JSON (Ensures status is stored as a string)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'therapistId': therapistId,
      'dateTime': dateTime.toIso8601String(),
      'status': status.name,
    };
  }


  static AppointmentStatus _parseStatus(String? status) {
    switch (status?.toLowerCase()) {
      case 'confirmed':
        return AppointmentStatus.Confirmed;
      case 'pending':
        return AppointmentStatus.Pending;
      case 'canceled':
        return AppointmentStatus.Canceled;
      default:
        return AppointmentStatus.Pending;
    }
  }
}
