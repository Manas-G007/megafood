import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:megafood/src/utils/text_style.dart';

class ReadMore extends StatefulWidget {
  final String text;
  final int limit;
  final bool? isReview;
  const ReadMore({super.key,
  required this.text,
  required this.limit,
  this.isReview});

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {

  String limitText="";
  bool isBig=false;
  bool readbool=false;

  String trimText(String text){
    if(text.length>widget.limit){
      setState(() {
        isBig=true;
      });
      return text.substring(0,widget.limit);
    }else{
      return text;
    }
  }

  void toggleShow(){
    setState(() {
      readbool=!readbool;
    });
  }

  @override
  void initState() {
    limitText=trimText(widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
       text:TextSpan(
        children:[
          TextSpan(
            text:readbool?widget.text: limitText,
              style: widget.isReview==null? MyTextStyle.t21:MyTextStyle.t24),
          isBig?
          TextSpan(
            text:readbool?" ... Read Less":" ... Read More",
              style: widget.isReview==null? MyTextStyle.t23:MyTextStyle.t25,
            recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      toggleShow();
                    },
              ):
              const TextSpan(
                text: ""
              ),
        ]
       ) ,
    );
  }
}