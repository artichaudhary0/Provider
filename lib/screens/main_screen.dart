import 'package:contact_diary/screens/login.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('showBottomSheet'),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.red,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 700,
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 100,
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            color: Colors.black,
                            child: Text(
                              "dtjhsw",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                });
            // Scaffold.of(context).showBottomSheet<void>(
            //       (BuildContext context) {
            //     return Container(
            //       height: 200,
            //       color: Colors.amber,
            //       child: Center(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           mainAxisSize: MainAxisSize.min,
            //           children: <Widget>[
            //             const Text('BottomSheet'),
            //             ElevatedButton(
            //               child: const Text('Close BottomSheet'),
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }
}

class CustomPopup extends StatelessWidget {
  const CustomPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(
          child: Row(
            children: [
              Text("Rating"),
              SizedBox(
                width: 10,
              ),
              Text("⭐⭐⭐⭐⭐"),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              const Text("Rating"),
              const SizedBox(
                width: 10,
              ),
              Radio(value: 1, groupValue: 1, onChanged: (value) {}),
            ],
          ),
        ),
        const PopupMenuItem(
          child: Row(
            children: [
              Text("Rating"),
              SizedBox(
                width: 10,
              ),
              Text("⭐⭐⭐⭐⭐"),
            ],
          ),
        ),
        const PopupMenuItem(
          child: Row(
            children: [
              Text("Rating"),
              SizedBox(
                width: 10,
              ),
              Text("⭐⭐⭐⭐⭐"),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: const Row(
            children: [
              Icon(Icons.logout),
              Text("Sign out"),
            ],
          ),
        ),
      ],
    );
  }
}
