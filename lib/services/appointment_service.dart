import '../models/appointment.dart';
import '../data/mock_data.dart';

class AppointmentService {
  /// ✅ Convert `mockAppointments` to a list of `Appointment` objects
  List<Appointment> _getAppointments() {
    return mockAppointments.map((data) => Appointment.fromJson(data)).toList(); // ✅ Fixed conversion
  }

  /// ✅ Get user-specific appointments
  List<Appointment> getUserAppointments(String userId) {
    return _getAppointments().where((appt) => appt.userId == userId).toList();
  }

  /// ✅ Book a new appointment safely (Returns `true` if successful)
  bool bookAppointment(Appointment newAppointment) {
    if (newAppointment.userId.trim().isEmpty || newAppointment.therapistId.trim().isEmpty) {
      throw Exception("Error: User ID and Therapist ID must be provided.");
    }

    // ✅ Prevent duplicate bookings at the same time
    bool alreadyExists = _getAppointments().any((appt) =>
    appt.userId == newAppointment.userId &&
        appt.dateTime.isAtSameMomentAs(newAppointment.dateTime));

    if (alreadyExists) {
      throw Exception("Error: Appointment already exists for this time slot.");
    }

    mockAppointments.add(newAppointment.toJson());
    return true;
  }

  ///  Cancel an appointment safely (Returns `true` if successful)
  bool cancelAppointment(String appointmentId) {
    final index = mockAppointments.indexWhere((appt) => appt['id'] == appointmentId);

    if (index == -1) {
      throw Exception("Error: Appointment not found.");
    }

    mockAppointments.removeAt(index);
    return true;
  }
}
