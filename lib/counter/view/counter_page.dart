import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/counter/counter.dart';
import 'package:botanic_gaze/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paging_view/paging_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().changeLoading(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatefulWidget {
  const CounterText({super.key});

  @override
  State<CounterText> createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText> {
  late final _pagingController = CommonPagingController<int>();
  // ..disposeBy(disposeBag);

  @override
  void initState() {
    super.initState();
    // bloc.add(const HomePageInitiated());
    // _pagingController.listen(
    //   onLoadMore: () => bloc.add(const UserLoadMore()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return CommonPagedListView<int>(
      pagingController: _pagingController,
      itemBuilder: (context, user, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.d8.responsive(),
            vertical: Dimens.d4.responsive(),
          ),
          child: ShimmerLoading(
            isLoading: context.watch<CounterCubit>().state,
            loadingWidget: const _LoadingItem(),
            child: GestureDetector(
              onTap: () async {
                // await navigator.push(AppRouteInfo.itemDetail(user));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: AppColors.current.primaryColor,
                  borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
                ),
                width: double.infinity,
                height: Dimens.d60.responsive(),
                child: const Text(
                  'user.email',
                  // style: AppTextStyles.s14w400Primary(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoadingItem extends StatelessWidget {
  const _LoadingItem();

  @override
  Widget build(BuildContext context) {
    return RoundRectangleShimmer(
      width: double.infinity,
      height: Dimens.d60.responsive(),
    );
  }
}
