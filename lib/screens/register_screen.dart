import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(2023, 03, 09);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
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
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person_outline),
                            labelText: 'Nombre',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              //onatan gaviriaborderSide: BorderSide.none 
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF2F2F2)
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            //errorText: 'error',
                            prefixIcon: const Icon(Icons.person_outline),
                            labelText: 'Apellido',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            
                            filled: true,
                            fillColor: const Color(0xFFF2F2F2)
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          initialValue: 'holaa',
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.calendar_month_outlined),
                            labelText: "Fecha de nacimiento",
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
                              initialDate: date, 
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
                            );
                          },
                        ),
                        const SizedBox(height: 20,),
                        const Text('Información de contacto'),
                        const Divider(),
                        const SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                            //errorText: 'error',
                            prefixIcon: const Icon(Icons.house_outlined),
                            labelText: 'Dirección',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            
                            filled: true,
                            fillColor: const Color(0xFFF2F2F2)
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(Icons.add),
                            Text('Agregar otra dirección')
                          ],
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50), // <-- Radius
                              ),
                            ),
                            child: const Text('Registrarse'),
                          ),
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