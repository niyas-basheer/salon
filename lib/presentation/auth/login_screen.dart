import 'package:flutter/material.dart';
import 'package:salon_app/presentation/auth/otp_screen.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/image 47 (1).png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered Content
          Center(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(400),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome to",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SpotBelt",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                       Text(
                        "!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                       Image.asset('assets/img/icon_logo.png')
                    ],
                  ),
                  const SizedBox(height: 15),
                
                  Text(
                    "Effortless beauty at your fingertips.\n"
                    "Book trusted professionals, explore reviews,\n"
                    "and enjoy convenience your way",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Phone Number Input Field
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixText: "91 ",
                      prefixStyle: TextStyle(color: Colors.black),
                      labelText: "Enter Your Phone No.",
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Login Icon/Button
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      ), 
                    child: ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber,elevation: 0),
                      onPressed: () { 
                         Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => OtpScreen()),
                                    );
                      },
                      
                      child: Center(
                        child: Text("Get Started", style: TextStyle(
                          fontSize: 20,
                          fontWeight:FontWeight.w400, 
                          color: Colors.white,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
