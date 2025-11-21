# جنازتي (Janazty) - Islamic Funeral Prayer App

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-3.35+-02569B.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

## 📖 Overview

**Janazty** is a production-ready Islamic funeral notification app built with Flutter. It helps Muslims find funeral prayers happening today and tomorrow, access funeral services, and learn proper funeral prayer methods.

This app is designed as **Sadaqah Jariyah** (ongoing charity) to help millions of Muslims participate in funeral prayers and gain reward.

## ✨ Features

### 🕌 Funeral Wall
- Display funerals happening today and tomorrow only
- Beautiful card design with mosque verification badges
- Real-time "I prayed" counter
- Share funerals via WhatsApp & Telegram
- Report duplicate functionality
- Auto-delete funerals older than 7 days (Cloud Function)

### ➕ Add Funeral
- Simple form with optional fields
- Google Maps location picker
- Photo upload support
- Default time: "بعد العصر اليوم"
- Anonymous or verified mosque publisher

### 🏢 Services Directory
- Categories: مغسلين موتى, عربيات نقل, مقابر صدقة, أكفان صدقة
- Filter by service type
- Suggest new services (admin approval required)
- Call and share service information

### 📚 Prayer Guide & Education
- Funeral prayer method for all 4 madhabs
- Authentic duas from Quran & Sunnah
- Audio playback support
- Morning & evening adhkar

## 🏗️ Architecture

This app follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/
│   ├── constants/          # App colors, strings, theme
│   ├── di/                 # Dependency injection (GetIt)
│   └── navigation/         # App navigation structure
├── features/
│   └── funeral/
│       ├── domain/         # Entities & repository interfaces
│       ├── data/           # Repository implementations & data sources
│       └── presentation/   # Screens, widgets, providers (Riverpod)
├── services/               # Firebase, Storage, Audio, Share services
└── main.dart
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.35+
- **State Management**: Riverpod 3.0
- **Data Classes**: Freezed + json_serializable
- **Backend**: Firebase (Firestore, Storage, FCM, Crashlytics, Remote Config)
- **Maps**: Google Maps Flutter
- **Audio**: just_audio
- **Fonts**: Cairo (Google Fonts)
- **DI**: GetIt

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.35 or higher
- Dart SDK 3.9.2 or higher
- Firebase project set up
- Google Maps API key

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/janazty.git
   cd janazty
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add Android and iOS apps
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories
   - Run `flutterfire configure` to generate `firebase_options.dart`

5. **Set up Firestore Collections**
   
   Create the following collections in Firestore:
   
   - **funerals**: Stores funeral announcements
   - **services**: Approved funeral services
   - **pending_services**: Services awaiting admin approval
   - **prayer_guide**: Educational content with audio
   - **reports**: Duplicate funeral reports

6. **Configure Google Maps**
   
   Add your Google Maps API key:
   
   **Android** (`android/app/src/main/AndroidManifest.xml`):
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE"/>
   ```
   
   **iOS** (`ios/Runner/AppDelegate.swift`):
   ```swift
   GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
   ```

7. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Firestore Structure

### Funerals Collection
```json
{
  "id": "auto-generated",
  "deceasedName": "string",
  "gender": "male|female",
  "mosqueName": "string",
  "mosqueLocation": "string",
  "lat": "number",
  "lng": "number",
  "prayerTime": "timestamp",
  "publisherId": "string",
  "isMosqueVerified": "boolean",
  "createdAt": "timestamp",
  "prayedCount": "number",
  "fatherName": "string?",
  "burialLocation": "string?",
  "notes": "string?",
  "photoUrl": "string?",
  "hidden": "boolean?"
}
```

### Services Collection
```json
{
  "id": "auto-generated",
  "type": "washer|transport|shroud|cemetery",
  "title": "string",
  "contactPhone": "string",
  "governorate": "string",
  "area": "string",
  "details": "string?",
  "isFree": "boolean",
  "status": "approved|pending",
  "createdAt": "timestamp",
  "approvedBy": "string?",
  "approvedAt": "timestamp?"
}
```

### Prayer Guide Collection
```json
{
  "id": "auto-generated",
  "title": "string",
  "textContent": "string",
  "order": "number",
  "category": "string",
  "audioUrl": "string?"
}
```

## 🎨 Design System

### Colors
- **Primary**: `#0F1A2B` (Deep calm navy)
- **Accent**: `#D4AF37` (Matte gold)
- **Background**: `#FFFAFCFF`
- **Surface**: `#F8F9FA`

### Typography
- **Primary Font**: Cairo (Arabic)
- **Fallback**: Amiri (Quranic text)

## 🔧 Development

### Code Generation

When you modify Freezed entities, run:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Linting

Run static analysis:
```bash
flutter analyze
```

### Testing

Run tests:
```bash
flutter test
```

## 📦 Build for Production

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

This is a Sadaqah Jariyah project. Contributions are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- All contributors who help make this app better
- The Muslim community for feedback and support
- Allah (SWT) for giving us the ability to create beneficial tools

## 📧 Contact

- **Email**: info@janazty.app
- **Website**: www.janazty.app

---

**May Allah accept this work as Sadaqah Jariyah and benefit the Muslim Ummah. Ameen.**

اللهم اغفر لنا ولوالدينا ولجميع المسلمين والمسلمات الأحياء منهم والأموات
