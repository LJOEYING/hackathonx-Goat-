import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hackathonx/pages/scanner/result.dart';

// Defining the Scanner class as a StatefulWidget
class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> with WidgetsBindingObserver {
  CameraController? cameraController; // Controller to manage camera functionalities
  List<CameraDescription>? cameras; // List to hold available camera descriptions
  String? imagePath; // Path to the captured image
  bool isLoading = false; // Flag to indicate loading state during image processing

  // Lifecycle method that initializes the state
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Adding the observer to listen to app lifecycle changes
    initializeCamera(); // Initializing the camera
  }

  // Method to initialize the camera
  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras(); // Fetching available cameras
      if (cameras != null && cameras!.isNotEmpty) {
        // Checking if cameras are available
        cameraController =
            CameraController(cameras!.first, ResolutionPreset.medium); // Creating a camera controller
        await cameraController!.initialize(); // Initializing the camera controller
        setState(() {});
      } else {
        print("No cameras found"); // Logging if no cameras are available
      }
    } catch (e) {
      print('Camera initialization error: $e'); // Logging any initialization error
    }
  }

  // Method to capture an image from the camera
  Future<void> captureImage() async {
    // Check if the camera controller is initialized
    if (cameraController != null && cameraController!.value.isInitialized) {
      try {
        setState(() {
          isLoading = true; // Set loading to true while capturing the image
        });

        final XFile capturedFile = await cameraController!.takePicture(); // Capture image
        imagePath = capturedFile.path; // Store the path of the captured image

        if (imagePath != null) {
          // If image path is not null, process the image
          final details = await generateDetailsByGemini(imagePath); // Generate details using AI

          setState(() {
            isLoading = false;
          });

          // Navigate to the Result page with image path and details
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
        print('Error capturing image: $e'); // Log any error during image capture
      }
    }
  }

  // Method to generate details from the captured image using the AI model
  Future<String> generateDetailsByGemini(String? imgPath) async {
    // Initializing the generative AI model with API key
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: 'AIzaSyBjGNyOUBuuJ6thHT6Jo9ypRYOqVvB_bXY',
    );

    // Prompt for the AI model to generate information from the image
    final prompt =
        "Based on the image provided, determine the name of the waste, type of waste, saved carbon footprint, and how to manage it, write the the following format: Waste Name : \n\n Waste Type: \n\n Saved Carbon Dioxide: \n\n Ways to manage:";

    // Reading the image file as bytes
    final image = await File(imgPath!).readAsBytes();
    final mimetype = 'image/jpeg'; // Setting the MIME type for the image

    // Sending the image and prompt to the AI model for processing
    final response = await model.generateContent([
      Content.multi([TextPart(prompt), DataPart(mimetype, image)])
    ]);

    final responseText = response.text!; // Extracting the generated text from the response
    return responseText; // Returning the generated details
  }

  // Lifecycle method that disposes of resources when not needed
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Removing the observer
    if (cameraController != null && cameraController!.value.isInitialized) {
      cameraController?.dispose(); // Disposing of the camera controller
    }
    super.dispose(); // Calling the superclass dispose method
  }

  // Lifecycle method that handles changes in app state
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (cameraController == null || !cameraController!.value.isInitialized)
      return; // Return if camera is not initialized

    // Handling app lifecycle states
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initializeCamera();
    }
  }

  // Build method to construct the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          cameraController != null && cameraController!.value.isInitialized
              ? SizedBox.expand(child: CameraPreview(cameraController!)) // Show camera preview if initialized
              : const Center(child: CircularProgressIndicator()), // Show loading indicator while initializing
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
                onPressed: () => captureImage(), // Capture image when button is pressed
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
