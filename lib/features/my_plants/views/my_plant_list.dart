import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class MyPlantListView extends StatelessWidget {
  const MyPlantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(NavigationContains.searchPage);
                  },
                  child: AppTextField(
                    hintText: 'Monstera Albo',
                    enabled: false,
                    prefixIcon: Hero(
                      tag: AppIcons.iconSearch,
                      child: Image.asset(
                        AppIcons.iconSearch,
                        width: Dimens.d16.responsive(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Dimens.d8.responsive()),
              SizedBox(
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(NavigationContains.scanPage);
                  },
                  child: SizedBox(
                    // width: Dimens.d50.responsive(),
                    child: IconButton.filled(
                      onPressed: () {},
                      icon: Image.asset(
                        AppIcons.iconCamera,
                        // width: Dimens.d64.responsive(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimens.d8),
        Expanded(
          child: ListView.separated(
            itemCount: 100,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        SizedBox(
                          width: Dimens.d75.responsive(),
                          height: Dimens.d75.responsive(),
                          child: CachedImageWidget(
                            borderRadius:
                                BorderRadius.circular(Dimens.d8.responsive()),
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://file1.dangcongsan.vn/data/0/images/2020/05/25/duongntcd/3-mua-hoa-hoang-yen-du-phong.jpg?dpi=150&quality=100&w=680',
                          ),
                        ),
                        SizedBox(
                          width: Dimens.d8.responsive(),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hoa hoàng yến',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Text(
                                'Hoa hoàng yến',
                              ),
                              // const Center(child: Wrap())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: Dimens.d8.responsive(),
              );
            },
          ),
        )
      ],
    );
  }
}
