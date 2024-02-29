import 'package:flutter/material.dart';
import 'package:shequal/design/main/consultation/consultant_list.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime today;
  late DateTime selectedDate;
  late String selectedTime;
  int currentPageIndex = 0;
  bool isFutureReady = false;

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    selectedDate = today;
    selectedTime = "08:00";
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        isFutureReady = true;
      });
    });
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
    });
  }

  void updateTime(String? newTime) {
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }

  void _handleNextButton() {
    setState(() {
      currentPageIndex++;
    });
  }

  void _handleFinishButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ConsultantList();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: kBlackColor),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Konsultasi",
                    style: blackTextStyle.copyWith(fontSize: 24, fontWeight: medium),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: isFutureReady
                  ? IndexedStack(
                      index: currentPageIndex,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Pilih Tanggal",
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
                              selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                              focusedDay: selectedDate,
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              onDaySelected: _onDaySelected,
                              calendarStyle: CalendarStyle(
                                todayTextStyle: TextStyle(
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Pilih Waktu",
                              style: blackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                            ),
                            TimeDropdown(
                              value: selectedTime,
                              onChanged: updateTime,
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            const Spacer(),
            CustomButton(
                onPressed: () {
                  if (currentPageIndex == 0) {
                    _handleNextButton();
                  } else {
                    _handleFinishButton();
                  }
                },
                color: kPrimaryColor,
                text: (currentPageIndex == 1) ? "Finish" : "Lanjut",
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

class TimeDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const TimeDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        items: [
          DropdownMenuItem(
            child: Text("08:00"),
            value: "08:00",
          ),
          DropdownMenuItem(
            child: Text("09:00"),
            value: "09:00",
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}