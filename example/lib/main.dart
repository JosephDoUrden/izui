import 'package:flutter/material.dart';
import 'package:izui/izui.dart';

void main() {
  runApp(const IzUIExampleApp());
}

class IzUIExampleApp extends StatelessWidget {
  const IzUIExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IzUI - Futuristic UI Library',
      theme: IzTheme.darkTheme(),
      home: const ComponentGalleryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ComponentGalleryScreen extends StatefulWidget {
  const ComponentGalleryScreen({super.key});

  @override
  State<ComponentGalleryScreen> createState() => _ComponentGalleryScreenState();
}

class _ComponentGalleryScreenState extends State<ComponentGalleryScreen> {
  int _selectedIndex = 0;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IzColorSchemes.darkBg,
      appBar: AppBar(
        title: const Text('IzUI Gallery'),
        backgroundColor: IzColorSchemes.darkSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildButtonsPage(),
          _buildInputsPage(),
          _buildCardsPage(),
          _buildLayoutPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: IzColorSchemes.darkSurface,
        selectedItemColor: IzColorSchemes.neonBlue,
        unselectedItemColor: IzColorSchemes.darkTextSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_button),
            label: 'Buttons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Inputs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Layout',
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsPage() {
    return SingleChildScrollView(
      padding: IzResponsive.responsivePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Futuristic Buttons',
            style: IzTypography.headlineMedium.copyWith(
              color: IzColorSchemes.darkText,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingXl),

          // Button Variants
          Text(
            'Button Variants',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonBlue,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          Wrap(
            spacing: IzDimensions.spacingMd,
            runSpacing: IzDimensions.spacingMd,
            children: [
              FuturisticButton(
                onPressed: () => _showSnackBar('Primary Button Pressed'),
                variant: FuturisticButtonVariant.primary,
                child: const Text('Primary'),
              ),
              FuturisticButton(
                onPressed: () => _showSnackBar('Secondary Button Pressed'),
                variant: FuturisticButtonVariant.secondary,
                child: const Text('Secondary'),
              ),
              FuturisticButton(
                onPressed: () => _showSnackBar('Success Button Pressed'),
                variant: FuturisticButtonVariant.success,
                child: const Text('Success'),
              ),
              FuturisticButton(
                onPressed: () => _showSnackBar('Warning Button Pressed'),
                variant: FuturisticButtonVariant.warning,
                child: const Text('Warning'),
              ),
              FuturisticButton(
                onPressed: () => _showSnackBar('Danger Button Pressed'),
                variant: FuturisticButtonVariant.danger,
                child: const Text('Danger'),
              ),
              FuturisticButton(
                onPressed: () => _showSnackBar('Outline Button Pressed'),
                variant: FuturisticButtonVariant.outline,
                child: const Text('Outline'),
              ),
              FuturisticButton(
                onPressed: () => _showSnackBar('Glass Button Pressed'),
                variant: FuturisticButtonVariant.glass,
                child: const Text('Glass'),
              ),
            ],
          ),

          const SizedBox(height: IzDimensions.spacing2xl),

          // Button Sizes
          Text(
            'Button Sizes',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonPurple,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          Column(
            children: [
              FuturisticButton(
                onPressed: () => _showSnackBar('Small Button'),
                size: FuturisticButtonSize.small,
                child: const Text('Small Button'),
              ),
              const SizedBox(height: IzDimensions.spacingMd),
              FuturisticButton(
                onPressed: () => _showSnackBar('Medium Button'),
                size: FuturisticButtonSize.medium,
                child: const Text('Medium Button'),
              ),
              const SizedBox(height: IzDimensions.spacingMd),
              FuturisticButton(
                onPressed: () => _showSnackBar('Large Button'),
                size: FuturisticButtonSize.large,
                child: const Text('Large Button'),
              ),
            ],
          ),

          const SizedBox(height: IzDimensions.spacing2xl),

          // Loading States
          Text(
            'Loading States',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonGreen,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          Row(
            children: [
              Expanded(
                child: FuturisticButton(
                  onPressed: () {},
                  isLoading: true,
                  child: const Text('Loading'),
                ),
              ),
              const SizedBox(width: IzDimensions.spacingMd),
              const Expanded(
                child: FuturisticButton(
                  onPressed: null,
                  enabled: false,
                  child: Text('Disabled'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputsPage() {
    return SingleChildScrollView(
      padding: IzResponsive.responsivePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Futuristic Inputs',
            style: IzTypography.headlineMedium.copyWith(
              color: IzColorSchemes.darkText,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingXl),

          // Text Fields
          Text(
            'NeuraTextField Variants',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonBlue,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          NeuraTextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Standard Field',
              hintText: 'Enter some text...',
            ),
          ),
          const SizedBox(height: IzDimensions.spacingLg),

          const NeuraTextField(
            decoration: InputDecoration(
              labelText: 'Password Field',
              hintText: 'Enter password...',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            glowColor: IzColorSchemes.neonPurple,
          ),
          const SizedBox(height: IzDimensions.spacingLg),

          const NeuraTextField(
            decoration: InputDecoration(
              labelText: 'Email Field',
              hintText: 'Enter email...',
              prefixIcon: Icon(Icons.email),
              suffixIcon: Icon(Icons.check_circle),
            ),
            keyboardType: TextInputType.emailAddress,
            glowColor: IzColorSchemes.neonGreen,
          ),
          const SizedBox(height: IzDimensions.spacingLg),

          const NeuraTextField(
            decoration: InputDecoration(
              labelText: 'Glass Morphism Field',
              hintText: 'Futuristic input...',
              prefixIcon: Icon(Icons.psychology),
            ),
            glassMorphism: true,
            scanLineAnimation: true,
            scanlineColor: IzColorSchemes.neonCyan,
          ),
          const SizedBox(height: IzDimensions.spacingLg),

          const NeuraTextField(
            decoration: InputDecoration(
              labelText: 'Multi-line Field',
              hintText: 'Enter your thoughts...',
              alignLabelWithHint: true,
            ),
            maxLines: 4,
            glowColor: IzColorSchemes.neonOrange,
          ),
        ],
      ),
    );
  }

  Widget _buildCardsPage() {
    return SingleChildScrollView(
      padding: IzResponsive.responsivePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Glass Cards',
            style: IzTypography.headlineMedium.copyWith(
              color: IzColorSchemes.darkText,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingXl),

          // Standard Glass Card
          Text(
            'Standard Glass Card',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonBlue,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          GlassCard(
            onTap: () => _showSnackBar('Glass Card Tapped'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Glass Morphism',
                  style: IzTypography.titleMedium.copyWith(
                    color: IzColorSchemes.darkText,
                  ),
                ),
                const SizedBox(height: IzDimensions.spacingSm),
                Text(
                  'This card features beautiful glassmorphism effects with backdrop blur and subtle transparency.',
                  style: IzTypography.bodyMedium.copyWith(
                    color: IzColorSchemes.darkTextSecondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: IzDimensions.spacingXl),

          // Neon Glass Cards
          Text(
            'Neon Glass Cards',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonPurple,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          Column(
            children: [
              NeonGlassCard(
                glowColor: IzColorSchemes.neonBlue,
                pulseAnimation: true,
                onTap: () => _showSnackBar('Blue Neon Card Tapped'),
                child: _buildCardContent('Pulsing Blue Glow', 'This card pulses with neon blue energy.'),
              ),
              const SizedBox(height: IzDimensions.spacingMd),
              NeonGlassCard(
                glowColor: IzColorSchemes.neonPink,
                glowIntensity: 1.5,
                onTap: () => _showSnackBar('Pink Neon Card Tapped'),
                child: _buildCardContent('Pink Intensity', 'High intensity pink glow effect.'),
              ),
              const SizedBox(height: IzDimensions.spacingMd),
              NeonGlassCard(
                glowColor: IzColorSchemes.neonGreen,
                onTap: () => _showSnackBar('Green Neon Card Tapped'),
                child: _buildCardContent('Steady Green', 'Calm and steady green illumination.'),
              ),
            ],
          ),

          const SizedBox(height: IzDimensions.spacingXl),

          // Liquid Glass Cards
          Text(
            'Liquid Glass Cards (Apple-Inspired)',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonCyan,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          Column(
            children: [
              LiquidGlassCard(
                surfaceTint: IzColorSchemes.neonBlue,
                liquidIntensity: 1.2,
                onTap: () => _showSnackBar('Liquid Blue Card Tapped'),
                child: _buildCardContent(
                  'Liquid Blue',
                  'Advanced liquid glass with flowing animations inspired by modern Apple design.',
                ),
              ),
              const SizedBox(height: IzDimensions.spacingMd),
              LiquidGlassCard(
                surfaceTint: IzColorSchemes.neonPink,
                liquidIntensity: 1.5,
                enableLiquidAnimation: true,
                enableHoverEffect: true,
                onTap: () => _showSnackBar('Liquid Pink Card Tapped'),
                child: _buildCardContent(
                  'High Intensity Liquid',
                  'Maximum fluidity with enhanced ripple effects and liquid animations.',
                ),
              ),
              const SizedBox(height: IzDimensions.spacingMd),
              LiquidGlassCard(
                surfaceTint: IzColorSchemes.neonGreen,
                liquidIntensity: 0.8,
                onTap: () => _showSnackBar('Subtle Liquid Card Tapped'),
                child: _buildCardContent(
                  'Subtle Liquid',
                  'Gentle liquid effects with refined transparency and depth.',
                ),
              ),
            ],
          ),

          const SizedBox(height: IzDimensions.spacingXl),

          // Grid of Cards
          Text(
            'Interactive Card Grid',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonGreen,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: IzResponsive.getColumnsCount(context),
              crossAxisSpacing: IzDimensions.spacingMd,
              mainAxisSpacing: IzDimensions.spacingMd,
              childAspectRatio: 1.2,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              final colors = [
                IzColorSchemes.neonBlue,
                IzColorSchemes.neonPurple,
                IzColorSchemes.neonGreen,
                IzColorSchemes.neonOrange,
                IzColorSchemes.neonPink,
                IzColorSchemes.neonCyan,
              ];

              return NeonGlassCard(
                glowColor: colors[index],
                glowIntensity: 0.8,
                onTap: () => _showSnackBar('Card ${index + 1} Tapped'),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: colors[index],
                        size: 32,
                      ),
                      const SizedBox(height: IzDimensions.spacingSm),
                      Text(
                        'Card ${index + 1}',
                        style: IzTypography.labelLarge.copyWith(
                          color: IzColorSchemes.darkText,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLayoutPage() {
    return SingleChildScrollView(
      padding: IzResponsive.responsivePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Responsive Layout',
            style: IzTypography.headlineMedium.copyWith(
              color: IzColorSchemes.darkText,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingXl),

          // Responsive Info
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Breakpoint',
                  style: IzTypography.titleMedium.copyWith(
                    color: IzColorSchemes.neonBlue,
                  ),
                ),
                const SizedBox(height: IzDimensions.spacingSm),
                Text(
                  'Breakpoint: ${IzResponsive.getBreakpoint(context).name}',
                  style: IzTypography.bodyLarge.copyWith(
                    color: IzColorSchemes.darkText,
                  ),
                ),
                Text(
                  'Is Mobile: ${IzResponsive.isMobile(context)}',
                  style: IzTypography.bodyMedium.copyWith(
                    color: IzColorSchemes.darkTextSecondary,
                  ),
                ),
                Text(
                  'Is Tablet: ${IzResponsive.isTablet(context)}',
                  style: IzTypography.bodyMedium.copyWith(
                    color: IzColorSchemes.darkTextSecondary,
                  ),
                ),
                Text(
                  'Is Desktop: ${IzResponsive.isDesktop(context)}',
                  style: IzTypography.bodyMedium.copyWith(
                    color: IzColorSchemes.darkTextSecondary,
                  ),
                ),
                Text(
                  'Columns: ${IzResponsive.getColumnsCount(context)}',
                  style: IzTypography.bodyMedium.copyWith(
                    color: IzColorSchemes.darkTextSecondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: IzDimensions.spacingXl),

          // Color Palette
          Text(
            'Neon Color Palette',
            style: IzTypography.titleLarge.copyWith(
              color: IzColorSchemes.neonPurple,
            ),
          ),
          const SizedBox(height: IzDimensions.spacingMd),

          Wrap(
            spacing: IzDimensions.spacingSm,
            runSpacing: IzDimensions.spacingSm,
            children: IzColorSchemes.neonPalette.map((color) {
              return Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(IzDimensions.radiusMd),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCardContent(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: IzTypography.titleMedium.copyWith(
            color: IzColorSchemes.darkText,
          ),
        ),
        const SizedBox(height: IzDimensions.spacingSm),
        Text(
          description,
          style: IzTypography.bodySmall.copyWith(
            color: IzColorSchemes.darkTextSecondary,
          ),
        ),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: IzColorSchemes.neonBlue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
        ),
      ),
    );
  }
}
