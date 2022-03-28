import 'package:flutter_svg/flutter_svg.dart';
import 'package:cleancity/screens/dashboard/dashboard.dart';
import 'package:cleancity/screens/onboard/content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState(){
    _controller =  PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_,i){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       SizedBox(height:20,
                         child: Padding(
                           padding: const EdgeInsets.only(bottom: 150),
                           child: Text(
                     contents[i].title,
                     textAlign: TextAlign.center,
                     style: TextStyle(
                           fontFamily: "Inter",
                           fontSize: 35,
                           fontWeight: FontWeight.bold,
                              ),
                           ),
                         ),
                       ),
                       SizedBox(height: 8,),
                       Padding(
                         padding: const EdgeInsets.only(top: 120,),
                         child: SvgPicture.asset(contents[i].svgPictures,
                         width: 300,),
                       ),
                       Center(
                         child: Padding(
                           padding: const EdgeInsets.only(top: 30,),
                           child: Text(
                             contents[i].discription,
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               fontFamily: "Inter",
                               fontWeight: FontWeight.bold,
                               fontSize: 20,
                               color: HexColor("#010117"),
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                 ) ;
              },
            ),
          ),
          ///dots section
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:List.generate(
                    contents.length, (index) => buildDot(index, context),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Container(
              height: 60,
              margin: EdgeInsets.all(20),
              width: double.infinity,
              // ignore: deprecated_member_use
              child: FlatButton(
                child: Text(currentIndex == contents.length-1? "Continue":"Continue",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                ),
                ),
                height: 30,
                onPressed: (){
                  if(currentIndex == contents.length-1){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Dashboard()));
                  }
                  _controller.nextPage(duration: Duration(microseconds: 100), curve: Curves.bounceIn);
                },
                color: HexColor("#1565C0"),
                textColor: HexColor("#FAFAFA"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index,BuildContext context) {
    return Container(
              height: 10,
              width: currentIndex== index ? 30:10,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor("#1565C0"),
              ),
            );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<PageController>('_controller', _controller));
    properties.add(DiagnosticsProperty<PageController>('_controller', _controller));
    properties.add(DiagnosticsProperty<PageController>('_controller', _controller));
  }
}


