class Character {
  final String name;
  final String server;
  final String job;
  final String fame;
  final String? buffScore;
  final String? buffScore3;
  final String? buffScore4;
  final String? ozma;

  Character({
    required this.name,
    required this.server,
    required this.job,
    required this.fame,
    this.buffScore,
    this.buffScore3,
    this.buffScore4,
    this.ozma,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      server: json['server'],
      job: json['job'],
      fame: json['fame'],
      buffScore: json['buffScore'],
      buffScore3: json['buffScore3'],
      buffScore4: json['buffScore4'],
      ozma: json['ozma'],
    );
  }

  bool get isBuffer => buffScore != null;
  bool get isDealer => ozma != null;
}
