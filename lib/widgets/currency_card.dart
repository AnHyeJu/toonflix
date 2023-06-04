import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final IconData icon;
  final String name, code, amount;
  final bool isInverted;
  late final Color bgColor;
  late final Color textColor;
  final int order;

  final Color _black = const Color(0xFF1F2123);
  final double _offsetY = -30;

  CurrencyCard({
    super.key,
    required this.icon,
    required this.name,
    required this.code,
    required this.amount,
    required this.order,
    this.isInverted = false,
  }) {
    bgColor = isInverted ? Colors.white : _black;
    textColor = isInverted ? _black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (order - 1) * _offsetY),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: textColor.withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(-5, 13),
                  child: Icon(
                    icon,
                    color: textColor,
                    size: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
