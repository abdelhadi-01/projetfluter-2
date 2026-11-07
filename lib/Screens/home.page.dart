
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orangeAccent,
                    Colors.lightBlue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage("images/avatare.png"),
                    radius: 30,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Abdelhadi ELIDRISSI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "elabdolhadi@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("covid tracker"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: const Color.fromARGB(255, 219, 34, 34),
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: const Color.fromARGB(255, 219, 34, 34),
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: const Color.fromARGB(255, 219, 34, 34),
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text("chatboot"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: const Color.fromARGB(255, 219, 34, 34),
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),

      body: const Center(
        child: Text(
          "Bienvenue dans Home Page",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
