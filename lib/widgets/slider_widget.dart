import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final double _value = 50;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
        thumbShape: SliderComponentShape.noThumb,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 1,
          right: 10,
          left: 10,
          bottom: 15,
        ),
        child: Slider(
          min: 0,
          max: 100,
          value: _value,
          secondaryTrackValue: 100,
          onChanged: (double value) {},
        ),
      ),
    );
  }
}
