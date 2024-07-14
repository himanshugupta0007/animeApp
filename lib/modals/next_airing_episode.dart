import 'package:json_annotation/json_annotation.dart';

part 'next_airing_episode.g.dart';

@JsonSerializable()
class NextAiringEpisode {
  NextAiringEpisode({this.airingAt, this.timeUntilAiring, this.episode});
  int? airingAt;
  int? timeUntilAiring;
  int? episode;

  factory NextAiringEpisode.fromJson(Map<String, dynamic> json) =>
      _$NextAiringEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$NextAiringEpisodeToJson(this);
}
