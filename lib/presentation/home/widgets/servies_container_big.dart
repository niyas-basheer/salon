import 'package:flutter/material.dart';

class servies_container_Big extends StatelessWidget {
  const servies_container_Big({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 208, 153, 218),
              const Color.fromARGB(255, 242, 167, 255),
              const Color.fromARGB(255, 208, 153, 218),
            ],
            stops: [0.0, 0.5, 1.0], 
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(children: [
          Stack( 
            children: [
              Positioned(right: 0, child: Image.asset('assets/img/services_home_big.png',height: 200,)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/img/logo_black.png'),
                        SizedBox(width: 5,), 
                        Text(
                      'Spotbelt',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                      ],
                    ),
                    SizedBox(height: 100,),
                    Text(
                      'Get Services at Home',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Beauty services, delivered to your doorstep',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              
            ],
          ),
        ]),
      ),
    );
  }
}
