import 'package:flutter/material.dart';

class HoverBox extends StatefulWidget {
  const HoverBox({
    required this.onTap,
    required this.child,
    this.borderRadius = BorderRadius.zero,
  });

  final VoidCallback onTap;
  final Widget child;
  final BorderRadius borderRadius;

  @override
  State<HoverBox> createState() => _HoverBoxState();
}

class _HoverBoxState extends State<HoverBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() {
        _isHovered = value;
      }),
      customBorder: RoundedRectangleBorder(
        borderRadius: widget.borderRadius,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: widget.borderRadius,
          boxShadow: [
            BoxShadow(
              offset: _isHovered ? const Offset(0, 0.5) : Offset.zero,
              color: _isHovered
                  ? Colors.black.withOpacity(0.45)
                  : Colors.black.withOpacity(0.3),
              blurRadius: 5,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
