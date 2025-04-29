import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  int selectedIndex = 1;

  final List<DateTime> weekDates = List.generate(7, (index) {
    return DateTime.now().add(Duration(days: index));
  });

  @override
  Widget build(BuildContext context) {
    String currentMonth = DateFormat.MMMM().format(weekDates[0]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and Month
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Start date & time",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 51,48,140),
                fontFamily: 'Gilroy',
              ),
            ),
            Row(
              children: [
                Text(
                  currentMonth,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 51,48,140),
                    fontFamily: 'Gilroy',
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Color.fromARGB(255, 51,48,140)),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        // Day picker
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weekDates.length,
            itemBuilder: (context, index) {
              DateTime day = weekDates[index];
              bool isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 40,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: isSelected
                      ? BoxDecoration(
                    color: Color.fromARGB(255, 51,48,140),
                    borderRadius: BorderRadius.circular(30),
                  )
                      : null,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.E().format(day).toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected
                              ? Colors.white
                              : Color.fromRGBO(160, 169, 187, 1.0),

                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${day.day}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? Colors.white
                              : Color.fromARGB(255, 51,48,140),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
