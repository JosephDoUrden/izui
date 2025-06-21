<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# IzUI - Futuristic Flutter UI Library

[![Pub Version](https://img.shields.io/pub/v/izui)](https://pub.dev/packages/izui)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter Platform](https://img.shields.io/badge/platform-flutter-blue.svg)](https://flutter.dev)

A cutting-edge, futuristic UI library for Flutter that provides developers with modern, responsive, and highly customizable components inspired by sci-fi interfaces, glassmorphism, and next-generation design principles.

## ✨ Features

- 🌟 **Futuristic Design**: Sci-fi inspired components with neon glows and holographic effects
- 🌈 **Glassmorphism**: Beautiful frosted glass effects with backdrop blur
- 📱 **Responsive**: Adaptive layouts that work perfectly across all screen sizes
- 🎨 **Customizable**: Extensive theming and customization options
- ⚡ **Performance**: Optimized 60fps animations and efficient rendering
- ♿ **Accessible**: WCAG 2.1 AA compliant components
- 🌙 **Dark-First**: Optimized for dark themes with light theme support

## 📱 Screenshots

Get a visual preview of IzUI's futuristic components in action:

<div align="center">

### Button Gallery
<img src="images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-06-21%20at%2019.45.26.png" width="300" alt="IzUI Button Gallery - Various futuristic button variants with neon glow effects">

### Input Components  
<img src="images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-06-21%20at%2019.45.35.png" width="300" alt="IzUI Input Components - NeuraTextField with scanning animations and glow effects">

### Glass Cards
<img src="images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-06-21%20at%2019.45.40.png" width="300" alt="IzUI Glass Cards - Glassmorphism and liquid glass components with neon accents">

### Interactive Grid
<img src="images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-06-21%20at%2019.45.48.png" width="300" alt="IzUI Interactive Grid - Colorful neon glass cards in responsive grid layout">

### Responsive Layout
<img src="images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-06-21%20at%2019.45.53.png" width="300" alt="IzUI Responsive Layout - Color palette and responsive design showcase">

</div>

## 🚀 Quick Start

### Installation

Add IzUI to your `pubspec.yaml`:

```yaml
dependencies:
  izui: ^1.1.0
```

Run:

```bash
flutter pub get
```

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:izui/izui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IzUI Demo',
      theme: IzTheme.darkTheme(), // Apply IzUI dark theme
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Futuristic Button with neon glow
            FuturisticButton(
              onPressed: () => print('Button pressed!'),
              variant: FuturisticButtonVariant.primary,
              child: Text('Click Me'),
            ),
            
            SizedBox(height: 24),
            
            // Glass morphism card
            GlassCard(
              child: Text(
                'Beautiful glassmorphism effect!',
                style: IzTypography.titleMedium,
              ),
            ),
            
            SizedBox(height: 24),
            
            // Futuristic text field with scanning animation
            NeuraTextField(
              decoration: InputDecoration(
                labelText: 'Enter text',
                hintText: 'Type something...',
              ),
              scanLineAnimation: true,
              glowOnFocus: true,
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎯 Components

### FuturisticButton

A button component with neon glow effects, hover animations, and multiple variants.

```dart
FuturisticButton(
  onPressed: () {},
  variant: FuturisticButtonVariant.primary,
  size: FuturisticButtonSize.large,
  glowColor: IzColorSchemes.neonBlue,
  isLoading: false,
  child: Text('Futuristic Button'),
)
```

**Variants:**
- `primary` - Neon blue filled button
- `secondary` - Neon purple filled button  
- `success` - Neon green filled button
- `warning` - Neon orange filled button
- `danger` - Neon pink filled button
- `outline` - Transparent with neon border
- `glass` - Glassmorphism effect

**Sizes:**
- `small` - 32px height
- `medium` - 40px height (default)
- `large` - 48px height

### GlassCard

A glassmorphism container with backdrop blur effects.

```dart
GlassCard(
  blurIntensity: 10.0,
  opacity: 0.1,
  borderOpacity: 0.3,
  shadowIntensity: 1.0,
  onTap: () {},
  child: YourContent(),
)
```

### NeonGlassCard

Enhanced glass card with neon glow effects and optional pulse animation.

```dart
NeonGlassCard(
  glowColor: IzColorSchemes.neonPink,
  glowIntensity: 1.5,
  pulseAnimation: true,
  child: YourContent(),
)
```

### LiquidGlassCard ✨ NEW

Advanced liquid glass component with Apple-inspired fluid animations.

```dart
LiquidGlassCard(
  surfaceTint: IzColorSchemes.neonBlue,
  liquidIntensity: 1.2,
  enableLiquidAnimation: true,
  enableHoverEffect: true,
  onTap: () => print('Liquid glass tapped!'),
  child: YourContent(),
)
```

**Features:**
- Fluid flowing animations with wave effects
- Interactive ripple effects on tap
- Dynamic surface tinting
- Customizable liquid intensity (0.5x to 2.0x)
- Enhanced hover animations
- Apple-inspired design language

### NeuraTextField

Futuristic text field with scanning animations and enhanced styling.

```dart
NeuraTextField(
  decoration: InputDecoration(
    labelText: 'Username',
    hintText: 'Enter username',
  ),
  scanLineAnimation: true,
  glowOnFocus: true,
  glowColor: IzColorSchemes.neonGreen,
  glassMorphism: false,
)
```

## 🎨 Theming

### Using Built-in Themes

```dart
MaterialApp(
  theme: IzTheme.darkTheme(), // Dark theme (recommended)
  // or
  theme: IzTheme.lightTheme(), // Light theme
)
```

### Custom Theme

```dart
MaterialApp(
  theme: IzTheme.darkTheme(
    primaryColor: IzColorSchemes.neonPurple,
    fontFamily: 'YourCustomFont',
  ),
)
```

### Color Schemes

IzUI provides a comprehensive set of neon colors:

```dart
IzColorSchemes.neonBlue     // #00E5FF
IzColorSchemes.neonPink     // #FF0080  
IzColorSchemes.neonGreen    // #39FF14
IzColorSchemes.neonPurple   // #BC13FE
IzColorSchemes.neonOrange   // #FF6600
IzColorSchemes.neonYellow   // #FFFF00
IzColorSchemes.neonCyan     // #00FFFF
```

## 📱 Responsive Design

IzUI includes a powerful responsive system:

```dart
// Check screen size
bool isMobile = IzResponsive.isMobile(context);
bool isTablet = IzResponsive.isTablet(context);
bool isDesktop = IzResponsive.isDesktop(context);

// Get responsive values
double spacing = IzResponsive.responsive(
  context,
  xs: 8.0,
  sm: 16.0,
  md: 24.0,
  lg: 32.0,
  fallback: 16.0,
);

// Responsive widget builder
Widget responsiveWidget = IzResponsive.builder(
  context,
  xs: MobileWidget(),
  md: TabletWidget(),
  xl: DesktopWidget(),
  fallback: DefaultWidget(),
);
```

## 🎭 Animations

IzUI provides smooth, futuristic animations:

```dart
// Create glow animation
AnimationController controller = IzAnimations.createGlowController(this);
Animation<double> glowAnimation = IzAnimations.createGlowAnimation(controller);

// Create pulse animation  
Animation<double> pulseAnimation = IzAnimations.createPulseAnimation(controller);

// Slide fade transition
Widget animatedWidget = IzAnimations.slideFadeTransition(
  animation: animation,
  child: YourWidget(),
);
```

## 🛠️ Customization

### Glass Effects

```dart
BoxDecoration glassDecoration = IzTheme.glassDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white.withOpacity(0.1),
);
```

### Glow Effects

```dart
List<BoxShadow> glowShadow = IzTheme.glowShadow(
  IzColorSchemes.neonBlue,
  opacity: 0.8,
);
```

## 📋 Requirements

- Flutter >=3.10.0
- Dart >=3.0.0 <4.0.0

## 🌟 Examples

Check out the [example](./example) directory for a comprehensive showcase of all components and features.

Run the example:

```bash
cd example
flutter run
```

## 🤝 Contributing

We welcome contributions! Please read our [Contributing Guide](https://github.com/JosephDoUrden/izui/blob/main/CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/JosephDoUrden/izui/blob/main/LICENSE) file for details.

## 🙏 Acknowledgements

- Inspired by sci-fi interfaces and futuristic design concepts
- Built with ❤️ using Flutter
- Glassmorphism effects inspired by modern design trends

---

**Made with ⚡ by the IzUI Team**

For more information, visit our [documentation](https://github.com/JosephDoUrden/izui) or check out the [API reference](https://pub.dev/documentation/izui/latest/).
