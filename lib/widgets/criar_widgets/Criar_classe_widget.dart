import 'package:flutter/material.dart';

class CriarClasseWidget extends StatefulWidget {
  @override
  _CriarClasseWidgetState createState() => _CriarClasseWidgetState();
}

class _CriarClasseWidgetState extends State<CriarClasseWidget> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

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
                decoration: InputDecoration(labelText: 'Nome da Classe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome da classe';
                  }
                  return null;
                },
              ),
              TextFormField(
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
              decoration: InputDecoration(labelText: 'Atributo 1'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Atributo 2'),
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