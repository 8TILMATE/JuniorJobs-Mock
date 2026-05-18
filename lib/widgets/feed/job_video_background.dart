import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../models/job_post.dart';
import '../gradient_background.dart';

class JobVideoBackground extends StatefulWidget {
  const JobVideoBackground({
    super.key,
    required this.job,
    required this.isMuted,
  });

  final JobPost job;
  final bool isMuted;

  @override
  State<JobVideoBackground> createState() => _JobVideoBackgroundState();
}

class _JobVideoBackgroundState extends State<JobVideoBackground> {
  late final VideoPlayerController _controller;
  late final Future<void> _initializeVideo;
  bool _videoFailed = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.job.videoUrl.startsWith('assets/')
        ? VideoPlayerController.asset(widget.job.videoUrl)
        : VideoPlayerController.networkUrl(Uri.parse(widget.job.videoUrl));
    _controller
      ..setLooping(true)
      ..setVolume(widget.isMuted ? 0 : 1);
    _initializeVideo = _controller
        .initialize()
        .then((_) {
          if (mounted) {
            _controller.play();
            setState(() {});
          }
        })
        .catchError((Object _) {
          if (mounted) {
            setState(() => _videoFailed = true);
          }
        });
  }

  @override
  void didUpdateWidget(covariant JobVideoBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isMuted != widget.isMuted) {
      _controller.setVolume(widget.isMuted ? 0 : 1);
      if (_controller.value.isInitialized && !_controller.value.isPlaying) {
        _controller.play();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GradientBackground(
            colors: widget.job.gradientColors.map(Color.new).toList(),
            child: const SizedBox.expand(),
          ),
          FutureBuilder<void>(
            future: _initializeVideo,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done ||
                  !_controller.value.isInitialized ||
                  _videoFailed) {
                return const _VideoLoadingState();
              }
              return FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _VideoLoadingState extends StatelessWidget {
  const _VideoLoadingState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.28),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 10),
            Text('Video demonstrativ'),
          ],
        ),
      ),
    );
  }
}
