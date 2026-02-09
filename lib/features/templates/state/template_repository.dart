import '../models/template_model.dart';

class TemplateRepository {
  static final TemplateRepository _instance = TemplateRepository._internal();
  factory TemplateRepository() => _instance;
  TemplateRepository._internal();

  final List<VideoTemplate> _templates = [];

  List<VideoTemplate> getAll() {
    return List.unmodifiable(_templates);
  }

  void add(VideoTemplate template) {
    _templates.insert(0, template);
  }

  VideoTemplate? getById(String id) {
    try {
      return _templates.firstWhere((template) => template.id == id);
    } catch (_) {
      return null;
    }
  }

  void remove(String id) {
    _templates.removeWhere((template) => template.id == id);
  }

  void clear() {
    _templates.clear();
  }

  int get count => _templates.length;
}
