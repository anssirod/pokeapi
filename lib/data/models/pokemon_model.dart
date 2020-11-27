class Pokemon {
  String name, url;
  int id, baseExperience, height, weight;
  Pokemon(
      {this.name,
      this.url,
      this.baseExperience,
      this.height,
      this.id,
      this.weight});

  factory Pokemon.fromJson(Map<String, dynamic> parsedJson) {
    return Pokemon(
        name: parsedJson['name'],
        url: parsedJson['url'],
        baseExperience: parsedJson['base_experience'],
        height: parsedJson['height'],
        id: parsedJson['id'],
        weight: parsedJson['weight']);
  }
}
