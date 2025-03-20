import 'package:ficha_app_01/widgets/criar_widgets/Criar_classe_widget.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Page'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Classe'),
            Tab(text: 'Subclasse'),
            Tab(text: 'Raça'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CriarClasseWidget(),
          Center(child: Text('Content for Tab 2')),
          Center(child: Text('Content for Tab 3')),
        ],
      ),
    );
  }
}