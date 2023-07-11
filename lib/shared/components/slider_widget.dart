import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  //TODO find how to set the color of the slider.
  final Color? progressColor;

  const SliderWidget({super.key, this.progressColor});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final double _value = 50;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
          thumbShape: SliderComponentShape.noThumb,
          overlayShape: SliderComponentShape.noOverlay,
          trackHeight: 5),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
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
