import 'package:flutter/material.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  final List<String> states = ['Pasado', 'Próximo', 'Cancelado'];
  List<String> selectedStates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Tickets'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: states.map((state) => FilterChip(
                    label: Text(state),
                    selected: selectedStates.contains(state),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedStates.add(state);
                        } else {
                          selectedStates.remove(state);
                        }
                      });
                    })
                    ).toList()
                    ),
          )
        ],
      ),
    );
  }
}
