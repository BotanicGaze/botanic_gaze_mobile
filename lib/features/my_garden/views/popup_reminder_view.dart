import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/my_garden/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PopupReminderType extends StatefulWidget {
  const PopupReminderType({
    required this.plantReminder,
    super.key,
  });
  final PlantReminder plantReminder;

  @override
  State<PopupReminderType> createState() => _PopupReminderTypeState();

  static Future<void> show(
    BuildContext context, {
    required PlantReminder plantReminder,
  }) async {
    await showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<MyPlantDetailBloc>(),
          child: PopupReminderType(
            plantReminder: plantReminder,
          ),
        );
      },
    );
  }
}

class _PopupReminderTypeState extends State<PopupReminderType> {
  late ReminderType reminderType;
  late TimeOfDay time;
  late RepeatType repeatType;
  late bool isAddNewReminder;

  @override
  void initState() {
    super.initState();
    isAddNewReminder = widget.plantReminder.id == null;
    reminderType = widget.plantReminder.reminderType ?? ReminderType.watering;
    repeatType = widget.plantReminder.repeat ?? RepeatType.day;
    time = TimeOfDay.fromDateTime(
      widget.plantReminder.time ?? DateTime(1, 1, 1, 7),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        Dimens.d16.responsive(),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text('Set reminder'),
        ),
        body: Column(
          children: [
            const Divider(),
            _reminderTypeSelected(),
            _repeatTypeSelected(),
            _timeSelected()
          ],
        ),
        bottomNavigationBar: AppSafeArea(
          minimum: EdgeInsets.all(
            Dimens.d16.responsive(),
          ),
          child: AppButton.fullSize(
            child:
                Text(isAddNewReminder ? 'Add new reminder' : 'Update reminder'),
            onPressed: () {
              final now = DateTime.now();
              context.read<MyPlantDetailBloc>().add(
                    AddReminder(
                      repeatType: repeatType,
                      reminderType: reminderType,
                      date: DateTime(
                        now.year,
                        now.month,
                        now.day,
                        time.hour,
                        time.minute,
                      ),
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }

  ExpandedSection _timeSelected() {
    return ExpandedSection(
      tilePadding: EdgeInsets.zero,
      title: ListTile(
        title: const Text('Time'),
        trailing: Text(time.format(context)),
      ),
      content: SizedBox(
        height: 100,
        child: CupertinoDatePicker(
          initialDateTime: DateTime(1, 1, 1, time.hour, time.minute),
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (DateTime newTime) {
            setState(() => time = TimeOfDay.fromDateTime(newTime));
          },
        ),
      ),
      trailing: const SizedBox(),
    );
  }

  ExpandedSection _repeatTypeSelected() {
    return ExpandedSection(
      tilePadding: EdgeInsets.zero,
      title: ListTile(
        title: const Text('Repeat'),
        trailing: Text('Every ${repeatType.name}'),
      ),
      content: SizedBox(
        height: Dimens.d75.responsive(),
        child: Row(
          children: [
            const Expanded(
              child: Center(child: Text('Every')),
            ),
            Expanded(
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: RepeatType.values.indexOf(repeatType),
                ),
                itemExtent: 32,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    repeatType = RepeatType.values[value];
                  });
                },
                children: List<Widget>.generate(RepeatType.values.length,
                    (int index) {
                  return Center(
                    child: Text(
                      RepeatType.values[index].name,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      trailing: const SizedBox(),
    );
  }

  ExpandedSection _reminderTypeSelected() {
    return ExpandedSection(
      title: ListTile(
        title: const Text('Reminder type'),
        trailing: Text(reminderType.name.capitalizeFirstLetter()),
      ),
      tilePadding: EdgeInsets.zero,
      content: Column(
        children: List.generate(
          ReminderType.values.length,
          (index) {
            final selected = reminderType == ReminderType.values[index];
            return ClipRRect(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimens.d8.responsive(),
                  // vertical: Dimens.d4.responsive(),
                ),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      reminderType = ReminderType.values[index];
                    });
                  },
                  trailing: selected ? const Icon(Icons.check) : null,
                  selected: selected,
                  titleTextStyle: Theme.of(context).textTheme.labelSmall,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimens.d16.responsive()),
                  ),
                  title: Text(
                    ReminderType.values[index].name.capitalizeFirstLetter(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      trailing: const SizedBox(),
    );
  }
}
