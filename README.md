
# Digital Health App

This Flutter app enables users to log check-ins with notes and view their personal check-in history. The app uses Firebase Authentication for login and Firestore for data storage, allowing each user to access their own data and providing efficient data loading with pagination.

## Getting Started

### Prerequisites

- **Flutter SDK** (v3.24.1)
- **Firebase Project** with Firestore and Firebase Authentication enabled.
- **Firebase configuration** for Flutter.

### Setup Instructions

- *Clone the Repository*:
   ```
   git clone https://github.com/irfanelahidev69/digital-health-app.git
   ```
- *Install Dependencies*:
   ```
   flutter pub get
   ```
- *Configure Firebase*:
   - Set up a Firebase project in the Firebase Console.
   - For Android:
      - Download the google-services.json file from your Firebase project.
      - Place it in the android/app/ directory.
   - For iOS:
      - Download the GoogleService-Info.plist file from your Firebase project.
      - Place it in the ios/Runner/ directory.
   - Enable Firebase Authentication (email/password or other providers) and Firestore in your Firebase Console.
- Run the App:
    ```
   flutter run
   ```
### Project Architecture
- *Feature-First Architecture*

  Feature-First Architecture focuses on organizing a Flutter app around features rather than technical layers (e.g., models, services, widgets). Each feature is self-contained, including its UI, logic, state management, and models. This approach enhances scalability, maintainability, and testability, as each feature operates independently. It also promotes better collaboration in teams, as developers can work on different features concurrently without overlapping concerns. Feature-First Architecture is particularly useful for larger apps where modularity and clear separation of concerns are important.

### Demo
[![Watch the demo](https://img.youtube.com/vi/NfVbN1cVV4k/3.jpg)](https://youtu.be/NfVbN1cVV4k)

  

