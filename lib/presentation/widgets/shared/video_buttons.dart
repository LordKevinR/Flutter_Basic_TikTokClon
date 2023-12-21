import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_clon/config/helpers/human_formats.dart';
import 'package:tik_tok_clon/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInLeft(
          child: FadeInDown(
            child: _CustomIconButton(
              color: Colors.red,
              value: video.likes,
              iconData: Icons.favorite,
            ),
          ),
        ),
        const SizedBox(height: 20),
        BounceInDown(
          child: _CustomIconButton(
            value: video.views,
            iconData: Icons.remove_red_eye_outlined,
          ),
        ),
        const SizedBox(height: 20),
        FadeInRight(
          child: SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 3),
            child: const _CustomIconButton(
              value: 0,
              iconData: Icons.play_circle_outline,
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;
  const _CustomIconButton(
      {required this.value, required this.iconData, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 35,
            )),
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
