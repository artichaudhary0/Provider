import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

int currentIndex = 0;

class _StepperDemoState extends State<StepperDemo> {
  void stepContinue() {
    final isLastStep = currentIndex == getSteps().length - 1;
    if (isLastStep) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("Successful"),
            );
          });
    } else {
      setState(() {
        currentIndex = currentIndex + 1;
      });
    }
  }

  void stepCancel() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex = currentIndex - 1;
      });
    }
  }

  void stepTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    print(index);
  }

  Widget ButtonWidget(context, details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              stepContinue();
            },
            child: const Text("Continue")),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
            onPressed: () {
              stepCancel();
            },
            child: const Text("Cancel")),
      ],
    );
  }

  TextEditingController email_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: currentIndex,
      onStepContinue: stepContinue,
      onStepCancel: stepCancel,
      onStepTapped: stepTapped,
      type: StepperType.vertical,
      controlsBuilder: ButtonWidget,
      elevation: 0,
      steps: getSteps(),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        title: const Text("gyiwef"),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "FirstName",
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Last Name",
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        isActive: currentIndex >= 0,
      ),
      Step(
        title: const Text("gyiwef"),
        content: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: email_controller,
                  decoration: InputDecoration(
                    hintText: "Email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  validator: (value) {
                    if (email_controller.toString().isEmpty) {
                      return "cdtwyq";
                    }
                  },
                ),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        isActive: currentIndex >= 1,
      ),
      Step(
        title: const Text("gyiwef"),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Phone number",
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        isActive: currentIndex >= 2,
      ),
    ];
  }
}
