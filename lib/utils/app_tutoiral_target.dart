import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

List<TargetFocus> getTargets(
    {required GlobalKey inputKey,
    required GlobalKey outputKey,
    required GlobalKey transformKey,
    required GlobalKey stateTransKey,
    required GlobalKey clipboardKey}) {
  // list of target widgets
  List<TargetFocus> targets = [];

  // INPUT KEY
  targets.add(TargetFocus(
      keyTarget: inputKey,
      alignSkip: Alignment.topRight,
      radius: 26,
      shape: ShapeLightFocus.RRect,
      contents: <TargetContent>[
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                children: <Widget>[
                  Text(
                    "Bu yerda siz o'zgartirmoqchi bo'lgan matnni kiritasiz",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )
                ],
              ),
            );
          },
        )
      ]));

  // OUTPUT KEY
  targets.add(TargetFocus(
      keyTarget: outputKey,
      alignSkip: Alignment.topRight,
      radius: 40,
      shape: ShapeLightFocus.RRect,
      contents: <TargetContent>[
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                children: <Widget>[
                  Text(
                    "Bu yerda siz kiritgan matnning o'zgartirilganini ko'rasiz",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )
                ],
              ),
            );
          },
        )
      ]));

  // TRANSFORM KEY
  targets.add(TargetFocus(
      keyTarget: transformKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: <TargetContent>[
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                children: <Widget>[
                  Text(
                    "Bu orqali kiritilgan matn transformatsiya bo'ladi",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )
                ],
              ),
            );
          },
        )
      ]));

  // STATE TRANS KEY
  targets.add(TargetFocus(
      keyTarget: stateTransKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: <TargetContent>[
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                children: <Widget>[
                  Text(
                    "Bu tugma orqali transform holatini o'zgartirasiz",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )
                ],
              ),
            );
          },
        )
      ]));

  // CLIPBOARD KEY
  targets.add(TargetFocus(
      keyTarget: clipboardKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: <TargetContent>[
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return Container(
              alignment: Alignment.center,
              child: const Column(
                children: <Widget>[
                  Text(
                    "Buni bosib chiqqan textni nusxalaysiz",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )
                ],
              ),
            );
          },
        )
      ]));

  return targets;
}
