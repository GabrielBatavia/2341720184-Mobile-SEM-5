import 'package:flutter/material.dart';
import 'basic_widgets/text_widget.dart';
import 'basic_widgets/image_widget.dart';
import 'basic_widgets/loading_cupertino.dart';
import 'basic_widgets/fab_widget.dart';
import 'basic_widgets/scaffold_widget.dart';
import 'basic_widgets/dialog_widget.dart';
import 'basic_widgets/textfield_widget.dart';
import 'basic_widgets/datepicker_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Widgets',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const DemoMenuPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DemoMenuPage extends StatelessWidget {
  const DemoMenuPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum 5')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Langkah 3: Scaffold Widget'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScaffoldDemoPage(title: 'My Increment App')),
            ),
          ),
          ListTile(
            title: const Text('Langkah 4: Dialog Widget'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DialogDemoPage()),
            ),
          ),
          ListTile(
            title: const Text('Langkah 5: TextField Widget'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TextFieldDemoPage()),
            ),
          ),
          ListTile(
            title: const Text('Langkah 6: Date Picker'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DatePickerDemoPage(title: 'Contoh Date Picker')),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Text Widget'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Scaffold(
                  appBar: AppBar(title: const Text('Text Widget')),
                  body: const Center(child: MyTextWidget()),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Image Widget'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Scaffold(
                  appBar: AppBar(title: const Text('Image Widget')),
                  body: const Center(child: MyImageWidget()),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Cupertino Button & Loading'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoadingCupertinoPage()),
            ),
          ),
          ListTile(
            title: const Text('FAB Demo'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FabDemoPage()),
            ),
          ),
        ],
      ),
    );
  }
}
