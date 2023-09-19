import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas_2/ui/tampil_data.dart';

class DataMahasiswa {
  String nama;
  String nim;
  int tahunLahir;
  int umur;

  DataMahasiswa(
      {required this.nama,
      required this.nim,
      required this.tahunLahir,
      required this.umur});
}

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController tahunLahirController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Input Data"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama harus diisi';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: nimController,
                    decoration: InputDecoration(labelText: 'NIM'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'NIM harus diisi';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: tahunLahirController,
                    decoration: InputDecoration(labelText: 'Tahun Lahir'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tahun Lahir harus diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        DateTime now = DateTime.now();
                        int umur =
                            now.year - int.parse(tahunLahirController.text);
                        DataMahasiswa mahasiswa = DataMahasiswa(
                          nama: namaController.text,
                          nim: nimController.text,
                          tahunLahir: int.parse(tahunLahirController.text),
                          umur: umur,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TampilData(mahasiswa: mahasiswa),
                          ),
                        );
                      }
                    },
                    child: Text('Simpan'),
                  ),
                ],
              )),
        ));
  }
}
