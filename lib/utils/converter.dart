import 'dart:ffi';

class Converter {
  // 34,881.30

  double usd_to_btc (double usd) {
    return usd / 34881.30;
  }

  double btc_to_usd (double btc) {
    return btc * 34881.30;
  }

  
}