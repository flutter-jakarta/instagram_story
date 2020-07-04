import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_story/model/story.dart';

class StoryPageIndicator extends StatefulWidget {
  final List<Story> stories;
  final double parentPadding;
  final int activeStory;
  final Function nextStory;

  const StoryPageIndicator({
    Key key,
    @required this.stories,
    this.parentPadding = 0,
    @required this.activeStory,
    @required this.nextStory,
  }) : super(key: key);

  @override
  _StoryPageIndicatorState createState() => _StoryPageIndicatorState();
}

class _StoryPageIndicatorState extends State<StoryPageIndicator> {
  double activeContainerWidth = 0;
  double containerWidth = 0;

  Timer timer;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double screenWidth =
          MediaQuery.of(context).size.width - widget.parentPadding * 2;

      setState(() {
        containerWidth = screenWidth / widget.stories.length;
        activeContainerWidth = containerWidth;
      });

      _autoNextStory();
    });
  }

  @override
  void didUpdateWidget(StoryPageIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      activeContainerWidth = 0;
    });

    Future.delayed(Duration.zero, () {
      setState(() {
        activeContainerWidth = containerWidth;
      });
    });

    _autoNextStory();
  }

  @override
  void dispose() {
    super.dispose();

    if (timer != null) {
      timer.cancel();
    }
  }

  _autoNextStory() {
    if (timer != null) {
      timer.cancel();
    }

    timer = Timer(Duration(seconds: 2), () {
      widget.nextStory();
      timer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildIndicators(context),
    );
  }

  List<Widget> _buildIndicators(BuildContext context) {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.stories.length; i++) {
      double padding = 2;
      if (i == widget.stories.length - 1) {
        padding = 0;
      }

      Widget indicator = Container(
        padding: EdgeInsets.only(right: padding),
        width: containerWidth,
        height: 2,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF).withOpacity(0.5),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            if (i == widget.activeStory)
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(50),
                ),
                width: activeContainerWidth,
                duration: Duration(seconds: 2),
              ),
            if (i < widget.activeStory)
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(50),
                ),
              )
          ],
        ),
      );

      indicators.add(indicator);
    }

    return indicators;
  }
}
