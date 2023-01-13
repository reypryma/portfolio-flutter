import 'package:flutter/material.dart';
import 'package:portfolio/components/desktop_view_builder.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/components/mobile_view_builder.dart';
import 'package:portfolio/config.dart';
import 'package:portfolio/menus/project/project_item_body.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;
  ProjectItem({
    required this.image,
    required this.title,
    required this.description,
    required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: ImageProjects.kelolaku,
    title: 'Kelolaku Store Management Apps',
    description:
        'Kelolaku Store Management App: UI Documentation and Desiggn System Guideline of Kelolaku Store Apps, Developing Mobile App using Flutter',
    technologies: [
      'Flutter',
      'onesignal',
      'Figma',
    ],
  ),
  ProjectItem(
    image: ImageProjects.antrianSehat,
    title: 'Antrian Sehat',
    description:
        'Antrian Sehat: Web, Desktop, and Mobile Application efficient in managing Queueing and Reservation System of hospital.',
    technologies: [
      'React',
      'Java',
      'WPF',
      'Laravel',
    ],
  ),
  ProjectItem(
    image: ImageProjects.nakoInfo,
    title: 'Personal Blog',
    description:
        'Please Follow my social media web!',
    technologies: [
      'PHP / Wordpress',
      'CPanel',
      'MySQL',
    ],
  ),
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key? key,
  }) : super(key: key);
  static const title = 'Selected Projects';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.title,
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProjectItemBody(item: item),
                ),
              )
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [for (final item in kProjectItems) ProjectItemBody(item: item)],
    );
  }
}
