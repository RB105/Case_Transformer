import 'package:casetransformer/utils/app_tutoiral_target.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  TextEditingController controller = TextEditingController();
  bool isUppercase = true;
  String result = "";

  // keys
  final GlobalKey inputKey = GlobalKey();
  final GlobalKey outputKey = GlobalKey();
  final GlobalKey transformKey = GlobalKey();
  final GlobalKey stateTransKey = GlobalKey();
  final GlobalKey clipboardKey = GlobalKey();

  late TutorialCoachMark tutorialCoachMark;

  void _initKeys() {
    tutorialCoachMark = TutorialCoachMark(
      targets: getTargets(
          inputKey: inputKey,
          outputKey: outputKey,
          transformKey: transformKey,
          stateTransKey: stateTransKey,
          clipboardKey: clipboardKey),
      colorShadow: Colors.blue,
      hideSkip: false,
      opacityShadow: 0.8,
      paddingFocus: 10,
      onFinish: () {
        GetStorage().write('isSaved', true);
      },
    );
  }

  @override
  void initState() {
    _initKeys();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (GetStorage().read('isSaved') == null ||
            GetStorage().read('isSaved') == false) {
          tutorialCoachMark.show(context: context);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Case Transfer"),
        actions: const [Text("RB")],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  key: inputKey,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12)),
                  child: TextFormField(
                    controller: controller,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Matn kiriting..."),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      key: transformKey,
                      onPressed: transform,
                      child: const Text("Transform")),
                  OutlinedButton(
                      key: stateTransKey,
                      onPressed: () {
                        if (isUppercase) {
                          isUppercase = !isUppercase;
                        } else {
                          isUppercase = !isUppercase;
                        }
                        setState(() {});
                      },
                      child: Text(isUppercase ? "KATTA HARF" : "kichik harf"))
                ],
              )),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                            key: outputKey,
                            child: ListTile(
                              title: Text(result),
                            )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                                key: clipboardKey,
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: result));
                                },
                                icon: const Icon(
                                  Icons.copy,
                                  size: 20,
                                )))
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void transform() {
    if (isUppercase) {
      result = controller.text.toUpperCase();
    } else {
      result = controller.text.toLowerCase();
    }
    setState(() {});
  }
}
