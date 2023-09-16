import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ExploreBloc, ExploreState, WeatherResponse?>(
      selector: (state) => state.weatherResponse,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
          child: Row(
            children: [
              SizedBox(
                width: Dimens.d50.responsive(),
                height: Dimens.d50.responsive(),
                child: CachedImageWidget(
                  imageUrl: 'https:${state?.current?.condition?.icon}',
                ),
              ),
              SizedBox(width: Dimens.d8.responsive()),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state?.location?.name ?? '',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
              ),
              SizedBox(width: Dimens.d12.responsive()),
              Column(
                children: [
                  Text(
                    "${state?.current?.tempC.toString() ?? ''}°C",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: AppFontWeight.bold,
                          // fontSize: 35.sp,
                        ),
                  ),
                  Text(
                    "Feels: ${state?.current?.feelslikeC.toString() ?? ''}°C",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
