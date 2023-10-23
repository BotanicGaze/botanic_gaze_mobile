import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/features/my_garden/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class MyPlantDetailScreen extends StatefulWidget {
  const MyPlantDetailScreen({required this.item, super.key});

  final MyPlantModel? item;

  @override
  State<MyPlantDetailScreen> createState() => _MyPlantDetailScreenState();
}

class _MyPlantDetailScreenState
    extends BasePageState<MyPlantDetailScreen, MyPlantDetailBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(InitState(widget.item));
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<MyPlantDetailBloc, MyPlantDetailState>(
      builder: (context, state) {
        return CommonScaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  title: innerBoxIsScrolled
                      ? Text(
                          state.myPlant?.plantInfo?.botanicalName
                                  ?.parseHtmlString() ??
                              '',
                        )
                      : null,
                  expandedHeight: ScreenUtil().screenWidth * 9 / 16,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CachedImageWidget(
                      imageUrl: state.myPlant?.plantInfo?.featureImage ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimens.d16.responsive()),
                    Text(
                      widget.item?.plantInfo?.botanicalName
                              ?.parseHtmlString() ??
                          '',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    SizedBox(height: Dimens.d32.responsive()),
                    Text(
                      'Reminder',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: Dimens.d16.responsive()),
                    ...List.generate(ReminderType.values.length, (index) {
                      final type = ReminderType.values[index];
                      return GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(type.name),
                          trailing: Switch(
                            value: state.reminderIsActive(type),
                            onChanged: (value) async {
                              await showModalBottomSheet<dynamic>(
                                context: context,
                                builder: (context) {
                                  return const Column(
                                    children: [],
                                  );
                                },
                              );
                              // bloc.add(AddReminder(type));
                            },
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
