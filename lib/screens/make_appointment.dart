import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,

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
              label: Text('Select Date',style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ), backgroundColor: Colors.deepPurple.shade700,
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
              label: Text('Select Time',style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ), backgroundColor: Colors.deepPurple.shade700,
                minimumSize: Size(140, 45,),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Implement logic to book the appointment
                // You can use selectedDate and selectedTime variables to proceed
                // e.g., send data to backend, display confirmation message, etc.
              },
              icon: Icon(Icons.book,),
              label: Text('Confirm Appointment'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ), backgroundColor: Colors.deepPurple.shade700,
                minimumSize: Size(140, 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class BookAppointmentScreen extends StatefulWidget {
//   @override
//   _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
// }
//
// class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null && pickedDate != selectedDate)
//       setState(() {
//         selectedDate = pickedDate;
//       });
//   }
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (pickedTime != null && pickedTime != selectedTime)
//       setState(() {
//         selectedTime = pickedTime;
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book Appointment'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             ElevatedButton.icon(
//               onPressed: () => _selectDate(context),
//               icon: Icon(Icons.calendar_today),
//               label: Text('Select Date'),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Selected Date: ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: () => _selectTime(context),
//               icon: Icon(Icons.access_time),
//               label: Text('Select Time'),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Implement logic to book the appointment
//                 // You can use selectedDate and selectedTime variables to proceed
//                 // e.g., send data to backend, display confirmation message, etc.
//               },
//               icon: Icon(Icons.book),
//               label: Text('Book Appointment'),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class BookAppointmentScreen extends StatefulWidget {
//   @override
//   _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
// }
//
// class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null && pickedDate != selectedDate)
//       setState(() {
//         selectedDate = pickedDate;
//       });
//   }
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (pickedTime != null && pickedTime != selectedTime)
//       setState(() {
//         selectedTime = pickedTime;
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book Appointment'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: Text('Select Date'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Selected Date: ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _selectTime(context),
//               child: Text('Select Time'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement logic to book the appointment
//                 // You can use selectedDate and selectedTime variables to proceed
//                 // e.g., send data to backend, display confirmation message, etc.
//               },
//               child: Text('Book Appointment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
