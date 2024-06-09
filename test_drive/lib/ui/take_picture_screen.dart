import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'display_picture_screen.dart';

class TakePictureScreen extends StatelessWidget {
  final CameraDescription camera;

  const TakePictureScreen({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return TakePictureView(camera: camera);
  }
}

class TakePictureView extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureView({super.key, required this.camera});

  @override
  State<TakePictureView> createState() => TakePictureViewState();
}

class TakePictureViewState extends State<TakePictureView> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();

            if (!context.mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
