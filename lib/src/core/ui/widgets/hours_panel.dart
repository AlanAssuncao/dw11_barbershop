import 'package:flutter/material.dart';

import 'package:dw11_barbershop/src/core/ui/constants.dart';

class HoursPanel extends StatefulWidget {
  final List<int>? enabledTimes;
  final int startTime;
  final int endTime;
  final ValueChanged<int> hourPressed;
  final bool singleSelection;

  const HoursPanel({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.hourPressed,
    this.enabledTimes,
  }) : singleSelection = false;

  const HoursPanel.singleSelection({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.hourPressed,
    this.enabledTimes,
  }) : singleSelection = true;

  @override
  State<HoursPanel> createState() => _HoursPanelState();
}

class _HoursPanelState extends State<HoursPanel> {
  int? lastSelection;

  @override
  Widget build(BuildContext context) {
    final HoursPanel(:singleSelection) = widget;
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
            for (int i = widget.startTime; i <= widget.endTime; i++)
              TimeButton(
                enabledTimes: widget.enabledTimes,
                label: '${i.toString().padLeft(2, '0')}:00',
                value: i,
                timeSelected: lastSelection,
                singleSelection: singleSelection,
                hourPressed: (timeSelected) {
                  setState(() {
                    if (singleSelection) {
                      if (lastSelection == timeSelected) {
                        lastSelection = null;
                      } else {
                        lastSelection = timeSelected;
                      }
                    }
                  });

                  widget.hourPressed(timeSelected);
                },
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
  final bool singleSelection;
  final int? timeSelected;

  const TimeButton({
    super.key,
    required this.label,
    required this.value,
    required this.hourPressed,
    this.enabledTimes,
    required this.singleSelection,
    this.timeSelected,
  });

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final TimeButton(
      :singleSelection,
      :timeSelected,
      :value,
      :label,
      :enabledTimes,
      :hourPressed,
    ) = widget;

    if (singleSelection) {
      if (timeSelected != null) {
        if (timeSelected == value) {
          selected = true;
        } else {
          selected = false;
        }
      }
    }

    final textColor = selected ? Colors.white : ColorsContants.grey;
    var buttonColor = selected ? ColorsContants.brow : Colors.white;
    final buttonBorderColor = selected ? ColorsContants.brow : Colors.grey;

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
