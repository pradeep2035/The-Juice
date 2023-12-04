import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:the_juice/controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
          controller: _controller.pageController,
          onPageChanged: _controller.selectedPageIndex,
          itemCount: _controller.onboardingPages.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Lottie.asset(
                        _controller.onboardingPages[index].imageAsset,
                        height: 270)),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  _controller.onboardingPages[index].title,
                  style: GoogleFonts.workSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 18, 46, 85)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: Text(_controller.onboardingPages[index].description,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Row(
            children: List.generate(
                _controller.onboardingPages.length,
                (index) => Obx(() {
                      return Container(
                        height: 8.8,
                        width: 8.8,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: _controller.selectedPageIndex.value == index
                                ? const Color.fromARGB(255, 18, 46, 85)
                                : Colors.grey,
                            shape: BoxShape.circle),
                      );
                    })),
          ),
        ),
        Positioned(
            right: 20,
            bottom: 20,
            child: InkWell(
              onTap:()async{
               await _controller.forwardAction();
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.27,
                height: MediaQuery.sizeOf(context).height * 0.04,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 18, 46, 85),
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: BoxShadow({})
                    ),
                child: Center(
                  child:Obx((){
                  return Text(
                    _controller.isLastPage?
                    'Start':'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey.shade100, fontWeight: FontWeight.w400,fontSize:16),
                  );
                  })
                ),
              ),
            )),
      ],
    ));
  }
}
