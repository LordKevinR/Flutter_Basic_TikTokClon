import 'package:flutter/material.dart';
import 'package:tik_tok_clon/domain/entities/video_post.dart';
import 'package:tik_tok_clon/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoReposiroty;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoReposiroty});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoReposiroty.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
