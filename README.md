# VIDEO CONFERENCING APP 📽️  
Developed a modern and functional video conferencing application using Flutter, Dart, and GetX, with Firebase as the backend. This app facilitates seamless real-time communication via audio/video calls, secure authentication, and room-based conferencing, offering a clean and user-friendly interface for meetings.

# Key Features Implemented:
* 🔐 Firebase Authentication:
  * Integrates Google Sign-In for secure and hassle-free user login.
  * Uses Firebase Auth to manage user sessions efficiently.
  
* 🔗 Room-Based Conferencing:
  * Users can create or join a meeting using a unique room ID.
  * Ensures structured and organized video sessions.

* 📹 Group & One-to-One Video Calls:
  * Integrated with Jitsi Meet Wrapper for high-quality video conferencing.
  * Real-time video/audio interaction with simple meeting controls.

* 🧑‍🤝‍🧑 Participant Management:
  * Users can seamlessly join or leave sessions.
  * UI allows intuitive control over microphone, camera, and exit.

# Technologies Used:
* **Frontend**: Developed using Flutter and Dart, with GetX for state management and reactive programming.
* **Backend**: Powered by Firebase services for authentication and Firestore as the real-time database.
* **Video Conferencing**: Implemented using `jitsi_meet_wrapper` for embedded and customizable meeting UI.

# Screenshots

# Run on your device:
* 🔧 Prerequisites  
  * Before starting, make sure you have:
    * ✅ Flutter SDK installed and configured  
    * ✅ Git installed  
    * ✅ Android Studio or Visual Studio Code (with Flutter & Dart plugins)  
    * ✅ A connected Android device or emulator  

* 📥 Step 1: Clone the Repository  
  * Open a terminal and run:
    * `git clone https://github.com/nikhilesh-7119/video_conferencing_app.git`  
    * `cd Video-Conferencing-App`  

* 📦 Step 2: Install Dependencies  
  * Run the following command to install all required packages:
    * `flutter pub get`

* 🔐 Step 3: Set Up Firebase  
  * Go to Firebase Console  
  * Create a new project (or use an existing one)  
  * Add an Android app and download the `google-services.json` file  
  * Place the `google-services.json` file in `android/app/`  

* 🛠️ Step 4: Run the App  
  * Use the following command to launch the app:
    * `flutter run`

# 📃 License  
* This project is open-source and available under the MIT License.
