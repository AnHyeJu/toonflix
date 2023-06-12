import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.titleId,
  });

  final WebtoonEpisodeModel episode;
  final String titleId;

  onButtonTap() async {
    int no = int.parse(episode.id) + 1;
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$titleId&no=$no");
    await launchUrl(url); //그냥 url 문자열 넣는것도 쌉가
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 8),
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
            )
          ],
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          border: Border.all(color: Colors.green.shade400, width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade900,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
