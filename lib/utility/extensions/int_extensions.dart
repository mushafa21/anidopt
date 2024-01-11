import 'package:intl/intl.dart';

extension IntExtension on int{
  String secondsToMmSsFormat(){
    int minutes = this ~/ 60;
    int remainingSeconds = this % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  String dayToMonth() {
    if (this < 30) {
      return "$this Hari";
    } else {
      // Add 1 for every 30 int
      int adjustedValue = this % 30 + 1;
      return "${adjustedValue.toString()} Bulan";
    }
  }

  String convertRupiah() {
    try{
      final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
      return formatCurrency.format(this);
    } catch(e){
      return toString();
    }

  }

  int getDiscountPrice(String percent, int maxDiscount){
    try{
      final discountPrice = this * double.parse(percent) / 100;
      if(discountPrice > maxDiscount){
        return maxDiscount;
      } else{
        return discountPrice.toInt();
      }
    }catch(e){
      return this;
    }
  }
}