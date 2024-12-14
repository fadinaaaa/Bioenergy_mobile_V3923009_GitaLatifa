import 'package:flutter/material.dart';

class LayananPage extends StatefulWidget {
  const LayananPage({super.key});

  @override
  _LayananPageState createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedCategory;
  String? _selectedAddress;
  final TextEditingController _dateController = TextEditingController();

  final List<Map<String, String>> _addresses = [
    {'id': '1', 'name': 'Jl. Mawar No. 12'},
    {'id': '2', 'name': 'Jl. Melati No. 8'},
    {'id': '3', 'name': 'Jl. Anggrek No. 3'},
  ];

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Kategori: $_selectedCategory');
      print('Alamat: $_selectedAddress');
      print('Tanggal: ${_dateController.text}');
    }
  }

  Widget _buildLayananContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Layanan Pemasangan Biomassa',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A148C),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Rumah Tangga', child: Text('Rumah Tangga')),
                  DropdownMenuItem(value: 'Industri', child: Text('Industri')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih kategori';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: _addresses
                    .map((address) => DropdownMenuItem(
                          value: address['id'],
                          child: Text(address['name']!),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAddress = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih alamat';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text =
                          '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih tanggal';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9575CD),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Ajukan Permintaan',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan'),
        backgroundColor: const Color(0xFF4A148C),
      ),
      body: _buildLayananContent(),
    );
  }
}
