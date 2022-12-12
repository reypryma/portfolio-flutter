import 'package:flutter/material.dart';
import 'package:portfolio/menus/portfolio/back_to_top_button.dart';
import 'package:provider/provider.dart';

import '../utils/nako_widget.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 10,
  );

  @override
  Widget build(BuildContext context) {
    // final postMdl = Provider.of<ScrollController>(context);
    return ChangeNotifierProvider<ScrollController>(
      create: (_)=>scrollController,
      child: Scaffold(
          appBar: appBar(context, 'Next State', showBack: true),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Center(
              child: Text(
                'This is provider proof'
              ),
            ),
          ),
          floatingActionButton: BackToTopButton(),
        )
    );
  }
}
