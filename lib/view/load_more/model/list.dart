class Photo {
  int id;
  String title;
  String thumbnailUrl;

  Photo({this.id, this.title, this.thumbnailUrl});

  Photo.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        thumbnailUrl = json['thumbnailUrl'];
}

class SavePhoto {
  final int id;
  final String title;
  final String thumbnailUrl;

  SavePhoto({this.id, this.title, this.thumbnailUrl});

  SavePhoto.fromJson(Map json)
      : id = json['id'] as int,
        title = json['title'] as String,
        thumbnailUrl = json['thumbnailUrl'];
}

// class PostData {
//   final String id;
//   final String subject;
//   final String detail;

//   PostData({this.id, this.subject, this.detail});

//   PostData.fromJson(Map json)
//       : id = json['id'] as String,
//         subject = json['subject'] as String,
//         detail = json['detail'];
// }

class PostData {
  final String id;
  final String subject;
  final String detail;

  PostData(this.id, this.subject, this.detail);
}
