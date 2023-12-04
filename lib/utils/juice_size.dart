import 'package:flutter/material.dart';

class JuiceSize extends StatefulWidget {
  const JuiceSize({super.key});

  @override
  State<JuiceSize> createState() => _JuiceSizeState();
}

class _JuiceSizeState extends State<JuiceSize> {
  String selectedSize = "S";
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        buildContainer( Colors.red,"S",),
        buildContainer( Colors.green,"M"),
        buildContainer( Colors.blue,"L"),
      ],
    );
  }


Widget buildContainer( Color color,String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(2.5),
        height: MediaQuery.sizeOf(context).height *0.045,
        width:MediaQuery.sizeOf(context).width * 0.08,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: selectedSize==size?const Color.fromARGB(255, 18, 46, 85): Colors.grey.shade400,
              width: 2),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade400,
          ),
          child: Center(
              child: Text(
            '$size',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
          )),
        ),
      ),
    );
  }
}