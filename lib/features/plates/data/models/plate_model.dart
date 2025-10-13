class Plate {
  final String id;
  final String plateNo;
  final int type;
  final String province;
  final String owner;
  final String company;
  final String model;
  final List<String> images;
  final String link;
  final dynamic author;
  final DateTime createdAt;
  DateTime? cachedAt;

  Plate({
    required this.id,
    required this.plateNo,
    required this.type,
    required this.province,
    required this.owner,
    required this.company,
    required this.model,
    required this.images,
    required this.link,
    required this.author,
    required this.createdAt,
    this.cachedAt,
  });

  factory Plate.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String id,
        'plateNo': String plateNo,
        'type': int type,
        'province': String province,
        'owner': String owner,
        'company': String company,
        'model': String model,
        'images': List<dynamic> images,
        'link': String link,
        'author': var author,
        'createdAt': String createdAt,
      } =>
        Plate(
          id: id,
          plateNo: plateNo,
          type: type,
          province: province,
          owner: owner,
          company: company,
          model: model,
          images: images.map((e) => e as String).toList(),
          link: link,
          author: author,
          createdAt: DateTime.parse(createdAt),
          cachedAt: json['cachedAt'] != null && json['cachedAt'].isNotEmpty
              ? DateTime.parse(json['cachedAt'])
              : DateTime.now(),
        ),
      _ => throw const FormatException('Failed to load plate.'),
    };
  }

  dynamic operator [](String key) {
    switch (key) {
      case 'province':
        return province;
      case 'company':
        return company;
      case 'model':
        return model;
      case 'type':
        return type;
      case 'images':
        return images;
      case 'link':
        return link;
      case 'owner':
        return owner;
      case 'cachedAt':
        return cachedAt;
      default:
        throw ArgumentError('Unknown key: $key');
    }
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'plateNo': plateNo,
    'type': type,
    'province': province,
    'owner': owner,
    'company': company,
    'model': model,
    'images': images,
    'link': link,
    'author': author,
    'createdAt': createdAt.toIso8601String(),
    'cachedAt': cachedAt!.toIso8601String(),
  };
}
