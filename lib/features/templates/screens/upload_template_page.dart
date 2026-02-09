import 'package:flutter/material.dart';
import '../models/template_model.dart';
import '../state/template_repository.dart';

class UploadTemplatePage extends StatefulWidget {
  const UploadTemplatePage({super.key});

  @override
  State<UploadTemplatePage> createState() => _UploadTemplatePageState();
}

class _UploadTemplatePageState extends State<UploadTemplatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _previewUrlController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _repository = TemplateRepository();

  TemplateCategory _selectedCategory = TemplateCategory.reel;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _previewUrlController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String? _validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Preview URL is required';
    }

    final urlPattern = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlPattern.hasMatch(value.trim())) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final template = VideoTemplate(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      category: _selectedCategory,
      previewUrl: _previewUrlController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    _repository.add(template);

    await Future.delayed(const Duration(milliseconds: 300));

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Template')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Text(
              'Template Details',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Template Name',
                hintText: 'Enter template name',
              ),
              textInputAction: TextInputAction.next,
              validator: (value) => _validateNotEmpty(value, 'Template name'),
              enabled: !_isSubmitting,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<TemplateCategory>(
              value: _selectedCategory,
              decoration: const InputDecoration(labelText: 'Category'),
              items:
                  TemplateCategory.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.displayName),
                    );
                  }).toList(),
              onChanged:
                  _isSubmitting
                      ? null
                      : (value) {
                        if (value != null) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        }
                      },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _previewUrlController,
              decoration: const InputDecoration(
                labelText: 'Preview URL',
                hintText: 'https://example.com/preview.jpg',
              ),
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
              validator: _validateUrl,
              enabled: !_isSubmitting,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Brief description of the template',
                alignLabelWithHint: true,
              ),
              maxLines: 3,
              maxLength: 120,
              textInputAction: TextInputAction.done,
              validator: (value) => _validateNotEmpty(value, 'Description'),
              enabled: !_isSubmitting,
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _handleSubmit,
                child:
                    _isSubmitting
                        ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                        : const Text('Upload Template'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
