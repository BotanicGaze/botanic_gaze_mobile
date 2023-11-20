import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/my_garden/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/cupertino.dart';
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
  final ScrollController _scrollController = ScrollController();

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
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                title: ChangeNotifierProvider.value(
                  value: _scrollController,
                  child: Consumer<ScrollController>(
                    builder: (context, value, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 120),
                        transitionBuilder: (child, animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, -1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                        child: value.position.pixels <
                                ScreenUtil().screenWidth * 9 / 16
                            ? const SizedBox()
                            : Text(
                                state.myPlant?.plantInfo?.botanicalName
                                        ?.parseHtmlString() ??
                                    '',
                              ),
                      );
                    },
                  ),
                ),
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
              SliverPadding(
                padding:
                    EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
                sliver: SliverList.list(
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
                      return ListTile(
                        onTap: () {
                          PopupReminderType.show(
                            context,
                            plantReminder: state.plantReminder(type) ??
                                PlantReminder(reminderType: type),
                          );
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(type.name),
                        trailing: Switch(
                          value: state.reminderIsActive(type),
                          onChanged: (value) async {
                            bloc.add(
                              SwitchActiveStateReminder(
                                state.plantReminder(type)?.id ?? '',
                                isActive: value,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SliverAppBar(
                automaticallyImplyLeading: false,
                title: Text('Journal'),
                pinned: true,
                primary: false,
                centerTitle: false,
                backgroundColor: Colors.transparent,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  // height: AppDimen.current.screenHeight,
                  child: Padding(
                    padding: EdgeInsets.all(Dimens.d16.responsive()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.imageJournalEmpty),
                        SizedBox(height: Dimens.d16.responsive()),
                        const Text(
                          'Within the untouched soil of this plant care journal, cultivate a symphony of growth and vitality as each entry becomes a testament to the flourishing journey of your green companions.',
                          textAlign: TextAlign.center,
                        ),
                        // SizedBox(height: Dimens.d16.responsive()),
                        AppSafeArea(
                          child: AppButton.large(
                            child: const Text('Add journal'),
                            onPressed: () {
                              showModalBottomSheet<dynamic>(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return CupertinoActionSheet(
                                    actions: [
                                      const Text('ahihi'),
                                      CupertinoActionSheetAction(
                                        isDestructiveAction: true,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Action'),
                                      ),
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Action'),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
              // SliverList.list(
              //   children: List.generate(
              //     100,
              //     (index) => ListTile(title: Text(index.toString())),
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
