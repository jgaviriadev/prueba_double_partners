import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_double_partners/providers/dvp_provider.dart';

import '../../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<DVPProvider, User?>(
        selector: (_, v) => v.user,
        builder: (context, User? user, _) {
          if(user!=null){
            return Container(
              color: Colors.amber,
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                itemCount: user.addresses.length,
                itemBuilder: (context, index) {
                  Address add = user.addresses[index];
                  return Text(add.address);
                },
              )
            );
          } else {
            return Container();
          }
          
        }
      ),
    );
  }
}