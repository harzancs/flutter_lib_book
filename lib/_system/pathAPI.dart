final String _base_url = "http://amphawan.cityvariety.co.th/new/";

class PathAPI {
  String base_url = _base_url;
  //Notifications
  String getNotification = _base_url + 'dhamma';

  //Banner
  String getBanner = _base_url + 'banner';

  //ข้อความวิ่ง
  String getMessage = _base_url + 'welcomemessage';

  //ปฏิบัติธรรม
  String getAllDhamma = _base_url + 'dhamma';
  String getDhamma = _base_url + 'dhamma/get/';
  // - สมัครปฎิบัติธรรมให้ผู้อื่นๆ
  String getDammaOther = _base_url + 'member/checkPostTypeOther/'; //+username

  //กิจกรรมบุญ
  String getEvent = _base_url + 'event';
  String getEventImage = _base_url + 'event/get/';

  //สมัครสมาชิก
  String getAllMember = _base_url + 'member';
  String getMember = _base_url + 'member/get/';
  String checkPostMember =
      _base_url + 'member/checkPost'; //เช็ค Username ,Passsword
  String postMember = _base_url + 'member/post';
  String updateMember1 = _base_url + 'member/update1/';
  String updateMember2 = _base_url + 'member/update2/';
  String updateMember3 = _base_url + 'member/update3/';
  // - สมาชิกที่ผู้อื่นลงทะเบียนปฎิบัติธรรมให้
  String postMemberType = _base_url + 'member/postType/';
  String updateMemberType = _base_url + 'member/updateType/';

  //ลงทะเบียนปฏิบัติธรรม
  String getAllRegister = _base_url + 'register';
  String postRegister = _base_url + 'register/post';
  String getPerRegister = _base_url + 'register/getPer';
  // - สำหรับเช็คลงทะเบียนให้ได้คนละ 1 รอบ ถ้าลงที่อืนแล้ว
  String getCheckRegistered =
      _base_url + 'register/getCheckRegistered/'; //+username
  // - ยกเลิกเข้าร่วมปฎิบัติธรรม
  String updateCancelRegister = _base_url + 'register/updateCancelRegister';

  //ความประทับใจ
  String getAllImpression = _base_url + 'impression';
  String getImpressionImg = _base_url + 'impression/get/'; //+uploadKey
  String getImpressionComment = _base_url + 'impression/comment/';
  String postComment = _base_url + 'impression/postcomment';
  String getLike = _base_url + 'impression/like/'; //+uploadKey +usename
  String postLike =
      _base_url + 'impression/postlike/'; //map(uploadKey ,usename)
  String updateLike =
      _base_url + 'impression/updatelike/'; //map(uploadKey ,usename,status)
  String getCountLike = _base_url + 'impression/countlike/'; //uploadKey

  //สื่อ
  String getAllMedia = _base_url + 'docs';
  String getMedia = _base_url + 'docs/getMedia/'; //+uploadKey

  //การตรวจสอบ / ยกเลิก การสมัครปฎิบัติธรรม
  String getCheck = _base_url + 'check/get/'; //+username

  //สำหรับเจ้าหน้าที่
  String getEmpDhamma = _base_url + 'emp';
  String getEmpListname = _base_url + 'emp/getReg/'; //+ cid
  String getEmpDhammaWaiting = _base_url + 'emp/getCheckReg/'; //รอตรวจสอบ

  //ส่งข้อความไปยังผู้พัฒนา
  String getContact = _base_url + 'contact';
  String postContact = _base_url + 'contact/postcontact/'; //+json
  PathAPI() : super();
}
