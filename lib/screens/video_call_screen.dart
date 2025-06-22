import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone_tutorial/resources/auth_methods.dart';
import 'package:zoom_clone_tutorial/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone_tutorial/utils/colors.dart';
import 'package:zoom_clone_tutorial/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIDController;
  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  @override
  void initState() {
    meetingIDController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    meetingIDController.dispose();
    nameController.dispose();
  }

  _joinMeeting() {
    //yahan hun khana khane jaa raha
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIDController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      userName: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: const Text('join a meeting', style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIDController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackGroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackGroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Join', style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(height: 20),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: 'Turn Off my video',
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          ),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
