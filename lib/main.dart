import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clon/config/theme/app_theme.dart';
import 'package:tik_tok_clon/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tik_tok_clon/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tik_tok_clon/presentation/screens/discover/discover_screen.dart';
import 'package:tik_tok_clon/presentation/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videoReposiroty: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
        title: 'Tik Tok Clon',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
