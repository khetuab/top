import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/contact/contact.dart';
import 'package:wkumsurh/login/login.dart';
import 'package:wkumsurh/register/register.dart';
import 'package:wkumsurh/support/support.dart';

import 'account/account.dart';
import 'home/home_page.dart';
import 'major/major.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage('assets/logo/logo.png'),
        ),
        const Spacer(),
        screenWidth > 700
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFFC3F9FB),
                        side: BorderSide(color: Color(0xFF00484B), width: 2),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: screenWidth > 700 ? 16 : 12,
                          color: Color(0xFF00484B),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    if (screenWidth > 800)
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFFC3F9fB),
                          side: BorderSide(color: Color(0xFF00484B), width: 2),
                        ),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: screenWidth > 700 ? 16 : 12,
                            color: Color(0xFF00484B),
                          ),
                        ),
                      ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                      },
                      child: Text(
                        'Home',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF00484B),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Major()));
                      },
                      child: Text(
                        'Major',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF00484B),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Contact()));
                      },
                      child: Text(
                        'Contact',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF00484B),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Support()));
                      },
                      child: Text(
                        'Support',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF00484B),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>  UserProfilePage(email: '',)));
                      },
                      child: const Text(
                        'Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF00484B),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : // For smaller screens, display a menu icon with a popup menu
            PopupMenuButton<String>(
                color: Color(0x88C3F9FB),
                icon: Icon(Icons.menu, size: 30, color: Color(0xFF00484B)),
                onSelected: (value) {
                  switch (value) {
                    case 'Login':
                      // Handle Login action
                      break;
                    case 'Sign up':
                      // Handle Sign up action
                      break;
                    case 'Home':
                      // Handle Home action
                      break;
                    case 'Major':
                      // Handle Major action
                      break;
                    case 'Contact':
                      // Handle Contact action
                      break;
                    case 'Support':
                      // Handle Support action
                      break;
                    case 'Account':
                      // Handle Account action
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    value: 'Login',
                    child: Text('Login',
                        style: TextStyle(color: Color(0xFF00484B))),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    value: 'Sign up',
                    child: Text('Sign up'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()));
                    },
                    value: 'Home',
                    child: Text('Home'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Major()));
                    },
                    value: 'Major',
                    child: Text('Major'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Contact()));
                    },
                    value: 'Contact',
                    child: Text('Contact'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Support()));
                    },
                    value: 'Support',
                    child: Text('Support'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>  UserProfilePage(email: '',)));
                    },
                    value: 'Account',
                    child: Text('Account'),
                  ),
                ],
              ),
      ],
    );
  }
}
