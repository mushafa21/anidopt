

import 'package:flutter/cupertino.dart';

import '../window_class.dart';

extension BuildContextExtension on BuildContext {

  WindowClass getWindowClass(){
    double width = MediaQuery.sizeOf(this).width;
    if (width < 600) {
      return WindowClass.Compact;
    }
    else if (width >= 600 && width < 840) {
      return WindowClass.Medium;
    }
    else if (width >= 840) {
      return WindowClass.Expanded;
    }
    return WindowClass.Compact;

  }


  double getScreenMargin(){
    switch (getWindowClass()){
      case WindowClass.Compact : {
        return 16;
      }

      case WindowClass.Medium : {

        return 32;

      }

      case WindowClass.Expanded : {
        return 32;

      }


    }
  }



}