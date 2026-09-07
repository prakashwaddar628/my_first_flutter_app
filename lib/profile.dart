import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSearch extends StatelessWidget {
  const ProfileSearch({super.key});

  List<String> getUrl() {
    const contact = 'mailto:prakash@example.com';
    const github = 'https://github.com/prakashlwaddar';
    return [contact, github];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Search')),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // this all comes under the column widget which is used to arrange the widgets vertically
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Prakash L Waddar',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  'AI & Data Science Developer',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email, color: Colors.blue),
                    const SizedBox(width: 10),
                    const Text('prakash@example.com'),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.phone, color: Colors.blue),
                    const SizedBox(width: 10),
                    const Text('+91 9740637206'),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // when button is pressed open the url in the browser using the url_launcher package
                        launchUrl(Uri.parse(getUrl()[0]));
                      },
                      child: const Text('Contact'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        // when button is pressed open the url in the browser using the url_launcher package
                        launchUrl(Uri.parse(getUrl()[1]));
                      },
                      child: const Text('GitHub'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
