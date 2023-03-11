import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../models/validation_item.dart';
import '../../../providers/dvp_provider.dart';
import '../../../utils/utils.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
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
              controller: dob.value!=null? Utils.controllerDob(dob.value!): null,
              decoration: InputDecoration(
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
              physics: const NeverScrollableScrollPhysics(),
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
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => context.read<DVPProvider>().removeAddress(),
                child: Row(
                  children: const [
                    Icon(Icons.remove),
                    Text('Eliminar')
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => context.read<DVPProvider>().chnageNumberAddress(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.add),
                    Text('Agregar')
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if(context.read<DVPProvider>().validateForm()){
                context.read<DVPProvider>().onRegister();
                Utils.showToast(context, Colors.greenAccent, 'Registro exitoso!');
                context.go('/home');
              } else {
                Utils.showToast(context, Colors.redAccent, 'Hay campos vacios');
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
        )
      ],
    );
  }
}