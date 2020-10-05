class TimeTH {
  var FullDay = [
    "",
    "วันอาทิตย์",
    "วันจันทร์",
    "วันอังคาร",
    "วันพุธ",
    "วันพฤหัส",
    "วันศุกร์",
    "วันเสาร์"
  ];
  var FullMonth = [
    "",
    "มกราคม",
    "กุมภาพันธ์",
    "มีนาคม",
    "เมษายน",
    "พฤษภาคม",
    "มิถุนายน",
    "กรกฎาคม",
    "สิงหาคม",
    "กันยายน",
    "ตุลาคม",
    "พฤศจิกายน",
    "ธันวาคม"
  ];
  var ShortMonth = [
    "",
    "ม.ค.",
    "ก.พ.",
    "มี.ค.",
    "เม.ย.",
    "พ.ค.",
    "มิ.ย.",
    "ก.ค.",
    "ส.ค.",
    "ก.ย.",
    "ต.ค.",
    "พ.ย.",
    "ธ.ค."
  ];

  int yearTh(int year) {
    year = year + 543;
    return year;
  }

  covertDateShortMonthTime(String date) {
    // Example input : 2020-01-10 15:30:00
    // Example Output : 10 ม.ค. 2563 15:30
    String y = TimeTH().yearTh(int.parse(date.substring(0, 4))).toString();
    String m = TimeTH().ShortMonth[int.parse(date.substring(5, 7))];
    String d = int.parse(date.substring(8, 10)).toString();
    String t = date.substring(10, 16);
    String _text = d + ' ' + m + ' ' + y + ' ' + t;
    return _text;
  }

  covertDateShortMonth(String date) {
    // Example input : 2020-01-10 15:30:00
    // Example Output : 10 ม.ค. 2563
    date = date.substring(0, 10);
    String y = TimeTH().yearTh(int.parse(date.substring(0, 4))).toString();
    String m = TimeTH().ShortMonth[int.parse(date.substring(5, 7))];
    String d = int.parse(date.substring(8, 10)).toString();

    String _text = d + ' ' + m + ' ' + y;
    return _text;
  }
}
