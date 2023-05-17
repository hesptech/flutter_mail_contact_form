import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

class CardDetailsMailForm extends StatefulWidget {
  const CardDetailsMailForm({super.key});

  @override
  State<CardDetailsMailForm> createState() => _CardDetailsMailFormState();
}

class _CardDetailsMailFormState extends State<CardDetailsMailForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: 450,
          width: 400,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            //vertical: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            //vertical: 20,
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
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      color: const Color(0xFF0BB58C),
                      icon: const Icon(Icons.close), 
                      onPressed: () {
                        Navigator.pop(context);
                      }
                    ),
                  ],
                ), */
                Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: const Color(0xFF0BB58C),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
                const Text(
                  'Schedule Viewing',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // Name
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191), ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191),), 
                    ),                      
                    label: const Center(
                      child: Text("Name"),
                    ),
                    labelStyle: const TextStyle(
                      color: Color(0xFF2E3191),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                // Mail
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191), ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191),), 
                    ),                      
                    //hintText: 'Email',
                    label: const Center(
                      child: Text("Email"),
                    ),
                    //labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Color(0xFF2E3191),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    //hintStyle: kStInputFieldLog
                  ),
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
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191), ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF2E3191),), 
                    ),                      
                    //hintText: 'Message',
                    label: const Center(
                      child: Text("Message"),
                    ),
                    //labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Color(0xFF2E3191),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                /* SizedBox(
                  height: 45,
                  //width: 110,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF0BB58C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await sendEmail(
                            nameController.value.text,
                            emailController.value.text,
                            messageController.value.text);
                        //ScaffoldMessenger.of(context).showSnackBar(
                        //  response == 200
                        //      ? const SnackBar(
                        //          content: Text('Message Sent!'),
                        //          backgroundColor: Colors.green)
                        //      : const SnackBar(
                        //          content: Text('Failed to send message!'),
                        //          backgroundColor: Colors.red),
                        //);
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
                    child: const Text('Submit Request', style: TextStyle( fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold), ),
                  ),
                ), */
                MaterialButton(
                  elevation: 0.0,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8.0) ),
                  color: const Color(0xFF0BB58C),
                  textColor: Colors.white,
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
                  child: const Text('Submit Request', style: TextStyle( fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold), ),
                ),
                const SizedBox(
                  height: 20.0,
                )
                /* ElevatedButton(
                  child: const Text('close'),
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                ), */

              ],
            ),
          ),
        ),

    );
  }
}

Future sendEmail(String name, String email, String message) async {
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
}