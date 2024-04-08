import 'package:dio/dio.dart';
import 'package:rick_and_morti/data/models/episode/episode.dart';

class EpisodeRepo {
  final Dio dio;
  EpisodeRepo({required this.dio});

  @override
  Future<List<Episode>> getEpisodes(String? series) async {
    final response =
        await dio.get('https://rickandmortyapi.com/api/episode/$series');
    List<Episode> episodes;
    if (series!.contains(',')) {
      final List<dynamic> data = response.data;

      episodes = data.map((e) => Episode.fromJson(e)).toList();
    } else {
      final Map<String, dynamic> data = response.data;
      final episode = Episode.fromJson(data);
      episodes = [episode];
    }
    return episodes;
  }
}
