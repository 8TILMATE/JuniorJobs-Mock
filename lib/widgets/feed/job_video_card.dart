import 'package:flutter/material.dart';

import '../../core/brand_assets.dart';
import '../../core/app_scope.dart';
import '../../models/job_post.dart';
import '../asset_or_icon.dart';
import '../apply_celebration.dart';
import 'job_action_button.dart';
import 'job_info_overlay.dart';
import 'job_video_background.dart';

class JobVideoCard extends StatefulWidget {
  const JobVideoCard({super.key, required this.job});

  final JobPost job;

  @override
  State<JobVideoCard> createState() => _JobVideoCardState();
}

class _JobVideoCardState extends State<JobVideoCard> {
  bool _isMuted = true;

  @override
  Widget build(BuildContext context) {
    final feed = AppScope.of(context).feed;
    return AnimatedBuilder(
      animation: feed,
      builder: (context, _) {
        final applied = feed.isApplied(widget.job);
        return Padding(
          padding: const EdgeInsets.fromLTRB(18, 86, 18, 28),
          child: Stack(
            children: [
              Positioned.fill(
                child: JobVideoBackground(job: widget.job, isMuted: _isMuted),
              ),
              Positioned.fill(child: _VideoBottomFade()),
              Positioned(
                top: 24,
                left: 20,
                right: 20,
                child: _VideoPrompt(job: widget.job),
              ),
              Positioned(
                top: 86,
                right: 18,
                child: _SoundButton(
                  isMuted: _isMuted,
                  onPressed: () {
                    setState(() => _isMuted = !_isMuted);
                  },
                ),
              ),
              JobInfoOverlay(job: widget.job, viewModel: feed),
              Positioned(
                right: 16,
                bottom: 30,
                child: Column(
                  children: [
                    JobActionButton(
                      icon: Icons.ios_share_rounded,
                      label: 'Distribuie',
                      onTap: () => _snack(context, 'Linkul a fost copiat!'),
                    ),
                    const SizedBox(height: 14),
                    JobActionButton(
                      icon: applied ? Icons.check_rounded : Icons.bolt_rounded,
                      label: applied ? 'Trimis' : 'Aplica',
                      filled: true,
                      onTap: () {
                        feed.applyTo(widget.job);
                        showApplyCelebration(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _SoundButton extends StatelessWidget {
  const _SoundButton({required this.isMuted, required this.onPressed});

  final bool isMuted;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isMuted ? 'Porneste sunetul' : 'Opreste sunetul',
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.48),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.24),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: AssetOrIcon(
              assetPath: isMuted
                  ? BrandAssets.soundOffIconAsset
                  : BrandAssets.soundOnIconAsset,
              fallbackIcon: isMuted
                  ? Icons.volume_off_rounded
                  : Icons.volume_up_rounded,
              size: 23,
            ),
          ),
        ),
      ),
    );
  }
}

class _VideoPrompt extends StatelessWidget {
  const _VideoPrompt({required this.job});

  final JobPost job;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.videocam_rounded),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            job.videoPrompt,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              shadows: [Shadow(color: Colors.black, blurRadius: 8)],
            ),
          ),
        ),
      ],
    );
  }
}

class _VideoBottomFade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.48, 1.0],
          colors: [
            Colors.black.withValues(alpha: 0.10),
            Colors.black.withValues(alpha: 0.18),
            Colors.black.withValues(alpha: 0.78),
          ],
        ),
      ),
    );
  }
}
