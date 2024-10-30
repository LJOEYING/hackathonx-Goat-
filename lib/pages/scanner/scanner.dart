import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hackathonx/pages/scanner/result.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> with WidgetsBindingObserver {
  CameraController? cameraController;
  List<CameraDescription>? cameras;
  String? imagePath;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        cameraController =
            CameraController(cameras!.first, ResolutionPreset.medium);
        await cameraController!.initialize();
        setState(() {});
      } else {
        print("No cameras found");
      }
    } catch (e) {
      print('Camera initialization error: $e');
    }
  }

  Future<void> captureImage() async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      try {
        setState(() {
          isLoading = true; // Set isLoading to true at the beginning
        });

        final XFile capturedFile = await cameraController!.takePicture();
        imagePath = capturedFile.path;

        if (imagePath != null) {
          final details = await generateDetailsByGemini(imagePath);

          setState(() {
            isLoading = false; // Set isLoading to false after processing
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Result(imgPath: imagePath!, details: details),
            ),
          );
        }
      } catch (e) {
        setState(() {
          isLoading = false; // Ensure loading indicator is hidden on error
        });
        print('Error capturing image: $e');
      }
    }
  }

  Future<String> generateDetailsByGemini(String? imgPath) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: 'AIzaSyBjGNyOUBuuJ6thHT6Jo9ypRYOqVvB_bXY',
    );

    // Proper JSON format in the prompt string
    final prompt =
        "Based on the image provided, determine the name of the waste, type of waste, saved carbon footprint, and how to manage it, write the the following format: Waste Name : \n\n Waste Type: \n\n Saved Carbon Dioxide: \n\n Ways to manage:";
//     '''
// Based on the image provided, determine the following details in JSON format:
// {
//   "waste_name": "Name of waste",
//   "waste_type": "Type of waste",
//   "saved_carbon_dioxide": "Carbon Dioxide Saved",
//   "ways_to_manage": "Ways to manage the waste"
// }''';

    final image = await File(imgPath!).readAsBytes();
    final mimetype = 'image/jpeg';

    final response = await model.generateContent([
      Content.multi([TextPart(prompt), DataPart(mimetype, image)])
    ]);

    final responseText = response.text!;
    return responseText;
    // try {
    //   final Map<String, dynamic> parsedJson = jsonDecode(responseText);

    //   // Return a Map<String, String> with fallback to "Unknown" for any missing keys
    //   return {
    //     'waste_name': parsedJson['waste_name'] ?? 'Unknown',
    //     'waste_type': parsedJson['waste_type'] ?? 'Unknown',
    //     'saved_carbon_dioxide': parsedJson['saved_carbon_dioxide'] ?? 'Unknown',
    //     'ways_to_manage': parsedJson['ways_to_manage'] ?? 'Unknown',
    //   };
    // } catch (e) {
    //   // Return a map with "Parsing Error" in case of an exception
    //   return {
    //     'waste_name': 'Parsing Error',
    //     'waste_type': 'Parsing Error',
    //     'saved_carbon_dioxide': 'Parsing Error',
    //     'ways_to_manage': 'Parsing Error',
    //   };
    // }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (cameraController != null && cameraController!.value.isInitialized) {
      cameraController?.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (cameraController == null || !cameraController!.value.isInitialized)
      return;

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initializeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          cameraController != null && cameraController!.value.isInitialized
              ? SizedBox.expand(child: CameraPreview(cameraController!))
              : const Center(child: CircularProgressIndicator()),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Find item to scan',
                  style: GoogleFonts.workSans(
                    textStyle: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(child: Image.asset('assets/scannerFrame.png')),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton.large(
                shape: CircleBorder(),
                onPressed: () => captureImage(),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Colors.black,
                  size: 45,
                ),
              ),
            ),
          ),
          if (isLoading) // Show loading indicator if isLoading is true
            Center(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
