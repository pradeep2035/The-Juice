import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_juice/utils/juice_size.dart';

class JuiceDescription extends StatefulWidget {
  final bgimage;
  final juicedesc;
  final juiceName;
  final juicePrice;
  const JuiceDescription({
    super.key,
    this.bgimage,
    this.juicedesc,
    this.juiceName,
    this.juicePrice,
  });

  @override
  State<JuiceDescription> createState() => _JuiceDescriptionState();
}

class _JuiceDescriptionState extends State<JuiceDescription> {
  bool isSelectedSmall=false;
  bool isSelectedMedium=false;
  bool isSelectedLarge=false;
  bool isLiked=false;
  int quantity=01;

  @override
  Widget build(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.bgimage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: screenHeight*0.048,
                  right: 20,
                  left: 10,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade500.withOpacity(0.6),
                        radius: 20,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.grey.shade200,
                            )),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Colors.grey.shade500.withOpacity(0.6),
                            radius: 20,
                            child: Image.asset(
                              "assets/heart.png",
                              height: 22,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Colors.grey.shade500.withOpacity(0.6),
                            radius: 20,
                            child: Image.asset("assets/bag.png", height: 24),
                          ),
                          //Image.asset("assets/bag.png",height: 28,),
                        ],
                      )
                    ],
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 20,bottom: 10),
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                               SizedBox(
                                height: screenHeight*0.03,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Size",
                                    style: GoogleFonts.workSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )),
                              const Row(
                                children: [
                                  JuiceSize(),
                                ],
                              )
                            ],
                          ),
                         SizedBox(height: screenHeight*0.02,),
                          Text(widget.juicedesc,textAlign: TextAlign.justify,style:GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.w400) ,),
                          SizedBox(height: MediaQuery.sizeOf(context).height*0.08,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        if(quantity>1){
                                        quantity--;
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(6),
                                      height: 30,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(255, 18, 46, 85),
                                      ),
                                      child: const Icon(Icons.remove,color: Colors.white)
                                    ),
                                  ),
                                   Container(
                                    //margin: EdgeInsets.all(6),
                                    height: 30,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)
                                    ),
                                    child:Center(child: Text("$quantity",style: const TextStyle(fontSize: 17),)),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(6),
                                      height: 30,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(255, 18, 46, 85),
                                      ),
                                      child: const Icon(Icons.add,color: Colors.white,)
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLiked = !isLiked;
                                  });
                                },
                                child: CircleAvatar(backgroundColor:isLiked?Colors.red:Colors.grey,radius: 15,child: Image.asset("assets/like.png",height: 18,),))
                            ],
                          ),
                           SizedBox(height: screenHeight*0.03,),
                          Row(
                            children: [
                              Container(
                                height: MediaQuery.sizeOf(context).height*0.06,
                                width:MediaQuery.sizeOf(context).width*0.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color.fromARGB(255, 18, 46, 85),width: 2)
                                ),
                                child: Center(child: Image.asset('assets/add-to-cart.png',height: 40,color: const Color.fromARGB(255, 18, 46, 85),)),
                              ),
                              const Spacer(),
                              Container(
                                height: MediaQuery.sizeOf(context).height*0.06,
                                width:MediaQuery.sizeOf(context).width*0.6 ,
                                decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 18, 46, 85),
                                borderRadius: BorderRadius.circular(15)
                                ),
                                child: const Center(child: Text("BUY NOW",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: screenHeight*0.12,
                  left: screenWidth*0.08,
                  child: Text(
                    widget.juiceName,
                    style: GoogleFonts.workSans(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
              Positioned(
                top: screenHeight*0.25,
                left:  screenWidth * 0.05,
                right: screenWidth * 0.02,
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                       TextSpan(
                          text: "Price\n",
                          style: GoogleFonts.workSans(fontSize: 15, fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: "${widget.juicePrice}",
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500)),
                    ])),
                    const Spacer(),
                    Expanded(
                        child: FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Image.asset(
                                "assets/c.png",
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                        ))
                  ],
                ),
              ),
              
            ],
          )),
    );
  }
}
