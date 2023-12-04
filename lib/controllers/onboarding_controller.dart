import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_juice/models/onboarding.dart';
import 'package:the_juice/screens/login.dart';


class OnboardingController extends GetxController {
  var selectedPageIndex=0.obs;
  bool get isLastPage =>selectedPageIndex.value==onboardingPages.length-1;
  var pageController = PageController();

  forwardAction(){
    if(isLastPage){
    Get.off(()=>LoginPage());
    }else{
    pageController.nextPage(duration:300.milliseconds , curve: Curves.ease);
    }
  }
  List<OnboardingInfo>onboardingPages=[
    OnboardingInfo('assets/Animation - 1700916307278.json', "Fresh Juice", "We use freshly picked fruits and lots of love to make your juice everyday."),
    OnboardingInfo('assets/Animation - 1700918440796.json', 'Order Your juice', 'We make it simple to find the juice you crave.Choose your variation and let us do the rest.'),
    OnboardingInfo('assets/Animation - 1700917170703.json', 'Dine-In Nearby at TheJuice', 'Enjoy the convenience of dining in at your nearest TheJuice outlet.'),
    OnboardingInfo('assets/Animation - 1700916751411.json', 'Quick Delivery', 'We make your delivery fast by providing 24x7 service at your doorstep.'),
  ];
}