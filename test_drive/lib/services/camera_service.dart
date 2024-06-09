import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

List<CameraDescription> cameras = [];

Future<void> initializeCamera() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
}
