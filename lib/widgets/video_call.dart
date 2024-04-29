import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    // Initialize camera
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras.first,
      ResolutionPreset.high,
    );

    await _cameraController.initialize();

    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
        title: Text('Video Call'),
      ),
      body: Center(
        child: _isCameraInitialized
            ? IconButton(
          icon: Icon(
            Icons.videocam,
            color: Colors.deepPurple.shade700,
            size: 45,
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraScreen(cameraController: _cameraController),
              ),
            );
          },
        )
            : CircularProgressIndicator(), // Show a loading indicator until the camera is initialized
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final CameraController cameraController;

  const CameraScreen({Key? key, required this.cameraController}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CameraPreview(widget.cameraController),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Start the camera preview when the screen initializes
    widget.cameraController.startImageStream((image) => null);
  }

  @override
  void dispose() {
    // Stop the camera preview when the screen is disposed
    widget.cameraController.stopImageStream();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: VideoCallScreen(),
  ));
}
