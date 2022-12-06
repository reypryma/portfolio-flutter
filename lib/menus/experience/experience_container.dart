import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({
    Key? key,
    required this.experience,
    required this.index,
  }) : super(key: key);

  final ExperienceInfo experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = ColorAsset.all;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: colors.elementAt(index % colors.length),
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.company,
            style: textStyle(isBold: true),
          ),
          SizedBox(height: 10),
          Text(
            experience.timeline,
            style: textStyle(isGrey: true),
          ),
          SizedBox(height: 10),
          for (final item in experience.descriptions)
            Text(
              item,
              style: textStyle(),
            )
        ],
      ),
    );
  }
}

TextStyle textStyle({bool isBold = false, bool isGrey = false}) {
  return TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    color: isGrey ? Colors.grey : Colors.black,
  );
}

class ExperienceInfo {
  final String company;
  final String timeline;
  final List<String> descriptions;
  ExperienceInfo({
    required this.company,
    required this.timeline,
    required this.descriptions,
  });
}

final experiences = [
  ExperienceInfo(
    company: 'Software Developer @ Antrian Sehat',
    timeline: '2020',
    descriptions: [
      '- Concepting UI / UX of Antrian Sehat',
      '- Responsible for making sure Desktop App Works',
      '- Also help in development in different frameworks \n i.e. Web and Backend',
    ],
  ),
  ExperienceInfo(
    company: 'Intern @ PT. Kita Bisa Teknologi',
    timeline: '2021',
    descriptions: [
      '- Developing UI/UX using Adobe XD',
      '- Taught Game Development in Unity/C#, assisted in Data Science Course in Python',
      '- Assisted in developing Blockchain curriculum in Javascript',
    ],
  ),
  ExperienceInfo(
    company: 'Managing Education Web @ Personal Blog',
    timeline: 'sunaonako.my.id | 2022',
    descriptions: [
      '- Developing Application using Wordpress as Headless CMS',
      '- Learnt HTML, CSS, PHP, and Wordpress Framework ',
      '- Accepted to Adsense Monetization Program in less than 1 day \n after submission',
    ],
  ),
  ExperienceInfo(
    company: 'Developing UX and interface Kelolaku using Five Planes Method',
    timeline: '2022',
    descriptions: [
      '- Abstract Idea to Prototype Store Management with Five Planes Method',
      '- Do Usability Testing for Evaluating Product',
      '- Developing Flutter Application of Kelolaku',
    ],
  ),
];
