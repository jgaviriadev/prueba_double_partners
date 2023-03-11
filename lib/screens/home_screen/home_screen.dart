import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_double_partners/providers/dvp_provider.dart';
import 'package:prueba_double_partners/screens/home_screen/widgets/widgets.dart';

import '../../models/user.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        actions: const[
          TextAppBar(text: 'Inicio')
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.85,
          //height: 200,
          child: Selector<DVPProvider, User?>(
            selector: (_, v) => v.user,
            builder: (context, User? user, _) {
              if(user!=null){
                return InfoCard(user: user,);
              } else {
                return Container();
              }
            }
          ),
        ),
      )
    );
  }
}