

import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.clrOne, required this.clrTwo, required this.taskName});
  final String taskName;
  final Color clrOne;
  final Color clrTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: clrOne,
      ),
      child: Stack(
        children: [
          // Background circles
          Positioned(
            top: 20,
            right: 20,
            child: _buildCircularShape(80,clrOne, clrTwo,10),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: _buildCircularShape(30, clrOne,clrTwo,6),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: _buildCircularShape(100,clrOne, clrTwo,15),
          ),
          Positioned(
            top: 100,
            left: 150,
            child: _buildCircularShape(20,clrOne, clrTwo,3),
          ),



          Positioned(
            bottom: 20,
            left: 80,
            child: _buildCircularShape(40, Colors.white, clrOne,2),
          ),
          Positioned(
            bottom: 20,
            left: 60,
            child: _buildCircularShape(40, Colors.white, clrOne,2),
          ),
          Positioned(
            bottom: 20,
            left: 40,
            child: _buildCircularShape(40, Colors.white, clrOne,2),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: _buildCircularShape(40,Colors.white, clrOne,2),
          ),


          // Main content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Design Meeting",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy',
                      ),
                    ),
                    Text(
                      "09:30",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Description
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                  ),
                ),
                SizedBox(height: 32),

                // Circular shapes

              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build circular shapes
  Widget _buildCircularShape(double size, Color clrOne,Color clrTwo,double width) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: clrTwo,width: width),
        color: clrOne,
      ),
    );
  }

}
