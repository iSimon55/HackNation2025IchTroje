class CategoryInfo {
  final String id;
  final String title;
  final String emoji;
  final String description;
  final List<CategorySection> sections;

  CategoryInfo({
    required this.id,
    required this.title,
    required this.emoji,
    required this.description,
    required this.sections,
  });
}

class CategorySection {
  final String title;
  final String content;
  final String? icon;

  CategorySection({
    required this.title,
    required this.content,
    this.icon,
  });
}
