import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {

  int currentStep = 0 ;

  bool isActive = false;

  stepContinue(){
    if(currentStep<2){  setState(() {
      currentStep = currentStep +1;
    });}


  }
  stepCancel(){

    if(currentStep>0){    setState(() {
      currentStep = currentStep -1;
    });}




  }




  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: currentStep,
        onStepContinue: stepContinue,
        onStepCancel: stepCancel,
        type: StepperType.vertical,

        steps: [
      Step(
        title: Text("1"),
        content: Text("This is first stepper"),
        isActive: currentStep>=0,

      ),
      Step(
        title: Text("2"),
        content: Text("This is first stepper"),
        isActive: currentStep>=1, // 0,1
      ),
      Step(
        title: Text("3"),
        content: Text("This is first stepper"),
        isActive: currentStep>=2, // 2,1,0
      ),
    ]);
  }
}
