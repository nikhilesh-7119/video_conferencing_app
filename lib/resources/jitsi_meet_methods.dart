import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone_tutorial/resources/auth_methods.dart';
import 'package:zoom_clone_tutorial/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods=AuthMethods();
  final FirestoreMethods _firestoreMethods=FirestoreMethods();
  

  void createMeeting({required String roomName,required bool isAudioMuted,required bool isVideoMuted,String userName='',}) async {
    String name;
    if(userName.isEmpty){
      name=_authMethods.user.displayName!;
    }else {
      name=userName;
    }
    final meetingOptions = JitsiMeetingOptions(
      serverUrl: "https://meet.jit.si",
      roomNameOrUrl: roomName,
      userDisplayName: name,
      userEmail: _authMethods.user.email,
      userAvatarUrl: _authMethods.user.photoURL,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      featureFlags: {
        "lobby-mode.enabled": false,
        "prejoinpage.enabled": false,
    },
    );

    try {
      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeetWrapper.joinMeeting(options: meetingOptions);
    } catch (e) {
      print("Error joining meeting: $e");
    }
  }
}
