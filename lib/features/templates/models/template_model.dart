enum TemplateCategory {
  reel('Reel'),
  ad('Ad'),
  intro('Intro');

  final String displayName;
  const TemplateCategory(this.displayName);
}

class VideoTemplate {
  final String id;
  final String name;
  final TemplateCategory category;
  final String previewUrl;
  final String description;
  final DateTime createdAt;

  VideoTemplate({
    required this.id,
    required this.name,
    required this.category,
    required this.previewUrl,
    required this.description,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  VideoTemplate copyWith({
    String? id,
    String? name,
    TemplateCategory? category,
    String? previewUrl,
    String? description,
    DateTime? createdAt,
  }) {
    return VideoTemplate(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      previewUrl: previewUrl ?? this.previewUrl,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
