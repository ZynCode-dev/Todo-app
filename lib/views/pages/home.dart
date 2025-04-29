
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remixicon/remixicon.dart';
import 'package:todo/views/widgets/MyBottomSheets.dart';
import 'package:todo/views/widgets/TaskCard.dart';



class Home extends StatefulWidget {


  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isAlertEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(RemixIcons.menu_4_fill, color: Colors.black),
          onPressed: () {},
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section de bienvenue
              Container(
                margin: EdgeInsets.only(left: 20,top: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 51,48,140),
                      child: Icon(CupertinoIcons.person_fill, color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hi, ",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Gilroy',
                              ),
                            ),
                            Text(
                              "Jasmine",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Gilroy',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // Titre "My tasks"
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "My tasks",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
              SizedBox(height: 8),
              // Tabs pour filtrer les tâches
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTab("Recently",Color.fromARGB(255, 121,102,228),true),
                    _buildTab("Today",Colors.grey,false),
                    _buildTab("Upcoming",Colors.grey,false),
                    _buildTab("Later",Colors.grey,false),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Cartes des tâches
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20,),
                    TaskCard(msg: "1 week left", taskName: 'User interface design', progress: 50, clrOne: Color(0xFF7966e4), clrTwo: Color(0xFF8d77e9)),
                    SizedBox(width: 10,),
                    TaskCard(msg: "2 week left", taskName: 'Wireframe elements', progress: 35, clrOne: Color(0xFF36338C), clrTwo: Color(0xFF3f3c9f)),
                    SizedBox(width: 10,),
                    TaskCard(msg: "3 week left", taskName: 'Make your design', progress: 85, clrOne: Color(0xFF242124), clrTwo: Color(0xFF003366)),
                    SizedBox(width: 20,),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Liste des tâches sous forme de cartes
              _buildTaskList(),
            ],
          ),

      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }

  // Méthode pour construire les tabs
  Widget _buildTab(String label,Color clr,bool isBold) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Text(
        label,
        style: TextStyle(
          color: clr,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy',
        ),
      ),
    );
  }

  // Méthode pour construire la liste des tâches
  Widget _buildTaskList() {
    return Column(
      children: [
        _buildTaskItem("Lorem Ipsum dolor", "17 August 2020"),
        SizedBox(height: 10),
        _buildTaskItem("Lorem Ipsum dolor", "28 July 2020"),
      ],
    );
  }

  // Méthode pour construire une tâche individuelle
  Widget _buildTaskItem(String title, String date) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(241,244,253, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Color.fromARGB(255, 51,48,140),
            child: Icon(FontAwesomeIcons.clipboardList, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Raleway',
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.ellipsisVertical, color: Color.fromARGB(255, 51,48,140)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}