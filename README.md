# 🌿 Sage Green Calculator

A beautiful, modern calculator app built with Flutter featuring a stunning sage green color scheme and glassmorphism design.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Features

### 🎨 Design
- **Sage Green Theme**: Calming, elegant color palette inspired by nature
- **Glassmorphism UI**: Modern frosted glass effect on display screen
- **Gradient Background**: Multi-layered sage green gradient
- **Premium Shadows**: 3D depth with colored glow effects
- **Smooth Animations**: Tap ripple effects and transitions
- **Responsive Layout**: Adapts to all screen sizes

### 🔢 Functionality
- **Basic Operations**: Addition (+), Subtraction (-), Multiplication (×), Division (÷)
- **Advanced Features**: 
  - Percentage calculations (%)
  - Decimal point support
  - Positive/negative toggle (+/-)
  - Backspace for corrections (⌫)
  - Clear function (C)
- **Smart Display**: 
  - Real-time equation display
  - Formatted results with auto-precision
  - Horizontal scrolling for long numbers
  - Glowing result text

### 🎯 Technical Highlights
- Clean, maintainable code
- State management with StatefulWidget
- Mathematical expression parser
- Error handling for invalid inputs
- No overflow issues - fully responsive
- Production-ready

## 📱 Screenshots

### Main Calculator Screen
- Beautiful sage green gradient background
- Glassmorphism display with glowing border
- Modern rounded button design
- 4x4 button grid layout

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/sage-green-calculator.git
   cd sage-green-calculator
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🎨 Color Palette

| Element | Color | Hex Code |
|---------|-------|----------|
| Background Gradient 1 | Deep Sage | `#2C3E2C` |
| Background Gradient 2 | Medium Sage | `#3D5A40` |
| Background Gradient 3 | Olive Sage | `#4A6741` |
| Background Gradient 4 | Light Sage | `#556B52` |
| Number Buttons | Dark Sage | `#4A5D4A` |
| Utility Buttons | Medium Sage | `#6B8E6B` |
| Operation Buttons | Light Sage | `#87A96B` |
| Result Display | Soft Sage | `#9CAF88` |

## 🏗️ Project Structure

```
lib/
├── main.dart          # Main app entry point and calculator logic
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  math_expressions: ^2.7.0  # Mathematical expression evaluation
  cupertino_icons: ^1.0.8
```

## 🔧 Key Components

### Calculator State
- `equation`: Current input equation
- `result`: Calculated result
- `expression`: Parsed mathematical expression

### Button Widget
- Gradient background
- Shadow effects with color glow
- Ripple animation on tap
- Customizable size and color

### Display Area
- Glassmorphism container
- Flexible height constraints
- Horizontal scrolling
- Glowing text effects

## 💡 Usage Examples

### Basic Calculation
```
5 + 3 × 2 = 11
```

### Decimal Operations
```
10.5 ÷ 2 = 5.25
```

### Percentage
```
100 × 25% = 25
```

### Negative Numbers
```
-10 + 5 = -5
```

## 🛠️ Customization

### Changing Colors
Edit the color values in `main.dart`:

```dart
// Background gradient
colors: [
  Color(0xFF2C3E2C),  // Your custom color
  Color(0xFF3D5A40),
  Color(0xFF4A6741),
  Color(0xFF556B52),
]

// Button colors
calculatorButton("7", Color(0xFF4A5D4A), Colors.white)
```

### Adjusting Button Size
Modify the button dimensions:

```dart
Container(
  width: 70,  // Change button width
  height: 70, // Change button height
)
```

## 🐛 Troubleshooting

### Overflow Issues
If you encounter overflow errors:
- The app uses `Expanded` and `SingleChildScrollView` to prevent overflow
- Display constraints are set between 140-160px height
- All content is scrollable if needed

### Build Errors
```bash
flutter clean
flutter pub get
flutter run
```

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

Built with ❤️ and Flutter

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## ⭐ Show Your Support

Give a ⭐️ if you like this project!

## 📝 Changelog

### Version 1.0.0
- ✅ Initial release
- ✅ Sage green theme
- ✅ Glassmorphism design
- ✅ Basic calculator operations
- ✅ Advanced features (+/-, %, ⌫)
- ✅ Responsive layout
- ✅ Error handling

## 🔮 Future Enhancements

- [ ] Scientific calculator mode
- [ ] History feature
- [ ] Theme switcher (multiple color schemes)
- [ ] Haptic feedback
- [ ] Sound effects
- [ ] Landscape mode support
- [ ] Memory functions (M+, M-, MR, MC)
- [ ] Unit conversions

## 📧 Contact

For questions or suggestions, please open an issue on GitHub.

---

Made with Flutter 💙 | Designed with Nature 🌿
