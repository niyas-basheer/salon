import 'package:flutter/material.dart';

class CustomToggleBar extends StatelessWidget {
  final bool isSpotbelt;
  final Function(bool) onToggle;

  const CustomToggleBar({
    Key? key,
    required this.isSpotbelt,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFFFAB40),
            width: 1.5,
          ),
        ),
        child: Stack(
          children: [
            // Animated background
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: isSpotbelt ? Alignment.centerLeft : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.43, 
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFAB40),
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
            // Toggle buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => onToggle(true),
                    child: Center(
                      child: Text(
                        'Spotbelt',
                        style: TextStyle(
                          color: isSpotbelt ? Colors.black : const Color(0xFFFFAB40),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => onToggle(false),
                    child: Center(
                      child: Text(
                        'Spotbelt At Home',
                        style: TextStyle(
                          color: !isSpotbelt ? Colors.black : const Color(0xFFFFAB40),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

