import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_double_partners/utils/utils.dart';

import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          TextAppBar(text: 'Registro')
        ],
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
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
                Utils.textRandom,
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
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: RegisterForm(),
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

