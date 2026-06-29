import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class InefLogo extends StatelessWidget {
  const InefLogo({super.key, this.size = 80, this.mono = false});

  final double size;
  final bool mono;

  @override
  Widget build(BuildContext context) {
    final asset = mono
        ? 'assets/branding/inef_isotipo_mono.svg'
        : 'assets/branding/inef_isotipo.svg';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(asset, width: size, height: size),
        const SizedBox(height: 8),
        Text(
          'INEF UCI',
          style: TextStyle(
            fontSize: size * 0.28,
            fontWeight: FontWeight.bold,
            color: mono ? Colors.white : InefColors.primaryDark,
            letterSpacing: 2.5,
          ),
        ),
      ],
    );
  }
}
