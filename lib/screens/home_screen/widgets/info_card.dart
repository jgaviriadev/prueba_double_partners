import 'package:flutter/material.dart';

import '../../../models/user.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key, 
    required this.user,
  }) : super(key: key);
  
  final User user;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: const Color(0xFFD0EDF2),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('INFORMACIÓN PERSONAL'),
            const SizedBox(height: 20,),
            Row(
              children:[
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 50,
                ),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Nombre:  '),
                        Text(user.name),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Apellido:  '),
                        Text(user.lastname),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Address data = user.addresses[index];
                  return Row(
                    children: [
                      Text('Dirección ${index+1}:  '),
                      Text(data.address),
                    ],
                  );
                }, 
                separatorBuilder: (context, index) => const Divider(),
                itemCount: user.addresses.length
              ),
            )
          ],
        ),
      ),
    );
  }
}