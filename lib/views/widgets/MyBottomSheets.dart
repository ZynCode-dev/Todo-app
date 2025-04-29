import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart'; // Assurez-vous d'avoir ce packaimport 'MyDatePicker.dart';

import 'MyButton.dart';
import 'MyDatePicker.dart';
import 'myInputFeild.dart';

class AppBottomBar extends StatefulWidget {


  const AppBottomBar({
    Key? key,

  }) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    var isAlertEnabled = false;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Remix.home_line, color: const Color.fromRGBO(121, 102, 228, 1)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Remix.calendar_todo_line, color: Color(0xFFcccccc)),
              onPressed: () {},
            ),
            FloatingActionButton(
              onPressed: () => TaskBottomSheet.show(context, isAlertEnabled,  (newVal) => setState(() => isAlertEnabled = newVal),),
              backgroundColor: const Color.fromRGBO(121, 102, 228, 1),
              child: const Icon(Remix.add_line, color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Remix.file_text_line, color: Color(0xFFcccccc)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Remix.user_line, color: Color(0xFFcccccc)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class TaskBottomSheet {
  static void show(
      BuildContext context,
      bool initialAlertState,
      ValueChanged<bool> onAlertToggle,
      ) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => _TaskBottomSheetContent(
        initialAlertState: initialAlertState,
        onAlertToggle: onAlertToggle,
      ),
    );
  }
}

class _TaskBottomSheetContent extends StatefulWidget {
  final bool initialAlertState;
  final ValueChanged<bool> onAlertToggle;

  const _TaskBottomSheetContent({
    required this.initialAlertState,
    required this.onAlertToggle,
  });

  @override
  __TaskBottomSheetContentState createState() => __TaskBottomSheetContentState();
}

class __TaskBottomSheetContentState extends State<_TaskBottomSheetContent> {
  late bool _isAlertEnabled;

  @override
  void initState() {
    super.initState();
    _isAlertEnabled = widget.initialAlertState;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, -10),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          const _TopHandle(),
          const SizedBox(height: 20),
          const Myinputfeild(labelText: 'Title', hint: 'Task Title'),
          const SizedBox(height: 10),
          Myinputfeild(
            labelText: 'Creation date',
            hint: DateFormat('dd MMMM yyyy').format(DateTime.now()),
          ),
          const SizedBox(height: 20),
          const MyDatePicker(),
          const SizedBox(height: 20),
          _AlertToggleRow(
            isEnabled: _isAlertEnabled,
            onChanged: (val) {
              setState(() => _isAlertEnabled = val);
              widget.onAlertToggle(val);
            },
          ),
          const SizedBox(height: 20),
          const MyButton(),
        ],
      ),
    );
  }
}

class _TopHandle extends StatelessWidget {
  const _TopHandle();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25),
          width: 70,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromRGBO(193, 195, 206, 1.0),
          ),
        ),
      ],
    );
  }
}

class _AlertToggleRow extends StatelessWidget {
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const _AlertToggleRow({
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Get alert for this task',
          style: TextStyle(
            color: const Color.fromARGB(255, 51, 48, 140),
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        FlutterSwitch(
          width: 60,
          height: 30,
          valueFontSize: 12,
          activeColor: const Color.fromARGB(255, 51, 48, 140),
          activeToggleColor: const Color(0xFF7966e4),
          activeText: 'ON',
          activeTextColor: Colors.white,
          inactiveColor: const Color(0xFF7966e4),
          inactiveToggleColor: const Color.fromARGB(255, 51, 48, 140),
          inactiveText: 'OFF',
          inactiveTextColor: Colors.white,
          toggleSize: 20.0,
          value: isEnabled,
          borderRadius: 30.0,
          showOnOff: true,
          onToggle: onChanged,
        ),
      ],
    );
  }
}