import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JuiceDescription extends StatefulWidget {
  final bgimage;
  final juicedesc;
  final juiceName;
  final juicePrice;
  const JuiceDescription({super.key, this.bgimage, this.juicedesc, this.juiceName, this.juicePrice, });

  @override
  State<JuiceDescription> createState() => _JuiceDescriptionState();
}

class _JuiceDescriptionState extends State<JuiceDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.bgimage), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                      children: [
                      Text("the",style:GoogleFonts.nothingYouCouldDo(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500),),
                      Text("JUICE",style:GoogleFonts.nothingYouCouldDo(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500)),
                      ],
                      ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/c.png',
              height: 180,
              width: 180,
            ),
            SizedBox(height: 30,),
            Text(widget.juiceName,style: GoogleFonts.merriweather(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w500),),
            SizedBox(height:20,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 26),
              child: Text(widget.juicedesc,style: GoogleFonts.merriweather(fontSize: 18,color: Colors.white)),
            ),
            SizedBox(height:10,),
            Text(widget.juicePrice,style: GoogleFonts.merriweather(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600)),
           SizedBox(height:30,),
           Container(
              height: 25,
              width: 200,
              decoration: BoxDecoration(
              border: Border.all(
              color: Colors.white, 
               width: 1.5, 
              ),
              borderRadius: BorderRadius.circular(8.0), 
              ),
              child: Center(child: Text('Get your Extra',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:110.0,right: 15),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(onPressed: (){},
                backgroundColor: Color(0xff161d27),
                child: Text('BUY',style: TextStyle(fontSize: 18),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
