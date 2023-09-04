import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:flutter/material.dart';

class BotanicalDetails extends StatefulWidget {
  const BotanicalDetails({super.key, this.plantDetailModel});

  final PlantDetailModel? plantDetailModel;

  @override
  State<BotanicalDetails> createState() => _BotanicalDetailsState();
}

class _BotanicalDetailsState extends State<BotanicalDetails> {
  Map<String, String> _botanicData = {};

  @override
  void initState() {
    super.initState();
    _botanicData = {
      'Plant type': widget.plantDetailModel?.plantTypes
              ?.map((e) => e.title)
              .toList()
              .join(',') ??
          '',
      'Family': widget.plantDetailModel?.family ?? '',
      'Name status': widget.plantDetailModel?.nameStatus ?? '',
      'Native to the UK': widget.plantDetailModel?.isNative.toString() ?? '',
      'Foliage': widget.plantDetailModel?.foliage
              ?.map((e) => e.title)
              .toList()
              .join(',') ??
          '',
      'Habit': widget.plantDetailModel?.habit
              ?.map((e) => e.title)
              .toList()
              .join(',') ??
          '',
      'Genus': widget.plantDetailModel?.genusDescription ?? '',
      'Horticultural Group':
          widget.plantDetailModel?.hortGroupDescription ?? '',
      'Potentially harmful':
          widget.plantDetailModel?.toxicity?.join(', ') ?? '',
      'Plant range': widget.plantDetailModel?.range ?? '',
    };
    _botanicData.removeWhere((key, value) => value.trim().isEmpty);
  }

  @override
  void didUpdateWidget(covariant BotanicalDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    _botanicData = {
      'Plant type': widget.plantDetailModel?.plantTypes
              ?.map((e) => e.title)
              .toList()
              .join(',') ??
          '',
      'Family': widget.plantDetailModel?.family ?? '',
      'Name status': widget.plantDetailModel?.nameStatus ?? '',
      'Native to the UK': widget.plantDetailModel?.isNative.toString() ?? '',
      'Foliage': widget.plantDetailModel?.foliage
              ?.map((e) => e.title)
              .toList()
              .join(',') ??
          '',
      'Habit': widget.plantDetailModel?.habit
              ?.map((e) => e.title)
              .toList()
              .join(',') ??
          '',
      'Genus': widget.plantDetailModel?.genusDescription ?? '',
      'Horticultural Group':
          widget.plantDetailModel?.hortGroupDescription ?? '',
      'Potentially harmful':
          widget.plantDetailModel?.toxicity?.join(', ') ?? '',
      'Plant range': widget.plantDetailModel?.range ?? '',
    };
    _botanicData.removeWhere((key, value) => value.trim().isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Botanical Details',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(height: Dimens.d8.responsive()),
          ...List.generate(_botanicData.entries.length, (index) {
            final value = _botanicData.entries.toList()[index];
            return _rowInfoData(
              context,
              title: value.key,
              content: value.value,
              index: index,
            );
          })
        ],
      ),
    );
  }

  Widget _rowInfoData(
    BuildContext context, {
    required String title,
    required String content,
    required int index,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.d8.responsive(),
        horizontal: Dimens.d8.responsive(),
      ),
      decoration: BoxDecoration(
        color: index.isEven ? Theme.of(context).colorScheme.secondary : null,
        borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(width: Dimens.d8.responsive()),
          Expanded(
            flex: 6,
            child: Text(
              content,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
