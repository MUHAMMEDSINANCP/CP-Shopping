import 'package:cp_shopping/common/color_extension.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: TColor.title,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        title: Text(
          "About Us",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: TColor.title),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 26,
              ),
              Text(
                'About CP Tech-Innovations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: TColor.secondaryText,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                'CP Tech-Innovations is an innovative tech company based in Kerala, India. We are dedicated to creating cutting-edge solutions for the digital world and providing exceptional services to our clients.',
                style: TextStyle(
                    fontSize: 16, color: TColor.title.withOpacity(0.8)),
              ),
              const SizedBox(height: 20),
              Text(
                'Our Services',
                style: TextStyle(
                  fontSize: 20,
                  color: TColor.secondaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                textAlign: TextAlign.center,
                '• Mobile App Development for Android and iOS',
                style: TextStyle(
                    fontSize: 16, color: TColor.title.withOpacity(0.8)),
              ),
              Text(
                '• Web Development',
                style: TextStyle(
                    fontSize: 16, color: TColor.title.withOpacity(0.8)),
              ),
              Text(
                '• Software Development',
                style: TextStyle(
                    fontSize: 16, color: TColor.title.withOpacity(0.8)),
              ),
              Text(
                '• UI/UX Design',
                style: TextStyle(
                    fontSize: 16, color: TColor.title.withOpacity(0.8)),
              ),
              const SizedBox(height: 20),
              Text(
                'Our Team',
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                textAlign: TextAlign.center,
                'CP Tech-Innovations was founded by Muhammed Sinan CP, a visionary tech enthusiast with a passion for creating exceptional applications. Our team of dedicated professionals brings expertise, creativity, and dedication to every project.',
                style: TextStyle(
                    fontSize: 16, color: TColor.title.withOpacity(0.8)),
              ),
              const SizedBox(height: 20),
              Text(
                'Developer Contact Details:',
                style: TextStyle(
                  fontSize: 20,
                  color: TColor.secondaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Email: cpmuhammedsinan@gmail.com',
                style: TextStyle(
                    fontSize: 16, color: TColor.title.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
