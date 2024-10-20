// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:daisy/core/extension/context_extension.dart';
import 'package:daisy/core/extension/string_extension.dart';
import 'package:daisy/localization/locale_keys/locale_keys.g.dart';
import 'package:daisy/ui/widget/gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part '_picker/_date_picker.dart';
part '_picker/_picker_cupertino.dart';
part '_picker/_picker_image.dart';

class Picker extends StatelessWidget {
  const Picker._(this.picker);

  factory Picker.date(
          {required List<DateTime> availableDates,
          required ValueSetter<DateTime> onDateChanged}) =>
      Picker._(_DatePicker(
          availableDates: availableDates, onDateChanged: onDateChanged));

  factory Picker.time({required List<String> availableHours}) =>
      Picker._(_TimePicker(availableHours: availableHours));

  factory Picker.number(
          {required ValueSetter<int> onSelected, required int? initialItem}) =>
      Picker._(_PickerNumber(onSelected: onSelected, initialItem: initialItem));

  factory Picker.cupertino({
    required List<String>? items,
    List<String>? subItems,
    required int? initialIndex,
    required ValueSetter<dynamic> onSelectedItemChanged,
  }) =>
      Picker._(_PickerCupertino(
        items: items,
        subItems: subItems,
        initialIndex: initialIndex,
        onSelectedItemChanged: onSelectedItemChanged,
      ));

  factory Picker.cupertinoTime(
          {DateTime? initialDateTime,
          int? minuteInterval,
          required ValueSetter<DateTime> onTimeChanged}) =>
      Picker._(_PickerCupertinoTime(
          initialDateTime: initialDateTime,
          minuteInterval: minuteInterval,
          onTimeChanged: onTimeChanged));

  factory Picker.cupertinoDate(
          {required DateTime? initialDateTime,
          required ValueSetter<DateTime> onDateChanged}) =>
      Picker._(_PickerCupertinoDate(
          initialDateTime: initialDateTime, onDateChanged: onDateChanged));

  factory Picker.image({required ValueSetter<XFile?> onImagePicked}) =>
      Picker._(_PickerImage(onImagePicked: onImagePicked));

  final Widget picker;
  @override
  Widget build(BuildContext context) => picker;
}

class _DatePicker extends StatelessWidget {
  const _DatePicker(
      {required this.availableDates, required this.onDateChanged});

  final List<DateTime> availableDates;
  final ValueSetter<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: DateTime.now().toUtc(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
      onDateChanged: onDateChanged,
      initialCalendarMode: DatePickerMode.day,
      selectableDayPredicate: (date) {
        for (final availableDate in availableDates) {
          if (availableDate.year == date.year &&
              availableDate.month == date.month &&
              availableDate.day == date.day) {
            return true;
          }
        }
        return false;
      },
    );
  }
}

class _TimePicker extends StatefulWidget {
  const _TimePicker({
    required this.availableHours,
  });

  final List<String> availableHours;

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<_TimePicker> {
  late int middleIndex;
  late ValueNotifier<int> _selectedItem;
  late FixedExtentScrollController _scrollController;
  double itemExtent = 50;

  @override
  void initState() {
    super.initState();
    middleIndex = widget.availableHours.length ~/ 2;
    _selectedItem = ValueNotifier<int>(middleIndex);
    _scrollController = FixedExtentScrollController(initialItem: middleIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.4),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoPicker(
        scrollController: _scrollController,
        itemExtent: itemExtent,
        onSelectedItemChanged: (index) {
          _selectedItem.value = index;
        },
        looping: true,
        useMagnifier: true,
        magnification: 1.5,
        diameterRatio: 1000,
        squeeze: 1.2,
        children: List<Widget>.generate(
          widget.availableHours.length,
          (index) {
            return ValueListenableBuilder<int>(
              valueListenable: _selectedItem,
              builder: (context, value, child) {
                return Container(
                  height: itemExtent,
                  decoration: BoxDecoration(
                    border: const Border(
                      bottom: BorderSide(
                        width: 0.5,
                      ),
                    ),
                    color: value == index ? context.colorScheme.primary : null,
                  ),
                  child: Center(
                    child: Text(
                      widget.availableHours[index],
                      style: context.text.bodySmall?.copyWith(
                        color: value == index ? Colors.white : null,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _PickerNumber extends StatelessWidget {
  const _PickerNumber({required this.onSelected, required this.initialItem});

  final int? initialItem;
  final ValueSetter<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final scrollController =
        FixedExtentScrollController(initialItem: initialItem ?? 1);
    return SizedBox(
      height: context.dynamicHeight(.25),
      child: CupertinoPicker(
        scrollController: scrollController,
        itemExtent: 32.0,
        onSelectedItemChanged: onSelected,
        children: List.generate(20, (int index) {
          return Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(fontSize: 24),
            ),
          );
        }),
      ),
    );
  }
}
