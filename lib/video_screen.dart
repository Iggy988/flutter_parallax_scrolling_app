import 'package:flutter/material.dart';
import 'package:parallax_animation/video_card.dart';

final videos = [
  'assets/videos/video1.mp4',
  'assets/videos/video2.mp4',
  'assets/videos/video3.mp4',
  'assets/videos/video4.mp4',

];

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: PageView.builder(
              itemCount: videos.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return VideoCard(
                  assetPath: videos[index],
                  isSelected: _selectedIndex == index,
                );
              },
              onPageChanged: (i) => setState(
                () => _selectedIndex = i,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
