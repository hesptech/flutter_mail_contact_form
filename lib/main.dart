//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
//import 'package:http/http.dart' as http;
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mail_contact_form/card_details_mail_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  /* final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController(); */
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ElevatedButton(
            child: const Text('Modal Bottom Sheet Up'),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context, 
                builder: (BuildContext context) {

                  return Column(
                    children: const [
                      SizedBox(height: 40.0,),
                      CardDetailsMailForm(),
                    ]
                  );


                  //return const CardDetailsMailForm();
      
      
                  /* return SizedBox(
                    //height: 200,
                    child: Center(
                      child: ElevatedButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                      ),
                    ),
                  ); */
                }
              );
            }, 
          ),
        ),
      ),
    );
    
    
    //return CardDetailsMailForm();

    /* return Scaffold(
      backgroundColor: const Color(0xfff5f5fd),
      body: Center(
        child: Container(
          height: 450,
          width: 400,
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Colors.grey[300]!)
              ]),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Contact Us',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Required*';
                    } else if (!EmailValidator.validate(email)) {
                      return 'Please enter a valid Email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(hintText: 'Message'),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 45,
                  width: 110,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff151534),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await sendEmail(
                            nameController.value.text,
                            emailController.value.text,
                            messageController.value.text);
                        /* ScaffoldMessenger.of(context).showSnackBar(
                          response == 200
                              ? const SnackBar(
                                  content: Text('Message Sent!'),
                                  backgroundColor: Colors.green)
                              : const SnackBar(
                                  content: Text('Failed to send message!'),
                                  backgroundColor: Colors.red),
                        ); */
                        print(response);
                        if ( response == 200 ) {
                          //const Text('Message Sent!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red),);
                          print('success');
                          print(response);
                        } else {
                          //const Text('Failed to send message!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red),);
                          print('failure');
                          print(response);
                        }
                        nameController.clear();
                        emailController.clear();
                        messageController.clear();
                      }
                    },
                    child: const Text('Send', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); */
  }
}

/* Future sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': 'service_m6t6vgr',
        'template_id': 'template_wz3p33d',
        'user_id': 'xg_GS8-YofnjsS8Jb',
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message
        }
      }));
  return response.body;
} */