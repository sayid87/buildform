import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class BuildForm extends StatefulWidget {
  const BuildForm({super.key});

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  List divisi = ["IT", "Marketing", "Finance"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                //key: _emailFieldKey,
                decoration: const InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
                name: 'txt_email',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Email wajib diisi"),
                  FormBuilderValidators.email(
                      errorText: "Format Email Tidak Valid")
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                //key: _emailFieldKey,
                maxLines: 3,
                decoration: const InputDecoration(
                    labelText: "Alamat",
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true),
                name: 'txt_alamat',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Alamat wajib diisi"),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderSlider(
                initialValue: 0,
                min: 0,
                max: 10,
                //key: _emailFieldKey,
                numberFormat: NumberFormat("0 Tahun"),
                decoration: const InputDecoration(
                    labelText: "Lama Pengalaman ",
                    border: InputBorder.none,
                    alignLabelWithHint: true),
                name: 'txt_lama',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.min(1,
                      errorText: "Lama Pengalaman wajib diisi minimal 1 tahun"),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderDateTimePicker(
                inputType: InputType.date,
                //key: _emailFieldKey,
                format: DateFormat("yyyy-MM-dd"),
                // initialDatePickerMode: DatePickerMode.year,
                //timePickerInitialEntryMode: TimePickerEntryMode.inputOnly,
                decoration: const InputDecoration(
                    labelText: "Tanggal Lahir",
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true),
                name: 'txt_tanggal',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Tanggal Lahir wajib diisi"),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                //controller: passwordController,
                //key: _emailFieldKey,
                decoration: const InputDecoration(
                    labelText: "Password", border: OutlineInputBorder()),
                name: 'txt_password',
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Password wajib diisi"),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                //key: _emailFieldKey,
                decoration: const InputDecoration(
                    labelText: "Ulangi Password", border: OutlineInputBorder()),
                name: 'ulangi',
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Password wajib diisi"),
                  (nilai) {
                    if (_formKey.currentState?.fields['txt_password']?.value !=
                        nilai) {
                      return 'Ulangi Password wajib sama dengan Password';
                    }
                    return null;
                  }
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderRadioGroup(
                decoration: const InputDecoration(
                    labelText: 'Jenis Kelamin', border: InputBorder.none),
                name: 'rdo_kelamin',
                validator: FormBuilderValidators.required(
                    errorText: "Jenis Kelamin Wajib dipilih"),
                options: ['Pria', 'Wanita']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderDropdown(
                decoration: const InputDecoration(
                    labelText: 'Divisi',
                    border: InputBorder.none,
                    hintText: "-Pilih-"),
                name: 'cbo_divisi',
                initialValue: "",
                validator: FormBuilderValidators.required(
                    errorText: "Divisi Wajib dipilih"),
                items: divisi
                    .map((lang) => DropdownMenuItem(
                          alignment: AlignmentDirectional.topStart,
                          value: lang,
                          child: Text(lang),
                        ))
                    .toList(growable: false),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderCheckboxGroup(
                decoration: const InputDecoration(
                    labelText: 'Hobi', border: InputBorder.none),
                name: 'chk_hobi',
                // validator: FormBuilderValidators.required(
                //     errorText: "Hobi wajib diisi"),
                validator: (nilai) {
                  if (nilai == null) {
                    return "Hobi wajib diisi";
                  }
                  return null;
                },
                options: ['Makan', 'Tidur', 'Main']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                //key: _emailFieldKey,
                decoration: const InputDecoration(
                    labelText: "Telp", border: OutlineInputBorder()),
                name: 'txt_telp',
                maxLength: 12,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "Telp wajib diisi"),
                  FormBuilderValidators.minLength(8,
                      errorText: "Telp Wajib diisi minimal 8 angka")
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                    onPressed: () {
                      //debugPrint(DateFormat.yMMMd().format(DateTime.now()));
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Berhasil')),
                        );
                      }
                    },
                    child: const Text("Daftar")),
              )
            ],
          ),
        ),
      )),
    );
  }
}
