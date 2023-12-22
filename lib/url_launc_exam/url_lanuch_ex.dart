import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlDemo extends StatefulWidget {
  const UrlDemo({super.key});

  @override
  State<UrlDemo> createState() => _UrlDemoState();
}

class _UrlDemoState extends State<UrlDemo> {
  browser({required String browserUrl}) async {
    Uri url = Uri(
      scheme: "https",
      path: browserUrl,
    );
    await launchUrl(url);
  }

  message({required String messageUrl}) async {
    Uri url = Uri(
      scheme: "sms",
      path: messageUrl,
    );
    await launchUrl(url);
  }
  email({required String emailUrl}) async {
    Uri url = Uri(
      scheme: "mailto",
      path: emailUrl,
    );
    await launchUrl(url);
  }



  // sms({required String sms}) async {
  //   Uri url = Uri(
  //     scheme: "sms",
  //     path: sms,
  //   );
  //   await launchUrl(url);
  // }
  // mailto({required String senderEmail}) async {
  //   Uri url = Uri(
  //     scheme: "mailto",
  //     path: senderEmail,
  //   );
  //   await launchUrl(url);
  // }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url"),
      ),
      body: Column(
        children: [
          TextField(controller: controller,),
          FloatingActionButton(
            onPressed: () {
              message(messageUrl: controller.value.text);
            },
            child: Icon(Icons.message),
          ),

          FloatingActionButton(
            onPressed: () {
              email(emailUrl: "devchevli4090@gmail.com");
            },
            child: const Icon(Icons.mail),
          ),
          FloatingActionButton(
            onPressed: ()async {
              if(controller.text.isNotEmpty) {
                await Share.share(controller.value.text);
              }else{}
            },
            child: const Icon(Icons.abc),
          ),

          FloatingActionButton(
            onPressed: ()async {
              String mail = "https://www.google.com";

              if(controller.text.isNotEmpty) {
                await Share.share(mail);
              }else{}
            },
            child: const Icon(Icons.mail),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          browser(browserUrl: "https://www.google.com/");
          // Uri uri = Uri.parse(
          //     "https://www.google.com/");
          // if (await canLaunchUrl(uri)) {
          //   await launchUrl(uri);
          // }
        },
        child: const Icon(Icons.abc),
      ),
    );
  }
}
