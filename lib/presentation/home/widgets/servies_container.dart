import 'package:flutter/material.dart';

class servies_container extends StatelessWidget {
  const servies_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0,bottom: 20,left: 30,right: 30),
      child: Container(
        height: 100,
        decoration: BoxDecoration(border:Border.all(color: Colors.black,),borderRadius:BorderRadius.circular(20), gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 255, 193, 100), Colors.white],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ), ),
        child:Column(
          children: [
             Row(
               children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      Text('Get Services at Home',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      Text('Beauty services, delivered to your doorstep',style: TextStyle(fontSize: 10
                      ,color: Colors.black),
                      ),
                      TextButton(onPressed: (){}, child: Container(height: 25,width: 90,decoration:  BoxDecoration(borderRadius:BorderRadius.circular(5), color: Colors.white
                              ), 
                              child: Center(child: Text('View Services',style: TextStyle(fontSize: 10,color: Colors.black),)),
                              ),)
                    ],
                  ),
                ),
                SizedBox(width: 20,), 
                 Image.asset('assets/img/servies.png'),
               ],
             ),
          ]
        ),
      ),
    );
  }
}
