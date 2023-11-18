import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class FrequentlyAskedQuestions extends StatefulWidget {
  const FrequentlyAskedQuestions({super.key});

  @override
  State<FrequentlyAskedQuestions> createState() =>
      _FrequentlyAskedQuestionsState();
}

class _FrequentlyAskedQuestionsState extends State<FrequentlyAskedQuestions> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.d16.responsive()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.all(Dimens.d16.responsive()),
              //   child: Text(
              //     'Using ${getIt<AppInfo>().appName}',
              //     style: Theme.of(context).textTheme.titleLarge,
              //   ),
              // ),
              ...List.generate(data.length, (index) {
                final item = data[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: Dimens.d8.responsive()),
                  child: ExpandedSection(
                    title: Text(
                      item.title,
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    content: Padding(
                      padding: EdgeInsets.all(Dimens.d16.responsive()),
                      child: Text(item.content),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Column buildCollapsed1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Expandable',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildExpanded1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Expandable',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '3 Expandable widgets',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<FrequentlyAskedQuestionsData> data = [
  FrequentlyAskedQuestionsData(
    title: 'How do I know if the plant is a weed or not?',
    content:
        'PictureThis can identify weeds and advise on how to get rid of them. The weed indication info will be displayed on the identification result page if the plant is considered as invasive or unwanted in most cases. You can then tap “More” to learn more about how to identify and get rid of this type of weeds.',
  ),
  FrequentlyAskedQuestionsData(
    title: 'How can I diagnose my plant with PictureThis?',
    content:
        'To diagnose a plant problem, please tap “Diagnose” on the homepage, and upload the pictures of this plant. If you are not satisfied with the auto diagnosis result, it is suggested to tap the “Ask Expert for Help” button at the bottom of the “Diagnose” page. Once we receive your consultation ticket, our botanist team will customize a treatment plan for your plant within 24 hours.',
  ),
  FrequentlyAskedQuestionsData(
    title: 'How do I share my identification with friends?',
    content: '''
I’m glad to hear that you’d like to share the information with your friends. To do so, here are instructions:
1. Launch the app>Go to [My Plants] section
2. Tap the plant picture you’d like to share
3. Tap “Share” button at the bottom
4. Select a channel to export the information out
''',
  ),
  FrequentlyAskedQuestionsData(
    title: 'Can I use PictureThis offline?',
    content:
        "Since PictureThis runs on a big plant database, the identification process requires a network connection. When offline, the photos taken with PictureThis will be saved automatically to the My Plants section and will be identified once you are back online. An alternative is to take photos offline with your phone's camera roll and upload the photos to identify when the connection is back.",
  ),
  FrequentlyAskedQuestionsData(
    title: 'Is my information safe?',
    content:
        'We are cautious about sharing personal information. Although we require access to your photo gallery, we never process any photos without your permission. Rest assured that we will NEVER share your information with anyone.',
  )
];

class FrequentlyAskedQuestionsData {
  FrequentlyAskedQuestionsData({required this.title, required this.content});

  final String title;
  final String content;
}
