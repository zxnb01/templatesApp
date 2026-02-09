# Video Template Marketplace

A production-quality Flutter mobile app for browsing and uploading video editing templates. Built with clean architecture principles and a minimalist, startup-grade UI.

## Features

### Template Gallery
- **2-Column Grid Layout** - Responsive marketplace-style display
- **Template Cards** - Preview image, name, category badge, and description
- **Network Images** - Smart loading with progress indicators and error fallbacks
- **Empty State** - Clean first-time user experience

### Upload Templates
- **Form Validation** - Real-time validation for all fields
- **Category Selection** - Dropdown for Reel, Ad, or Intro templates
- **URL Validation** - Ensures valid preview image/video URLs
- **Character Limits** - 120-character max for descriptions

## Architecture

Built using **feature-based clean architecture**:

```
lib/
├── main.dart                           # App entry point
├── theme.dart                          # Material 3 theme configuration
└── features/
    └── templates/
        ├── models/
        │   └── template_model.dart     # Domain model & enums
        ├── state/
        │   └── template_repository.dart # Singleton state management
        ├── screens/
        │   ├── template_list_page.dart  # Gallery view
        │   └── upload_template_page.dart # Upload form
        └── widgets/
            ├── template_card.dart       # Reusable card component
            └── empty_state.dart         # Empty state UI
```

**Key Principles:**
- No business logic in widgets
- In-memory state management (no external dependencies)
- Clear separation of concerns
- Production-ready error handling

## Tech Stack

- **Flutter** - Cross-platform mobile framework
- **Material 3** - Modern design system
- **Dart** - Programming language

**No external dependencies:**
- No Firebase
- No backend
- No state management libraries
- No database

## Getting Started

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK
- Android Studio / Xcode (for emulators)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd templatesapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Usage

### Uploading Templates

1. Tap the **"Upload"** floating action button
2. Fill in the template details:
   - **Name** - Template title
   - **Category** - Select from Reel, Ad, or Intro
   - **Preview URL** - Link to preview image/video
   - **Description** - Brief overview (max 120 chars)
3. Tap **"Upload Template"**

### Preview URL Examples

Use these free image sources for testing:

**Free Image Sources:**
- [Unsplash](https://unsplash.com) - High-quality photos
- [Pexels](https://pexels.com) - Free stock photos & videos
- [Pixabay](https://pixabay.com) - Royalty-free images

## Design System

The app uses a custom minimalist theme with:
- **Color Palette:** Muted charcoal/green primary, soft off-white background
- **Typography:** Clean, readable text hierarchy
- **Spacing:** Generous 16-20px spacing throughout
- **Components:** Rounded cards (14px), minimal elevation
- **Material 3:** Latest design guidelines

## State Management

Simple singleton pattern for in-memory state:
```dart
final repository = TemplateRepository();
repository.add(template);
final templates = repository.getAll();
```

**Why in-memory only?**
- MVP scope - focus on UI/UX
- No backend dependency
- Fast iteration
- Easy to migrate to persistent storage later

## Project Status

**Complete MVP Features:**
- Template list with 2-column grid
- Upload form with validation
- Category filtering UI
- Network image handling
- Empty states
- Material 3 theming

## Future Enhancements

Potential future features:
- Template search & filtering
- Favorite templates
- Template details page
- Video preview playback
- Persistent storage (SQLite/Hive)
- Backend integration
- User authentication
- Share templates

