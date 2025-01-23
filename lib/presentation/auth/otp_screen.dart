import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/dashboard.dart';
import 'package:salon_app/presentation/home/home_page.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

// /// Screen for entering OTP code for email verification.
// class OtpScreen extends StatefulWidget {
//   /// Constructor for the [OtpScreen] class.
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   late Timer _timer;
//   int _remainingTime = 0;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     _remainingTime = 30;
//     _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
//       setState(() {
//         if (_remainingTime > 0) {
//           _remainingTime--;
//         } else {
//           // Handle timer expiration, e.g., show a message or perform an action
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           children: [
//             spacing(height: 20),
//             Row(
//               children: [
//                 ActionIconButton(
//                   icon: Icons.arrow_back,
//                   onPressed: () {
//                     navigateBack(context);
//                   },
//                 ),
//               ],
//             ),
//             spacing(height: 20),
//             Text(
//               trans(context, key: 'email_verification'),
//               style: StyleHelper.titleLarge(context)
//                   ?.copyWith(fontWeight: FontWeight.w600),
//             ),
//             spacing(height: 5),
//             Text(
//               trans(context, key: 'please_type_otp_code_that_we_give_you'),
//               style: StyleHelper.titleSmall(context),
//             ),
//             spacing(height: 60),
            // PinCodeTextField(
            //   length: 6,
            //   obscureText: false,
            //   autoFocus: true,
            //   animationType: AnimationType.fade,
            //   keyboardType: TextInputType.number,
            //   pinTheme: PinTheme(
            //     shape: PinCodeFieldShape.box,
            //     borderRadius: BorderRadius.circular(10),
            //     fieldHeight: 50,
            //     fieldWidth: 45,
            //     activeColor: Colors.transparent,
            //     inactiveFillColor: Colors.transparent,
            //     activeFillColor: ColorHelper.grey20Lite(context),
            //     inactiveColor: AppColors.grey30,
            //     selectedColor: AppColors.primary,
            //     selectedFillColor: Colors.transparent,
            //   ),
            //   animationDuration: const Duration(milliseconds: 300),
            //   enableActiveFill: true,
            //   cursorColor: AppColors.primary,
            //   onCompleted: (v) {},
            //   onChanged: (value) {},
            //   appContext: context,
            // ),
//             spacing(height: 10),
//             otpResendWidget(),
//             spacing(height: 40),
//             Row(
//               children: [
//                 Expanded(
//                     child: CustomButton(
//                         title: trans(context, key: 'verify'),
//                         onTap: () {
//                           navigateToScreen(context, const LocationAccessScreen(),
//                               clearPreviousRoutes: true);
//                         },
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         yPadding: 15)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   /// Formats the remaining time into a string.
//   String _formatTime(int time) {
//     String minutes = (time ~/ 60).toString().padLeft(2, '0');
//     String seconds = (time % 60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }

//   /// Widget for showing the OTP resend functionality.
//   Widget otpResendWidget() {
//     if (_remainingTime != 0) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text(
//             trans(context, key: 'resend_on'),
//             style: StyleHelper.titleSmall(context),
//           ),
//           spacing(width: 5),
//           Text(
//             _formatTime(_remainingTime),
//             style: StyleHelper.titleSmall(context)
//                 ?.copyWith(color: ColorHelper.primaryToWhite(context)),
//           ),
//         ],
//       );
//     } else {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           CustomButton(
//               title: trans(context, key: 'resend_otp'),
//               color: Colors.transparent,
//               textColor: AppColors.primary,
//               elevation: 0,
//               lined: true,
//               onTap: () {
//                 _startTimer();
//               })
//         ],
//       );
//     }
//   }
// }



class OtpScreen extends StatefulWidget {
   OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;

  int _remainingTime = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _remainingTime = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
        }
      });
    });
  }

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
                        "SpotBelt",
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
                    "Enter verification codesent to\n"
                    "your phone number******2706,\n", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Phone Number Input Field
                   PinCodeTextField(
              length: 6,
              obscureText: false,
              autoFocus: true,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 45,
                activeColor: Colors.transparent,
                inactiveFillColor: Colors.transparent,
                activeFillColor: ColorHelper.grey20Lite(context),
                inactiveColor: AppColors.grey30,
                selectedColor: AppColors.primary,
                selectedFillColor: Colors.transparent,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              cursorColor: AppColors.primary,
              onCompleted: (v) {},
              onChanged: (value) {},
              appContext: context,
            ),
                   otpResendWidget(),
                   const SizedBox(height: 5),
                  Container(
                    width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.amber
                        ),
                    child: ElevatedButton(
                      onPressed: () {
                         
                          Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => Dashboard()),
                                    );
                      },
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber, fixedSize: Size.fromWidth(150)
                        ,elevation: 0 
                      ),
                      child: Center(
                        child: Text("Verify", style: TextStyle(
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
 String _formatTime(int time) {
    String minutes = (time ~/ 60).toString().padLeft(2, '0');
    String seconds = (time % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
 Widget otpResendWidget() {
    if (_remainingTime != 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text(
            trans(context, key: 'resend_on'),
            style: StyleHelper.titleSmall(context),
          ),
          spacing(width: 5),
          Text(
            _formatTime(_remainingTime),
            style: StyleHelper.titleSmall(context)
                ?.copyWith(color: ColorHelper.primaryToWhite(context)),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text('Din’t Recieve OTP Yet,'),
          TextButton(onPressed: (){}, child:Text('Resend',style: TextStyle(color:Colors.orange),)) 
        ],
      );
    }
  }
}