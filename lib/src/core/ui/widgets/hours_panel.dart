import 'package:flutter/material.dart';

import 'package:dw11_barbershop/src/core/ui/constants.dart';

class HoursPanel extends StatelessWidget {
  final List<int>? enabledTimes;
  final int startTime;
  final int endTime;
  final ValueChanged<int> hourPressed;

  const HoursPanel({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.hourPressed,
    this.enabledTimes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione os horários de atendimento',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            for (int i = startTime; i <= endTime; i++)
              TimeButton(
                enabledTimes: enabledTimes,
                label: '${i.toString().padLeft(2, '0')}:00',
                value: i,
                hourPressed: hourPressed,
              ),
          ],
        ),
      ],
    );
  }
}

class TimeButton extends StatefulWidget {
  final List<int>? enabledTimes;
  final String label;
  final int value;
  final ValueChanged<int> hourPressed;
  const TimeButton({
    super.key,
    required this.label,
    required this.value,
    required this.hourPressed,
    this.enabledTimes,
  });

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorsContants.grey;
    var buttonColor = selected ? ColorsContants.brow : Colors.white;
    final buttonBorderColor = selected ? ColorsContants.brow : Colors.grey;

    final TimeButton(:value, :label, :enabledTimes, :hourPressed) = widget;

    final disabledTime = enabledTimes != null && !enabledTimes.contains(value);

    if (disabledTime) {
      buttonColor = Colors.grey[400]!;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: disabledTime
          ? null
          : () {
              setState(() {
                selected = !selected;
                hourPressed(value);
              });
            },
      child: Container(
        width: 64,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          border: Border.all(
            color: buttonBorderColor,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
