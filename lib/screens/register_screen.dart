import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:prueba_double_partners/providers/dvp_provider.dart';

import '../models/validation_item.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(2023, 03, 09);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: const[
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Registro',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            ),
          )
        ],
        backgroundColor: const Color(0xFF00C0E4),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFF00C0E4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(left:20, right: 20),
              child: Text(
                'Registrarse',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.only(left:20, right: 20),
              child: Text(
                "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.",
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Información personal'),
                        const Divider(),
                        const SizedBox(height: 10,),
                        Selector<DVPProvider, ValidationItem<String>>(
                          selector: (_, v) => v.name,
                          builder: (context, ValidationItem<String> name, _) {
                            return TextFormField(
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-ZñÑáéíóúÁÉÍÓÚ]'))],
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person_outline),
                                labelText: 'Nombre',
                                errorText: name.error,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF2F2F2)
                              ),
                              onTap: () => name.value?? context.read<DVPProvider>().changeName(""),
                              onChanged: (value) => context.read<DVPProvider>().changeName(value),
                            );
                          }
                        ),
                        const SizedBox(height: 20,),
                        Selector<DVPProvider, ValidationItem<String>>(
                          selector: (_, v) => v.lastName,
                          builder: (context, ValidationItem<String> lastName, _) {
                            return TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person_outline),
                                labelText: 'Apellido',
                                errorText: lastName.error,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF2F2F2)
                              ),
                              onTap: () => lastName.value?? context.read<DVPProvider>().changeLastName(""),
                              onChanged: (value) => context.read<DVPProvider>().changeLastName(value),
                            );
                          }
                        ),
                        const SizedBox(height: 20,),
                        Selector<DVPProvider, ValidationItem<DateTime>>(
                          selector: (_, v) => v.dob,
                          builder: (context, ValidationItem<DateTime> dob, _) {
                            return TextFormField(
                              decoration: InputDecoration(
                                hintText: '${dob.value?.year}/${dob.value?.month}/${dob.value?.day}',
                                prefixIcon: const Icon(Icons.calendar_month_outlined),
                                labelText: "Fecha de nacimiento",
                                errorText: dob.error,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF2F2F2)
                              ),
                              readOnly: true,
                              onTap: () async {
                                showDatePicker(
                                  context: context, 
                                  initialDate: dob.value ==null? DateTime.now() : dob.value!, 
                                  firstDate: DateTime(1900), 
                                  lastDate: DateTime(2100),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Color(0xFF00C0E4),
                                        )
                                      ),
                                      child: child!
                                    );
                                  },
                                ).then((value) {
                                  if(value !=null){
                                    context.read<DVPProvider>().changeDob(value);
                                  } else {
                                    context.read<DVPProvider>().changeDob(DateTime.now());
                                  }
                                });
                              },
                            );
                          }
                        ),
                        const SizedBox(height: 20,),
                        const Text('Información de contacto'),
                        const Divider(),
                        const SizedBox(height: 10,),
                        Selector<DVPProvider, List<ValidationItem<String>>>(
                          selector: (_, v) => v.listAddress,
                          shouldRebuild: (a, b) => true,
                          builder: (BuildContext context, List<ValidationItem<String>> listAddress, _) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: listAddress.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: TextFormField(
                                    key: Key(index.toString()),
                                    decoration: InputDecoration(
                                      errorText: listAddress[index].error,
                                      prefixIcon: const Icon(Icons.house_outlined),
                                      labelText: 'Dirección ${index+1}',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFF2F2F2)
                                    ),
                                    onTap: () => listAddress[index].value?? context.read<DVPProvider>().changeAddress("", index),
                                    onChanged: (value) => context.read<DVPProvider>().changeAddress(value, index),
                                  )
                                );
                              }
                            );
                          }
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () => context.read<DVPProvider>().chnageNumberAddress(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(Icons.add),
                              Text('Agregar otra dirección')
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Selector<DVPProvider, bool>(
                          selector: (_, v) => v.buttonRegister,
                          builder: (context, bool btn, _) {
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(btn){
                                    context.read<DVPProvider>().onRegister();
                                  } else {
                                    context.read<DVPProvider>().showToast(context, 'Algunos campos están vacios', Colors.redAccent);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50), // <-- Radius
                                  ),
                                ),
                                child: const Text('Registrarse'),
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}