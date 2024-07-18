import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FractionallySizedBox(
        heightFactor: fill,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
            gradient: LinearGradient(
              colors: [
                isDarkMode
                    ? Colors.amberAccent.withOpacity(.7)
                    : const Color.fromARGB(255, 0, 24, 244).withOpacity(.7),
                isDarkMode
                    ? Colors.amber.withOpacity(1)
                    : const Color.fromARGB(255, 0, 24, 244),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    ));
  }
}
