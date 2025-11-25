# UI with GetX - Flutter Profile App

A Flutter application built with GetX state management, featuring a modern profile UI.

## Project Overview

This project implements a complete profile management system with two main screens:
- **Profile Screen**: Displays user profile information, stats, connections, and achievements
- **Edit Profile Screen**: Allows users to edit their profile information and update profile picture

## Completed Features

### 1. Profile Screen (`profile_screen.dart`)
- ✅ **Immersive UI**: Status bar hidden using `SystemUiMode.immersiveSticky` for full-screen experience
- ✅ **Custom Header**: Background image with gradient overlay, no black space at top
- ✅ **Profile Picture**: Circular profile image with border styling
- ✅ **Custom Icons**: Replaced default icons with SVG assets (question mark, ticket, settings, person icons)
- ✅ **Typography**: Applied custom fonts:
  - **Lato**: For tickets and general text
  - **Eudoxus Sans** (Medium): For username, followers/following counts, and XP text
  - **Baron Neue** (Regular): For level text
- ✅ **Custom Progress Bar**: White fill with dark grey background, displaying '>' characters in empty space with rounded ends
- ✅ **User Stats**: Displays followers, following, XP progress, and level
- ✅ **Connections Card**: Shows connection avatars with asset images (dp1-dp5.jpg)
- ✅ **Purchases Card**: Displays purchase information
- ✅ **Urban Apex Cards**: Dynamic list of achievement cards with:
  - Custom image (urban.png)
  - Fire SVG icon with red color
  - Title, difficulty, date, and duration
- ✅ **Floating Action Button**: Custom circular FAB with drop shadow
- ✅ **Bottom Navigation Bar**: Custom styled with:
  - Dark background color (#1D1F24)
  - Custom icons (bar chart, store, location with selected state)
  - Home indicator line

### 2. Edit Profile Screen (`edit_profile_screen.dart`)
- ✅ **Header Section**: Background image (carImage.jpg) with rounded bottom corners and gradient overlay
- ✅ **Navigation**: Back arrow and close icon for navigation
- ✅ **Profile Picture Upload**: 
  - Tappable profile image for selecting new pictures
  - Upload icon indicator (arrow upward)
  - Image picker integration with gallery access
  - Dynamic display of selected images (File) or default assets
- ✅ **Editable Fields**:
  - Full Name field with mail icon and chevron
  - Bio field with mail icon and chevron
  - Proper alignment and styling
- ✅ **Update Button**: Fixed at bottom of screen with white background
- ✅ **Reactive Updates**: Changes reflect immediately in profile screen using GetX observables

### 3. State Management (`profile_controller.dart`)
- ✅ **Reactive Variables**: Using `RxString` for userName, username, status, instagramHandle, fullName, bio, and profileImagePath
- ✅ **Profile Update Method**: Updates profile data and extracts status/Instagram handle from bio
- ✅ **Image Update Method**: Handles profile image path updates
- ✅ **Data Management**: Simplified Urban Apex list generation

### 4. Custom Widgets
- ✅ **CustomProgressBar**: Custom progress indicator with:
  - White fill for completed portion
  - Dark grey background with '>' character pattern in empty space
  - Rounded ends
  - No blue colors
- ✅ **ProfileInfoCard**: Reusable card widget for displaying profile information
- ✅ **UrbanApexCard**: Card widget for achievement display with SVG icons

### 5. Platform Configuration
- ✅ **Android Permissions**: Added storage and camera permissions in `AndroidManifest.xml`
  - `READ_EXTERNAL_STORAGE` (for Android ≤12)
  - `READ_MEDIA_IMAGES` (for Android 13+)
  - `CAMERA` permission
- ✅ **iOS Permissions**: Added photo library and camera usage descriptions in `Info.plist`
- ✅ **Android NDK**: Configured NDK version 27.0.12077973 in `build.gradle.kts`

### 6. Dependencies
- ✅ **GetX**: State management and navigation
- ✅ **flutter_screenutil**: Responsive UI design
- ✅ **flutter_svg**: SVG asset rendering
- ✅ **google_fonts**: Font integration (for Lato)
- ✅ **image_picker**: Image selection from gallery

### 7. Assets
- ✅ **Images**: Profile pictures (dp.jpg, dp1-dp6.jpg), car image, urban achievement image
- ✅ **SVGs**: Custom icons (qmark, ticket, setting, person1, person2, fire)
- ✅ **Fonts**: Lato, Eudoxus Sans, Baron Neue (configured in pubspec.yaml)

## Technical Highlights

- **GetX Reactive Programming**: Used `.obs` for observable variables and `Obx()` for reactive UI updates
- **Custom Paint**: Implemented custom progress bar with text patterns
- **Image Handling**: Dynamic switching between `Image.asset` and `Image.file` based on image source
- **Responsive Design**: Used `ScreenUtil` for consistent sizing across devices
- **Clean Architecture**: Separated concerns with controllers, views, and widgets

## Getting Started

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── controllers/
│   └── profile_controller.dart    # State management
├── views/
│   ├── profile_screen.dart        # Main profile screen
│   └── edit_profile_screen.dart   # Edit profile screen
├── widgets/
│   ├── custom_progress_bar.dart    # Custom progress indicator
│   ├── profile_info_card.dart      # Reusable info card
│   └── urban_apex_card.dart        # Achievement card
├── routes/
│   ├── app_routes.dart             # Route definitions
│   └── app_pages.dart              # Page configurations
├── utils/
│   └── app_constants.dart           # App constants
└── main.dart                        # App entry point
```

## Notes

- Ensure all asset images and SVGs are present in the `assets/` folder
- Custom fonts (Eudoxus Sans, Baron Neue) must be added to the `fonts/` folder
- Image picker requires proper permissions on both Android and iOS
- The app uses immersive mode, hiding the status bar for a full-screen experience
