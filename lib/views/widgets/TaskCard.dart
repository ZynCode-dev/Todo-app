

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.msg,
    required this.taskName,
    required this.progress,
    required this.clrOne,
    required this.clrTwo,
    this.isPadding = false
  });
  final String msg;
  final String taskName;
  final int progress;
  final Color clrOne;
  final Color clrTwo;
  final bool isPadding;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        await Get.toNamed('/aboutTask',arguments: {
          'taskName': taskName,
          'clrOne':clrOne,
          'clrTwo':clrTwo,
        });
      },
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: clrOne,
        ),
        child: Stack(
          children: [
            // Circular shapes in the background
            Positioned(
              top: 30,
              right: 120,
              child: _buildCircularShape(80,clrOne, clrTwo,10),
            ),
            Positioned(
              top: 30,
              right: 40,
              child: _buildCircularShape(30,clrOne, clrTwo,4),
            ),
            Positioned(
              bottom: 40,
              left: 120,
              child: _buildCircularShape(60,clrOne, clrTwo,6),
            ),
            Positioned(
              bottom: 65,
              left: 45,
              child: _buildCircularShape(60, clrOne,clrTwo,9),
            ),
            Positioned(
              bottom: 25,
              left: 10,
              child: _buildCircularShape(40,clrOne, clrTwo,10),
            ),
            // Countdown badge
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white,
                      width: 0.5
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  msg,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
            ),
            // Main content
            Container(
              margin: EdgeInsets.only(top: 40,),
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                  SizedBox(height: 40),

                  // Progress section
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Progress",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Gilroy',
                            ),
                          ),
                          Text(
                            '$progress%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Gilroy',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),

                      // Progress bar
                      Container(
                        width: 110,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF5D48F9).withOpacity(0.2), // Light purple gradient
                              Color(0xFF7C5DF9).withOpacity(0.2), // Slightly lighter purple gradient
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: progress * 0.01, // Progress value (0 to 1)
                            minHeight: 8,
                            backgroundColor: Color.fromARGB(255, 156,143,235),
                            trackGap: 6,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // White progress bar
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularShape(double size,Color clrOne ,Color clrTwo,double width) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: clrTwo,
          width: width,
        ),
        shape: BoxShape.circle,
        color:clrOne,
      ),
    );
  }

}
