import 'package:flutter/material.dart';
import '../state/template_repository.dart';
import '../widgets/template_card.dart';
import '../widgets/empty_state.dart';
import 'upload_template_page.dart';

class TemplateListPage extends StatefulWidget {
  const TemplateListPage({super.key});

  @override
  State<TemplateListPage> createState() => _TemplateListPageState();
}

class _TemplateListPageState extends State<TemplateListPage> {
  final _repository = TemplateRepository();

  @override
  Widget build(BuildContext context) {
    final templates = _repository.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text('Templates')),
      body:
          templates.isEmpty
              ? const EmptyState()
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: templates.length,
                  itemBuilder: (context, index) {
                    return TemplateCard(template: templates[index]);
                  },
                ),
              ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (context) => const UploadTemplatePage()),
          );

          if (result == true && mounted) {
            setState(() {});
          }
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        icon: const Icon(Icons.add),
        label: const Text('Upload'),
      ),
    );
  }
}
