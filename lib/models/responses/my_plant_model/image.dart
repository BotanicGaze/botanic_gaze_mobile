// import 'package:equatable/equatable.dart';

// class Image extends Equatable {
//   final String? image;
//   final String? copyRight;
//   final String? baseUrl;

//   const Image({this.image, this.copyRight, this.baseUrl});

//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//         image: json['image'] as String?,
//         copyRight: json['copyRight'] as String?,
//         baseUrl: json['baseURL'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'image': image,
//         'copyRight': copyRight,
//         'baseURL': baseUrl,
//       };

//   Image copyWith({
//     String? image,
//     String? copyRight,
//     String? baseUrl,
//   }) {
//     return Image(
//       image: image ?? this.image,
//       copyRight: copyRight ?? this.copyRight,
//       baseUrl: baseUrl ?? this.baseUrl,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [image, copyRight, baseUrl];
// }
