import 'package:flutter/material.dart';

class WidgetExample extends StatefulWidget {
  const WidgetExample({super.key});

  @override
  State<WidgetExample> createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetExample> {
  bool isChecked = false;
  String selectedGender = 'Laki-laki';
  final TextEditingController textController = TextEditingController();
  Color draggableColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contoh Berbagai Widget")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // BASIC WIDGETS
              const Text("Halo Flutter!", style: TextStyle(fontSize: 24)),
              const Icon(Icons.favorite, color: Colors.red),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                color: Colors.amberAccent,
                child: const Text("Ini adalah Container"),
              ),
              const Divider(),

              // INPUT WIDGETS
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Masukkan nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                title: const Text("Saya setuju"),
                value: isChecked,
                onChanged: (value) {
                  setState(() => isChecked = value ?? false);
                },
              ),
              Row(
                children: [
                  const Text("Gender: "),
                  Radio(
                    value: 'Laki-laki',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() => selectedGender = value!);
                    },
                  ),
                  const Text("Laki-laki"),
                  Radio(
                    value: 'Perempuan',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() => selectedGender = value!);
                    },
                  ),
                  const Text("Perempuan"),
                ],
              ),
              const Divider(),

              // LAYOUT WIDGETS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Ini Row"),
                  Icon(Icons.star),
                ],
              ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 100, height: 100, color: Colors.blue),
                  const Text("Di atas Container", style: TextStyle(color: Colors.white)),
                ],
              ),
              const Divider(),

              // INTERACTIVE WIDGETS
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Container diklik!")),
                  );
                },
                child: Container(
                  color: Colors.teal,
                  padding: const EdgeInsets.all(16),
                  child: const Text("Klik aku!", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),

              Draggable<Color>(
                data: draggableColor,
                feedback: Container(
                  width: 50,
                  height: 50,
                  color: draggableColor.withOpacity(0.5),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  color: draggableColor,
                ),
              ),
              const SizedBox(height: 10),
              DragTarget<Color>(
                onAccept: (color) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Warna diterima!")),
                  );
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(child: Text("Drag ke sini")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
