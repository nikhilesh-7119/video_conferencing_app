import 'package:flutter/material.dart';
import 'package:zoom_clone_tutorial/resources/auth_methods.dart';
import 'package:zoom_clone_tutorial/screens/history_meeting_screen.dart';
import 'package:zoom_clone_tutorial/screens/meetings_screen.dart';
import 'package:zoom_clone_tutorial/utils/colors.dart';
import 'package:zoom_clone_tutorial/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page=0;

  onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }

  List<Widget> pages=[
    MeetingsScreen(),
    HistoryMeetingScreen(),
    Text('Contacts'),
    CustomButton(text: 'Log Out', onPressed: ()=> AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Meet and Chat'),
        centerTitle: true,
        backgroundColor: backGroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 14,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label:'Meet & char',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label:'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label:'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label:'Settings',
          ),
        ],
      ),
    );
  }
}