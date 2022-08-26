import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sliderValue = 300.0;
  double embeddedValue = 100.0;
  bool isQrEyeShapeCircle = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: 'https://www.togetherwerule.com/',
                version: QrVersions.auto,
                size: sliderValue,
                embeddedImage: embeddedValue == 0
                    ? null
                    : const AssetImage('assets/logo/together_logo.png'),
                embeddedImageStyle: embeddedValue == 0
                    ? null
                    : QrEmbeddedImageStyle(
                        size: const Size(130, 30),
                      ),
                eyeStyle: isQrEyeShapeCircle
                    ? const QrEyeStyle(
                        eyeShape: QrEyeShape.circle,
                        color: Color(0xFFE42268),
                      )
                    : const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Color(0xFFE42268),
                      ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.circle,
                  color: Color.fromARGB(255, 154, 201, 255),
                ),
                errorCorrectionLevel: QrErrorCorrectLevel.H,
              ),
              Slider(
                value: sliderValue,
                min: 80,
                max: 300,
                label: sliderValue.toString(),
                thumbColor: const Color(0xFFFDDB68),
                activeColor: const Color(0xFFE42268),
                onChanged: (value) => sliderOnChanged(value),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: onQrEyeShapeChange,
                      iconSize: 80,
                      icon: const Icon(
                        Icons.change_circle,
                        color: Color(0xFFFDDB68),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  sliderOnChanged(double value) {
    setState(() {
      sliderValue = value;
      if (value == 300.0) {
        embeddedValue = 60.0;
      } else {
        embeddedValue = 0;
      }
    });
  }

  onQrEyeShapeChange() {
    setState(() {
      isQrEyeShapeCircle = !isQrEyeShapeCircle;
    });
  }
}
