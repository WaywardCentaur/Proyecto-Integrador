import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/screens/profile_screen.dart';
import 'package:wallet/screens/nft_screen.dart';

class HomeScreen extends StatefulWidget {
  int index = 0;
  final screens = [
    const Center(child: Text('Page 1', style: TextStyle(fontSize: 32))),
    const Center(child: Text('Page 2', style: TextStyle(fontSize: 32))),
  ];
  @override
  State<StatefulWidget> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScreen> {
  int index = 0;

  final screens = [
    NFTScreen(
      title: 'hi',
    ),
    ProfileScreen(),
    //ARScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        floatingActionButton: buildFAB(),
        bottomNavigationBar: buildNavigationBar(),
      );

  Widget buildNavigationBar() => NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          indicatorColor: Colors.blue.shade100,
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: const Color(0xFFf1f5fb),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          // animationDuration: Duration(seconds: 3),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.photo_album_outlined),
              selectedIcon: Icon(Icons.photo_album),
              label: 'Mail',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: 'Chat',
            ),
          ],
        ),
      );

  Widget? buildFAB() {
    final shape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));

    switch (index) {
      case 0:
        return SizedBox(
          height: 54,
          child: FloatingActionButton.extended(
            shape: shape,
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Compose'),
            onPressed: () {},
          ),
        );
      case 1:
        return FloatingActionButton.extended(
          shape: shape,
          icon: const Icon(Icons.chat_bubble_outline),
          label: const Text('New Chat'),
          onPressed: () {},
        );
      case 2:
        return FloatingActionButton.extended(
          shape: shape,
          icon: const Icon(Icons.add),
          label: const Text('New Space'),
          onPressed: () {},
        );
      default:
        return null;
    }
  }
}

// Padding(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Signed In as',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               user.email!,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size.fromHeight(50),
//               ),
//               icon: const Icon(Icons.arrow_back, size: 32),
//               label: const Text(
//                 'Sign Out',
//                 style: TextStyle(fontSize: 24),
//               ),
//               onPressed: () => FirebaseAuth.instance.signOut(),
//             ),
//           ],
//         ),
//       ),