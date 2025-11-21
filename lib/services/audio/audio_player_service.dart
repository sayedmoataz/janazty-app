import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> play(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
    } catch (e) {
      throw Exception('Failed to play audio: $e');
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  Stream<Duration?> get positionStream => _audioPlayer.positionStream;

  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  bool get playing => _audioPlayer.playing;

  Duration? get duration => _audioPlayer.duration;

  Duration? get position => _audioPlayer.position;

  void dispose() {
    _audioPlayer.dispose();
  }
}
