import 'package:flutter/material.dart';

class AppAnimatedToggle<T> extends StatelessWidget {
  static const _animated = Duration(milliseconds: 300);

  final List<T> values;
  final List<String> labels;
  final int selectedIndex;
  final void Function(T value) onTap;
  final double height;

  const AppAnimatedToggle({
    super.key,
    required this.values,
    required this.labels,
    required this.selectedIndex,
    required this.onTap,
    required this.height,
  }) : assert(values.length == labels.length);

  BorderRadius get borderRadius => BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: borderRadius,
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: _animated,
                  left: selectedIndex * constraint.maxWidth / values.length,
                  width: constraint.maxWidth / values.length,
                  height: height,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: borderRadius,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    children: [
                      ...labels.map(
                        (label) {
                          final idx = labels.indexOf(label);
                          return Expanded(
                            child: _ToggleButton(
                              onTap: () => onTap(values[idx]),
                              label: label,
                              borderRadius: borderRadius,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({
    required this.onTap,
    required this.label,
    required this.borderRadius,
  });

  final VoidCallback onTap;
  final String label;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: Text(label),
    );
  }
}
