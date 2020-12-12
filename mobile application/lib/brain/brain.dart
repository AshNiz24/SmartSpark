class Brain {
  double units = 3.243;
  double from;
  double to;
  double tax;
  double net;
  String sAmt;
  String sTax;
  String sNet;
  String cost(units) {
    double fc;
    double cost;
    if (units <= 40) {
      fc = 0;
      cost = (units * 1.5) + fc;
    } else if (units <= 50) {
      fc = 35;
      cost = (units * 3.15) + fc;
    } else if (units <= 100) {
      fc = 45;
      cost = (units * 3.70) + fc;
    } else if (units <= 150) {
      fc = 55;
      cost = (units * 4.80) + fc;
    } else if (units <= 200) {
      fc = 70;
      cost = (units * 6.40) + fc;
    } else if (units <= 250) {
      fc = 80;
      cost = (units * 7.60) + fc;
    } else if (units <= 300) {
      fc = 100;
      cost = (units * 5.80) + fc;
    } else if (units <= 350) {
      fc = 110;
      cost = (units * 6.60) + fc;
    } else if (units <= 400) {
      fc = 120;
      cost = (units * 6.9) + fc;
    } else if (units <= 500) {
      fc = 130;
      cost = (units * 7.1) + fc;
    } else {
      fc = 150;
      cost = (units * 7.90) + fc;
    }
    tax = (0.5 * cost);
    net = tax + cost;
    sTax = tax.toStringAsFixed(2);
    sNet = net.toStringAsFixed(2);

    return cost.toStringAsFixed(2);
  }

  double slab(units) {
    double cost;
    if (units <= 40) {
      cost = 1.5;
    } else if (units <= 50) {
      cost = 3.15;
    } else if (units <= 100) {
      cost = 3.70;
    } else if (units <= 150) {
      cost = 4.80;
    } else if (units <= 200) {
      cost = 6.40;
    } else if (units <= 250) {
      cost = 7.60;
    } else if (units <= 300) {
      cost = 5.80;
    } else if (units <= 350) {
      cost = 6.60;
    } else if (units <= 400) {
      cost = 6.9;
    } else if (units <= 500) {
      cost = 7.1;
    } else {
      cost = 7.90;
    }
    return cost;
  }

  double fixedCharge(units) {
    double fc;
    if (units <= 40) {
      fc = 0;
    } else if (units <= 50) {
      fc = 35;
    } else if (units <= 100) {
      fc = 45;
    } else if (units <= 150) {
      fc = 55;
    } else if (units <= 200) {
      fc = 70;
    } else if (units <= 250) {
      fc = 80;
    } else if (units <= 300) {
      fc = 100;
    } else if (units <= 350) {
      fc = 110;
    } else if (units <= 400) {
      fc = 120;
    } else if (units <= 500) {
      fc = 130;
    } else {
      fc = 150;
    }
    return fc;
  }
}
