import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  List<TimeOfDay> availableTimeSlots = [
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 10, minute: 0),
    TimeOfDay(hour: 11, minute: 0),
    TimeOfDay(hour: 14, minute: 0),
    TimeOfDay(hour: 15, minute: 0),
    TimeOfDay(hour: 16, minute: 0),
  ]; // Define your available time slots here

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime)
      setState(() {
        selectedTime = pickedTime;
      });
  }

  bool isTimeSlotAvailable(TimeOfDay timeSlot) {
    // Check if the selected time slot is available
    return availableTimeSlots.contains(timeSlot);
  }

  Future<void> _bookAppointment() async {
    if (isTimeSlotAvailable(selectedTime)) {
      try {
        await FirebaseFirestore.instance.collection('appointments').add({
          'date': selectedDate,
          'time': selectedTime,
        });
        // Show a confirmation message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Appointment booked successfully')),
        );
      } catch (e) {
        // Show an error message if booking failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to book appointment')),
        );
      }
    } else {
      // Show a message indicating that the selected time slot is not available
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected time slot is not available')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Text('Book Appointment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () => _selectDate(context),
              icon: Icon(Icons.calendar_today),
              label: Text(
                'Select Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.deepPurple.shade700,
                minimumSize: Size(150, 40),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Date: ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _selectTime(context),
              icon: Icon(Icons.access_time),
              label: Text(
                'Select Time',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.deepPurple.shade700,
                minimumSize: Size(140, 45),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _bookAppointment,
              icon: Icon(Icons.book),
              label: Text('Confirm Appointment'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.deepPurple.shade700,
                minimumSize: Size(140, 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
