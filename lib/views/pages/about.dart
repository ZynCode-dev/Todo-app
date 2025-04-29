
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_timeline_plus/event_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import 'package:todo/views/widgets/EventCard.dart';

import 'package:flutter_timeline_plus/timeline.dart';
import 'package:todo/views/widgets/MyBottomSheets.dart';




class AboutTask extends StatefulWidget {
  AboutTask({super.key});

  @override
  State<AboutTask> createState() => _AboutTaskState();
}

class _AboutTaskState extends State<AboutTask> {
  bool _isAlertEnabled = true;

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final today = DateTime.now();
    final currentWeek = _getDaysInWeek(today);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(RemixIcons.arrow_left_line, color: Colors.black),
          onPressed: (){
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(RemixIcons.search_line, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(RemixIcons.equalizer_line, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Header
              Text(
                DateFormat('MMM, dd yyyy').format(DateTime.now()),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy',
                ),
              ),
              SizedBox(height: 16),
              // Calendar Week View
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                        .asMap() // Convertir en Map pour avoir l'index
                        .map((index, day) => MapEntry(
                      index,
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            day,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Gilroy',
                              color: _isCurrentWeekday(index, today.weekday)
                                  ? const Color.fromARGB(255, 121, 102, 228)
                                  : Colors.grey[600],
                              fontWeight: _isCurrentWeekday(index, today.weekday)
                                  ? FontWeight.bold
                                  : FontWeight.normal,

                            ),
                          ),
                        ),
                      ),
                    ))
                        .values
                        .toList(),
                  ),
                  const SizedBox(height: 10),

                  // Animated horizontal date list
                  SizedBox(
                    height: 60,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: currentWeek.length,
                        itemBuilder: (context, index) {
                          final date = currentWeek[index];
                          final isToday = _isSameDay(date, today);

                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              horizontalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 7),
                                  width: 40,

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        date.day.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Raleway',
                                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                                          color: isToday ? Color.fromARGB(255, 121,102,228) : Colors.black,
                                        ),
                                      ),
                                      if (isToday)
                                        Container(
                                          margin: const EdgeInsets.only(top: 4),
                                          height: 4,
                                          width: 4,
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(255, 121,102,228),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildeSection(190, EventCard(clrOne: args['clrOne'], clrTwo: args['clrTwo'], taskName: args['taskName'],),true,),
              SizedBox(height: 10,),
              _buildeSection(100,_buildTaskItem('Team Meeting','10:30') ,false),
              SizedBox(height: 10,),
              _buildeSection(100,_buildTaskItem('Client Update','11:00') ,false),
              SizedBox(height: 10,),
              _buildeSection(100,_buildTaskItem('Stackholder Interview','12:30') ,false),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }

  // Method to build a day in the calendar
  List<DateTime> _getDaysInWeek(DateTime date) {
    final firstDayOfWeek = date.subtract(Duration(days: date.weekday - 1));
    return List.generate(7, (index) => firstDayOfWeek.add(Duration(days: index)));
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isCurrentWeekday(int displayedIndex, int currentWeekday) {
    // Convertir l'index affiché (0=MON) en weekday (1=MON..7=SUN)
    final displayedWeekday = displayedIndex + 1;
    return displayedWeekday == currentWeekday;
  }

  Widget _buildTaskItem(String title, String time) {
    return Container(
      height: 110,
      width: 320,

      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(241,244,253, 1),
        //color: Colors.yellow,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy',
                ),
              ),
              Text("Lorem ipsum dolor sit amet",style: TextStyle(fontFamily: 'Gilroy'),),
              Text("consectetuet",style: TextStyle(fontFamily: 'Gilroy',),),
            ],
          ),
          Column(
            crossAxisAlignment:CrossAxisAlignment.end  ,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy',
                ),
              ),
              Icon(FontAwesomeIcons.ellipsis),
            ],
          ),
        ],
      ),
    );
  }

  // Method to build a single dot/circle
  Widget _buildeSection(double hight,Widget widget,bool isFirst) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFcccccc),
              ),
              child: isFirst
                ? Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    color: Color(0xFFcccccc),
                  ),
                ): null,

            ),
            SizedBox(height: 2,),
            Container(
              height: hight,
              width: 2,
              color: Color(0xFFcccccc),
            )
          ],
        ),
        SizedBox(width: 15,),
        widget,
      ],
    );
  }
}
