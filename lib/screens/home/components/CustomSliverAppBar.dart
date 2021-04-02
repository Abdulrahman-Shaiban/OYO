import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final Widget content;
  final Widget icon;
  final Widget leading;
  final Widget trailing;
  final BuildContext context;
  double size = 0.0;

  CustomSliverAppBar(
      {@required this.content,
      @required this.icon,
      @required this.leading,
      @required this.trailing,
      @required this.context});

  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;
    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    final double animationVal = scrollAnimationValue(shrinkOffset);
    double maxWidth = MediaQuery.of(context).size.width * 0.93;
    double minWidth = maxWidth * 0.83;

    return Container(
      height: visibleMainHeight,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _getTrailing(context),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 20,
            child: AnimatedOpacity(
              opacity:
                  largeTitleWidth(animationVal, maxWidth, minWidth) > minWidth
                      ? 1.0
                      : 0.0,
              duration: Duration(milliseconds: 300),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: icon,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: _titleAnimationVal(animationVal),
                    child: Container(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: largeTitleWidth(animationVal, maxWidth, minWidth),
                      child: content,
                    ),
                  ),
                  Expanded(
                    flex: _titleAnimationVal(animationVal),
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          _getLeading(context),
        ],
      ),
    );
  }

  double largeTitleWidth(animationVal, maxWidth, minWidth) {
//      var size = animationVal * 40;
    size = (maxWidth - minWidth) * animationVal + minWidth;
    if (size > maxWidth) {
      return maxWidth;
    } else if (size < minWidth) {
      return minWidth;
    }
    return size;
  }

  _getTrailing(context) {
    return Positioned(
      top: 35,
      right: 10.0,
      child: trailing,
    );
  }

  _getLeading(context) {
    return Positioned(
      top: 35,
      left: 10.0,
      child: leading,
    );
  }

  _titleAnimationVal(animationVal) {
    if (Platform.isAndroid) {
      return (0 - (animationVal * 100)).toInt();
    } else if (Platform.isIOS) {
      return (100 - (animationVal * 100)).toInt();
    }
  }

  @override
  double get maxExtent => 130.0;

  @override
  double get minExtent {
    return 80.0;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
