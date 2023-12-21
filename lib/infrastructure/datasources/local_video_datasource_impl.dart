import 'package:tik_tok_clon/domain/datasources/video_posts_datasource.dart';
import 'package:tik_tok_clon/domain/entities/video_post.dart';
import 'package:tik_tok_clon/infrastructure/models/local_video_model.dart';
import 'package:tik_tok_clon/shared/data/local_video_post.dart';

class LocalVideoDatasource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
