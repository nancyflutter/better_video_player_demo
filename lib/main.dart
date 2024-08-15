import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final BetterPlayerController _betterPlayerController = BetterPlayerController(
    const BetterPlayerConfiguration(),
  );

  @override
  Widget build(BuildContext context) {
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://res.cloudinary.com/dgnvgilw5/video/upload/q_auto/v1720682043/uploads/post/ebub6lotg7hhishcjj5r.mp4",
    );

    _betterPlayerController.setupDataSource(dataSource);

    double aspectRatio = _betterPlayerController.betterPlayerConfiguration.aspectRatio ?? 9 / 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Better Player Example'),
      ),
      body: AspectRatio(
        aspectRatio: aspectRatio,
        child: BetterPlayer(
          controller: _betterPlayerController,
        ),
      ),
    );
  }
}



/*
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the GetX controller
    final VideoPlayerController controller = Get.put(VideoPlayerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Better Player Example'),
      ),
      body: Center(
        child: BetterPlayer(
        controller: controller.betterPlayerController,
      ),
    ),);
  }
}

class VideoPlayerController extends GetxController {
  late BetterPlayerController betterPlayerController;

  @override
  void onInit() {
    super.onInit();
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://res.cloudinary.com/dgnvgilw5/video/upload/q_auto/v1720682043/uploads/post/ebub6lotg7hhishcjj5r.mp4",
    );

    betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        autoPlay: true,
      ),
    );

    betterPlayerController.setupDataSource(dataSource);
  }

  @override
  void onClose() {
    betterPlayerController.dispose();
    super.onClose();
  }
}
*/
