# Overview
**GoGreen** is an app that designed to promote sustainable living by providing a comprehensive platform for eco-conscious buying, selling, and recycling. By facilitating second-hand purchases, informed recycling, and community engagement, the app addresses the environmental impacts of overproduction and waste. Aligning with the United Nations Sustainable Development Goals (SDGs) 11, 12, and 13—particularly SDG 11, which focuses on creating sustainable cities and communities—GoGreen empowers users to make responsible consumption choices, reduce their carbon footprints, and contribute to a greener future.

### Features
1. **Second-Hand Marketplace:**
* Users can easily buy and sell second-hand items, allowing them to give new life to products that would otherwise contribute to waste. This feature not only facilitates transactions but also cultivates a community centered around sustainability.
2. **Carpooling Feature:**
* To further reduce carbon footprints, the app allows users to connect with others in their vicinity for carpooling, facilitating shared transportation and decreasing individual vehicle use.
3. **AI Material Identification Scanner:**
* GoGreen includes an AI-powered scanner that helps users identify the materials of various items, providing guidance on how to recycle them correctly. This feature promotes awareness and encourages proper disposal methods.
4.  **Recycling Education and Engagement:** 
* The app offers valuable information about recycling practices, empowering users with the knowledge needed to make environmentally responsible choices. Users can participate in quizzes to test their recycling knowledge, earning points that can be redeemed for second-hand items.
5. **Connection Platform:**
* The app fosters a supportive network where users connect, learn eco-tips, and engage in interactive quizzes to enhance their green habits and knowledge.
6. **Interactive Map of Recycling Centers:**
* The app features an interactive map that shows nearby recycling centers, making it easy for users to locate drop-off points for recyclable materials. Planned future enhancements include displaying recycling rates for each center and offering home pickup services for convenient item collection.

## Getting Started
Follow these instructions to set up the project on your local machine.

### Prerequisites
Ensure you have the following installed:
  * Flutter SDK  
  * Firebase CLI (for Firebase setup)

### Dependencies
This project uses the following dependencies:
* image_picker : https://pub.dev/packages/image_picker 
* http : https://pub.dev/packages/http   
* camera : https://pub.dev/packages/camera   
* path_provider : https://pub.dev/packages/path_provider   
* path : https://pub.dev/packages/path  
* google_generative_ai : https://pub.dev/packages/google_generative_ai  
* firebase_core: https://pub.dev/packages/firebase_core  
* cloud_firestore : https://pub.dev/packages/cloud_firestore  
* firebase_auth : https://pub.dev/packages/firebase_auth  
* firebase_storage : https://pub.dev/packages/firebase_storage  
* cupertino_icons : https://pub.dev/packages/cupertino_icons  
* google_fonts : https://pub.dev/packages/google_fonts  
* curved_navigation_bar : https://pub.dev/packages/curved_navigation_bar

#### Install Dependencies:
Run this command to install all dependencies:   
```
flutter pub get
```
### Firebase Setup
1. Create a Firebase project on the Firebase Console.
2. Add an Android and/or iOS app in your Firebase project, depending on your platform.
3. Download the **google-services.json (for Android)** and/or **GoogleService-Info.plist (for iOS)** and place them in the appropriate folders:
* android/app for google-services.json
* ios/Runner for GoogleService-Info.plist
4. Enable **Email/Password Authentication in the Authentication section** of your Firebase project.

### Project Setup
1. Clone the repository:
```
git clone https://github.com/yourusername/yourrepository.git
cd yourrepository
```
2. Open the project in your preferred IDE (e.g., VSCode, Android Studio).
3. Run the project on an emulator or connected device:
```
flutter run
```
