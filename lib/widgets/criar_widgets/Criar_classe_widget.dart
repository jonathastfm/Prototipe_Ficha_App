import 'package:flutter/material.dart';
import '../../classes/DndClass.dart';

class CriarClasseWidget extends StatefulWidget {
  const CriarClasseWidget({super.key});

  @override
  _CriarClasseWidgetState createState() => _CriarClasseWidgetState();
}

class _CriarClasseWidgetState extends State<CriarClasseWidget> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _hpDiceController = TextEditingController();
  final TextEditingController _proficienciasController = TextEditingController();
  final TextEditingController _habilidadesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Classe'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _nextStep,
        onStepCancel: _previousStep,
        steps: _buildSteps(),
      ),
    );
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: Text('Informações Básicas'),
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome da Classe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome da classe';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Atributos'),
        content: Column(
          children: [
            TextFormField(
              controller: _hpDiceController,
              decoration: InputDecoration(labelText: 'HP Dice'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o HP Dice';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _proficienciasController,
              decoration: InputDecoration(labelText: 'Proficiências (separadas por vírgula)'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira as proficiências';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _habilidadesController,
              decoration: InputDecoration(labelText: 'Habilidades (separadas por vírgula)'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira as habilidades';
                }
                return null;
              },
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Confirmação'),
        content: Text('Revise as informações e confirme a criação da classe.'),
        isActive: _currentStep >= 2,
      ),
    ];
  }

  void _nextStep() {
    if (_currentStep < _buildSteps().length - 1) {
      setState(() {
        _currentStep += 1;
      });
    } else {
      if (_formKey.currentState?.validate() ?? false) {
        // Process the data
        DnDClass novaClasse = DnDClass(
          nome: _nomeController.text,
          descricao: _descricaoController.text,
          hpDice: int.parse(_hpDiceController.text),
          proficiencias: _proficienciasController.text.split(',').map((e) => e.trim()).toList(),
          habilidades: _habilidadesController.text.split(',').map((e) => e.trim()).toList(),
        );
        // Aqui você pode salvar ou usar a novaClasse conforme necessário
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }
}