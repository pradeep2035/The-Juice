import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff161d27),
            Color(0xff243949),
          ],
          begin: FractionalOffset.topLeft,
          //Alignment.topLeft,
          end: FractionalOffset.centerRight,
          //Alignment.centerRight,
          stops: [0.6, 2.0],
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 40,
                        )),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
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
                    style: GoogleFonts.montserrat(color: Colors.white, fontSize:14),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 200, left: 45),
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
                        padding: const EdgeInsets.only(top: 80.0),
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
                height: 25,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "VARIATION :",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 230,
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
                          child: Container(
                            height: 135,
                            width: 110,
                            child: Image.network(
                              juiceData[index].avatar,
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
