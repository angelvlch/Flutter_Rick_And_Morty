import 'package:dio/dio.dart';
import 'package:rick_and_morti/data/models/episode/episode.dart';

class EpisodeRepo {
  final Dio dio;
  EpisodeRepo({required this.dio});

  @override
  Future<List<Episode>> getEpisodes(String? series) async {
    final response =
        await dio.get('https://rickandmortyapi.com/api/episode/$series');
    final List<dynamic> data = response.data['results'];
    final episodes = data.map((e) => Episode.fromJson(e)).toList();
    return episodes;
    //return Character.fromJson(response.data);
  }
}
