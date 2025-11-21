import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../services/audio/audio_player_service.dart';
import '../../domain/entity/prayer_guide_entity.dart';

class PrayerGuideCard extends StatefulWidget {
  final PrayerGuideEntity guide;

  const PrayerGuideCard({required this.guide, super.key});

  @override
  State<PrayerGuideCard> createState() => _PrayerGuideCardState();
}

class _PrayerGuideCardState extends State<PrayerGuideCard> {
  final AudioPlayerService _audioPlayer = AudioPlayerService();
  bool _isPlaying = false;
  bool _isExpanded = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (widget.guide.audioUrl == null) return;

    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await _audioPlayer.play(widget.guide.audioUrl!);
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.guide.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  if (widget.guide.audioUrl != null)
                    IconButton(
                      onPressed: _togglePlayPause,
                      icon: Icon(
                        _isPlaying ? Icons.pause_circle : Icons.play_circle,
                        color: AppColors.accent,
                        size: 32,
                      ),
                    ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.guide.textContent,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.8,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
