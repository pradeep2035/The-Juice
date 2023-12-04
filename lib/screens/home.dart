import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_juice/models/juicemodel.dart';
import 'package:the_juice/screens/description.dart';
import 'package:the_juice/sharepreferencehelper.dart';
//import 'package:the_juice/constant/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xoffset = 0;
  double yoffset = 0;
  double scalefactor=1;
  bool isDrawerOpen= false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          // Close the drawer if it's open
          setState(() {
            xoffset = 0;
            yoffset = 0;
            scalefactor = 1;
            isDrawerOpen = false;
          });
          return false;
        } else {
          // Close the app if the drawer is not open
          SystemNavigator.pop();
          return true;
        }
      },
      child: AnimatedContainer(
        height: double.maxFinite,
        width: double.maxFinite,
        transform: Matrix4.translationValues(xoffset,yoffset,0)..scale(scalefactor),
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isDrawerOpen?40:0),
          gradient: const LinearGradient(
            colors: [
              Color(0xff161d27),
              Color(0xff243949),
            ],
            begin: FractionalOffset.topLeft,
            //Alignment.topLeft,
            end: FractionalOffset.centerRight,
            //Alignment.centerRight,
            stops: [0.6, 2.0],
          )
          
        ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: isDrawerOpen?IconButton(
                        onPressed:(){
                        setState(() {
                        xoffset=0;
                        yoffset=0;
                        scalefactor=1;
                        isDrawerOpen=false;
                        });
                        },
                         icon: const Icon(Icons.arrow_back_ios_new),color: Colors.white,) 
                         :
                         IconButton(
                          onPressed: () {
                            setState(() {
                              xoffset=200;
                              yoffset=150;
                              scalefactor=0.6;
                              isDrawerOpen=true;
                            });
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 40,
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hello ${SharedPreferencesHelper.getUserName()},',
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize:25,fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'What can I blend for you today?',
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize:13),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150, left: 45),
                      child: Column(
                        children: [
                          Text(
                            "the",
                            style: GoogleFonts.nothingYouCouldDo(
                                fontSize: 42,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          Text("JUICE",
                              style: GoogleFonts.nothingYouCouldDo(
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Image.asset(
                            "assets/juice.png",
                            height: 230,
                          ),
                        )),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Text(
                        "We provide a variety \nof fresh juices with \nvarious flavors.\nGet juice easily!",
                        style: GoogleFonts.spectral(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    )),
                const SizedBox(
                  height: 45,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "VARIATION :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.2,
                  child: ListView.builder(
                      itemCount: juiceData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final juiceName = juiceData[index].juiceName;
                        final juicePrice = juiceData[index].juicePrice;
                        final juiceDesc = juiceData[index].juiceDesc;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JuiceDescription(
                                          bgimage: juiceData[index].avatar,
                                          juicedesc: juiceDesc,
                                          juicePrice: juicePrice,
                                          juiceName: juiceName)));
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              radius:53,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  juiceData[index].avatar,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        //),
      //));
       ),
    );
  }
}
