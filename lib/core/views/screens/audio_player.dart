import 'package:electronic_books/core/models/content.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../constants/dimensions.dart';

class AppAudioPlayer extends StatefulWidget {
  AppAudioPlayer({required this.content});

  String? audioUrl;
  Content content;

  @override
  _AppAudioPlayerState createState() => _AppAudioPlayerState();
}

class _AppAudioPlayerState extends State<AppAudioPlayer> {
  late AudioPlayer _player;

  @override
  void initState() {
    widget.audioUrl = widget.content.media_url;
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    await _player.setAudioSource(AudioSource.uri(Uri.parse(widget.audioUrl!)));
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.indigo[50],
          body: Container(
            height: Dimensions.height(context),
            width: Dimensions.width(context),
            padding: EdgeInsets.all(Dimensions.width(context) * 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    height: Dimensions.width(context)*0.8,
                    width: Dimensions.width(context)*0.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.imagesOmerBawazir),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: Dimensions.width(context) * 0.1,
                ),
                TextStyleNoor(
                  text: "عنوان الدرس: \n ${widget.content.title!}",
                  size: 18,
                  color: Colors.indigo,
                ),
                SizedBox(
                  height: Dimensions.width(context) * 0.1,
                ),
                Container(
                  width: Dimensions.width(context) - 40,
                  decoration: BoxDecoration(
                      // color: Colors.indigo[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: StreamBuilder<Duration?>(
                    stream: _player.durationStream,
                    builder: (context, snapshot) {
                      final duration = snapshot.data ?? Duration.zero;
                      return StreamBuilder<Duration>(
                        stream: _player.positionStream,
                        builder: (context, snapshot) {
                          String twoDigits(int n) =>
                              n.toString().padLeft(2, '0');
                          final minutes =
                              twoDigits(duration.inMinutes.remainder(60));
                          final seconds =
                              twoDigits(duration.inSeconds.remainder(60));
                          var position = snapshot.data ?? Duration.zero;
                          if (position > duration) {
                            position = duration;
                          }
                          return Column(
                            children: [
                              SeekBar(
                                duration: duration,
                                position: position,
                                onChangeEnd: (newPosition) {
                                  _player.seek(newPosition);
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleNoor(
                                    text: _formatDuration(position),
                                    color: Colors.indigo,
                                  ),
                                  TextStyleNoor(
                                    text: _formatDuration(duration),
                                    color: Colors.indigo,
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                ControlButtons(_player),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}

class SeekBar extends StatelessWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar({
    super.key,
    required this.duration,
    required this.position,
    this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: duration.inMilliseconds.toDouble(),
      value: position.inMilliseconds
          .toDouble()
          .clamp(0.0, duration.inMilliseconds.toDouble()),
      onChanged: (value) {
        if (onChangeEnd != null) {
          onChangeEnd!(Duration(milliseconds: value.round()));
        }
      },
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing ?? false;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                child: CircularProgressIndicator(),
              );
            } else if (playing) {
              return IconButton(
                icon: Icon(
                  Icons.pause,
                  color: Colors.deepPurple[400],
                ),
                iconSize: 35.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.deepPurple[400],
                ),
                iconSize: 35.0,
                onPressed: player.play,
              );
            }
          },
        ),
        IconButton(
          icon: Icon(
            Icons.stop,
            color: Colors.deepPurple[400],
          ),
          iconSize: 35.0,
          onPressed: player.stop,
        ),
      ],
    );
  }
}
