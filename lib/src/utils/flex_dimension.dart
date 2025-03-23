import 'dart:ui';

class FlexDimension{
  static double sizeGet(Size s,double x,bool ori){
    double sH=s.height;
    double sW=s.width;
    
    return ori?
    sH/(844/x)
    :sW/(390/x);
  }
}