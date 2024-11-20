import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/widgets/back_ground.dart';
import '../navbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background with gradient colors
          BackGround(screenWidth: screenWidth, screenHeight: screenHeight),

          Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset('assets/supportLevel/muslimstudents.jpg',
                opacity: const AlwaysStoppedAnimation<double>(0.5),
                width: screenWidth * 0.5,
                height: screenHeight * 0.75,
                fit: BoxFit.cover,
              )
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(
                right: screenWidth < 700 ? 20 : 40,
                bottom: screenHeight < 700 ? 20 : 40,
              ),
              child: Image.asset(
                'assets/logo/qalam.png',
                width: screenWidth < 700 ? 300 : 300,
                height: screenHeight < 700 ? 200 : 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Scrollable Content
          SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08,
                vertical: screenHeight * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Navbar at the top
                 // Navbar(screenWidth: screenWidth),
                  SizedBox(height: 120,),

                  // Main title and slogan
                  Text(
                    'Wolkite University\nMuslim Students Union',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth > 600 ? 36 : 28,
                      color: Color(0xFF00484B),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '“We Strive For Islamic Wisdom”',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 24 : 18,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 30),

                  // About Us Section
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color:  Color(0x55C3F9FB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 24),
                        Text(
                          'Vision',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 18 : 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00484B),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'To nurture a generation of empowered, knowledgeable, and compassionate Muslim students who contribute positively to society.',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 16 : 18,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Mission',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 18 : 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00484B),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Our union is dedicated to creating a welcoming and inclusive environment that fosters spiritual, social, and academic growth for Muslim students. We aim to nurture a strong sense of community, unity, and faith, empowering students to thrive in all aspects of life while maintaining their Islamic values. By providing platforms for religious learning, cultural exchange, and social engagement, we seek to build lasting bonds among Muslim students, ensuring that they feel supported, valued, and connected within the larger university community. Our mission is to cultivate leaders who are grounded in faith, contribute to the well-being of society, and uphold the principles of Islam in every aspect of their academic and personal journeys.',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 16 : 18,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24,),
                        Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 28 : 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00484B),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 16),
                        Text(
                          'Our union is committed to fostering a deep understanding and practice of Islamic values, nurturing students’ faith, and promoting unity and solidarity among Muslim students on campus. We strive to create an inclusive and supportive environment where students can strengthen their spiritual connection, seek knowledge, and engage in meaningful social and academic growth. Through our events, initiatives, and community-building efforts, we aim to provide a space that encourages mutual respect, collaboration, and a shared commitment to the principles of Islam. We believe in empowering students to lead with purpose, compassion, and a sense of responsibility toward one another and the broader community.',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 16 : 18,
                            color: Colors.black87,
                            fontFamily: 'Poppins'
                          ),
                          textAlign: TextAlign.center,
                        ),


                        SizedBox(height: 24),
                        Text(
                          'Inspirational Islamic Quotes',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 18 : 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00484B),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '"وَاعْتَصِمُوا بِحَبْلِ اللَّهِ جَمِيعًا وَلَا تَفَرَّقُوا"',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 16 : 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Poppins'
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '- Surah Al-Imran (3:103)',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 14 : 16,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          '"خَيْرُكُمْ أَحْسَنُكُمْ أَخْلَاقًا"',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 16 : 18,
                            fontStyle: FontStyle.normal,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '- Prophet Muhammad (PBUH)',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 14 : 16,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),

                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Upcoming Events Section
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0x55C3F9FB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upcoming Events',
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 28 : 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00484B),
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildEventItem(
                          context,
                          title: 'Wellcome for Fresh Students',
                          date: 'December 5 & 6 , 2024',
                          description:
                          'Our Universty muslim students union is ready for wellcome program for the new 2017 fresh students',
                        ),
                        _buildEventItem(
                          context,
                          title: 'Weekly Friday Da\'awa',
                          date: 'Every Friday, 1 PM',
                          description:
                          'Join us for our weekly Da\'awa series on important Islamic topics led by our knowledgeable speakers.',
                        ),
                        _buildEventItem(
                          context,
                          title: 'Lecture /Qira\'at',
                          date: 'Everyday After maghrib till Isha except Juma\'a',
                          description:
                          'There is lecture series of kitabs everyday between Maghrib and Isha by Knowledgable Ustazs. And also there will be Qur\'an packages for beginner students ',
                        ),
                      ],
                    ),

                  ),
                  SizedBox(height: 30),

                  // Get Started Button

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            width: screenWidth,
            height: screenHeight * 0.16,
            child: Container(
              color: Color(0xFFC3F9FB),
            ),
          ),
          Positioned(
            width: screenWidth,
            height: screenHeight * 0.2,
            child: Navbar(screenWidth: screenWidth),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(
      BuildContext context, {
        required String title,
        required String date,
        required String description,
      }) {
    // You can now use context here for things like MediaQuery, theme, or localization
    double screenWidth = MediaQuery.of(context).size.width; // Access screen width

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xaaC3F9FB),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 20 : 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00484B),
                ),
              ),
              SizedBox(height: 8),
              Text(
                date,
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 16 : 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 18 : 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Divider(color: Colors.black26),
            ],
          ),
        ),
      ),
    );
  }
}
