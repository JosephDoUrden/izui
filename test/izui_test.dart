import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:izui/izui.dart';

void main() {
  group('IzUI Package Tests', () {
    testWidgets('FuturisticButton renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: IzTheme.darkTheme(),
          home: Scaffold(
            body: FuturisticButton(
              onPressed: () {},
              child: const Text('Test Button'),
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(FuturisticButton), findsOneWidget);
    });

    testWidgets('GlassCard renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: IzTheme.darkTheme(),
          home: const Scaffold(
            body: GlassCard(
              child: Text('Glass Content'),
            ),
          ),
        ),
      );

      expect(find.text('Glass Content'), findsOneWidget);
      expect(find.byType(GlassCard), findsOneWidget);
    });

    testWidgets('NeuraTextField renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: IzTheme.darkTheme(),
          home: const Scaffold(
            body: NeuraTextField(
              decoration: InputDecoration(
                labelText: 'Test Field',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(NeuraTextField), findsOneWidget);
      expect(find.text('Test Field'), findsOneWidget);
    });

    test('IzColorSchemes provides neon colors', () {
      expect(IzColorSchemes.neonBlue, const Color(0xFF00E5FF));
      expect(IzColorSchemes.neonPink, const Color(0xFFFF0080));
      expect(IzColorSchemes.neonGreen, const Color(0xFF39FF14));
      expect(IzColorSchemes.neonPurple, const Color(0xFFBC13FE));
      expect(IzColorSchemes.neonOrange, const Color(0xFFFF6600));
      expect(IzColorSchemes.neonYellow, const Color(0xFFFFFF00));
      expect(IzColorSchemes.neonCyan, const Color(0xFF00FFFF));
    });

    test('IzDimensions provides consistent values', () {
      expect(IzDimensions.spacingMd, 16.0);
      expect(IzDimensions.spacingLg, 24.0);
      expect(IzDimensions.radiusLg, 12.0);
      expect(IzDimensions.buttonHeightMd, 40.0);
    });

    test('IzColorSchemes getNeonColor returns correct colors', () {
      expect(IzColorSchemes.getNeonColor(0), IzColorSchemes.neonBlue);
      expect(IzColorSchemes.getNeonColor(1), IzColorSchemes.neonPink);
      expect(IzColorSchemes.getNeonColor(7), IzColorSchemes.neonBlue); // Wraps around
    });

    test('IzTheme creates valid theme data', () {
      final theme = IzTheme.darkTheme();
      expect(theme.useMaterial3, true);
      expect(theme.colorScheme.brightness, Brightness.dark);
      expect(theme.colorScheme.primary, IzColorSchemes.neonBlue);
    });

    test('IzResponsive breakpoint enum values', () {
      expect(Breakpoint.xs.minWidth, 0);
      expect(Breakpoint.sm.minWidth, 576);
      expect(Breakpoint.md.minWidth, 768);
      expect(Breakpoint.lg.minWidth, 992);
      expect(Breakpoint.xl.minWidth, 1200);
      expect(Breakpoint.xxl.minWidth, 1400);
    });
  });
}
