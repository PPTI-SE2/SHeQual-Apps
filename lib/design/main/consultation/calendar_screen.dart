import 'package:flutter/material.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pilih tanggal konsultasi",
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  TableCalendar(
                    locale: "en_US",
                    rowHeight: 43,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: today,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    onDaySelected: _onDaySelected,
                    calendarStyle: CalendarStyle(
                      todayTextStyle: TextStyle(
                        color:
                            kWhiteColor, // Change the focused day text color here
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton( 
              onPressed: () {},
              color: kPrimaryColor,
              text: "Lanjut",
              textColor: kWhiteColor,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
            ),
          ],
        ),
      ),
    );
  }
}
