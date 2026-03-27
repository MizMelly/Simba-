import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final verticalPadding = screenWidth > 1100 ? 100.0 : 70.0;
    final horizontalPadding = screenWidth > 1100 ? 60.0 : 24.0;
    final headingFontSize =
        screenWidth > 1100 ? 44.0 : (screenWidth > 700 ? 36.0 : 28.0);
    final spacingAfterHeading = screenWidth > 1100 ? 90.0 : 60.0;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          const Text(
            'HOW IT WORKS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Color(0xFF68B2AD),
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'Simple as 1-2-3-4',
            style: TextStyle(
              fontSize: headingFontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C6975),
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: spacingAfterHeading),

          // ✅ Responsive Layout
          _buildResponsiveLayout(context),
        ],
      ),
    );
  }

  // ✅ RESPONSIVE WRAP LAYOUT
  Widget _buildResponsiveLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int columns;
    double spacing;

    if (screenWidth > 1100) {
      columns = 4;
      spacing = 40;
    } else if (screenWidth > 700) {
      columns = 2;
      spacing = 30;
    } else {
      columns = 1;
      spacing = 40;
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: spacing,
      runSpacing: spacing,
      children: List.generate(4, (index) {
        double cardWidth;

        if (columns == 4) {
          cardWidth = (screenWidth / 4) - 80;
        } else if (columns == 2) {
          cardWidth = (screenWidth / 2) - 60;
        } else {
          cardWidth = screenWidth * 0.85;
        }

        return SizedBox(
          width: cardWidth,
          child: _buildStep(
            stepNumber: index + 1,
            icon: _getIcon(index + 1),
            title: _getTitle(index + 1),
            description: _getDescription(index + 1),
          ),
        );
      }),
    );
  }

  // ✅ STEP CARD
  Widget _buildStep({
    required int stepNumber,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // Icon Circle
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F3F1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 42,
                    color: const Color(0xFF2C6975),
                  ),
                ),
              ),

              // Step Number
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C6975),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      stepNumber.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C6975),
            ),
          ),
          const SizedBox(height: 10),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF5A7C86),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  // ✅ ICONS
  IconData _getIcon(int step) {
    switch (step) {
      case 1:
        return Icons.person_add_outlined;
      case 2:
        return Icons.show_chart_outlined;
      case 3:
        return Icons.local_hospital;
      case 4:
        return Icons.card_membership_outlined;
      default:
        return Icons.help;
    }
  }

  // ✅ TITLES
  String _getTitle(int step) {
    switch (step) {
      case 1:
        return 'Create Pet Profile';
      case 2:
        return 'Track Health';
      case 3:
        return 'Chat / Book a Vet';
      case 4:
        return 'Subscribe to HMO';
      default:
        return '';
    }
  }

  // ✅ DESCRIPTIONS
  String _getDescription(int step) {
    switch (step) {
      case 1:
        return 'Add your pet\'s details and health history';
      case 2:
        return 'Log vaccinations, notes, and vet visits';
      case 3:
        return 'Get instant access to verified vets';
      case 4:
        return 'Choose an affordable monthly plan';
      default:
        return '';
    }
  }
}