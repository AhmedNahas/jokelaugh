class Joke {
  int? id;
  String? category;
  String? type;
  String? joke;
  Flags? flags;
  bool? safe;
  String? lang;

  Joke(
      {this.id,
      this.category,
      this.type,
      this.joke,
      this.flags,
      this.safe,
      this.lang});

  Joke.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    type = json['type'];
    joke = json['joke'];
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    safe = json['safe'];
    lang = json['lang'];
  }
}

class Flags {
  bool? nsfw;
  bool? religious;
  bool? political;
  bool? racist;
  bool? sexist;
  bool? explicit;

  Flags.fromJson(Map<String, dynamic> json) {
    nsfw = json['nsfw'];
    religious = json['religious'];
    political = json['political'];
    racist = json['racist'];
    sexist = json['sexist'];
    explicit = json['explicit'];
  }
}
