// import 'package:botanic_gaze/models/responses/plant_net_detail/plus.dart';
// import 'package:equatable/equatable.dart';

// class Habit extends Equatable {
//   const Habit({
//     this.id,
//     this.o,
//     this.m,
//     this.s,
//     this.author,
//     this.license,
//     this.date,
//     this.plus,
//     this.observationId,
//     this.hasGeoloc,
//     this.isGeolocPublic,
//     this.licenseUrl,
//   });

//   factory Habit.fromJson(Map<String, dynamic> json) => Habit(
//         id: json['id'] as String?,
//         o: json['o'] as String?,
//         m: json['m'] as String?,
//         s: json['s'] as String?,
//         author: json['author'] as String?,
//         license: json['license'] as String?,
//         date: json['date'] as String?,
//         plus: json['plus'] == null
//             ? null
//             : Plus.fromJson(json['plus'] as Map<String, dynamic>),
//         observationId: json['observationId'] as String?,
//         hasGeoloc: json['hasGeoloc'] as bool?,
//         isGeolocPublic: json['isGeolocPublic'] as bool?,
//         licenseUrl: json['licenseUrl'] as String?,
//       );
//   final String? id;
//   final String? o;
//   final String? m;
//   final String? s;
//   final String? author;
//   final String? license;
//   final String? date;
//   final Plus? plus;
//   final String? observationId;
//   final bool? hasGeoloc;
//   final bool? isGeolocPublic;
//   final String? licenseUrl;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'o': o,
//         'm': m,
//         's': s,
//         'author': author,
//         'license': license,
//         'date': date,
//         'plus': plus?.toJson(),
//         'observationId': observationId,
//         'hasGeoloc': hasGeoloc,
//         'isGeolocPublic': isGeolocPublic,
//         'licenseUrl': licenseUrl,
//       };

//   Habit copyWith({
//     String? id,
//     String? o,
//     String? m,
//     String? s,
//     String? author,
//     String? license,
//     String? date,
//     Plus? plus,
//     String? observationId,
//     bool? hasGeoloc,
//     bool? isGeolocPublic,
//     String? licenseUrl,
//   }) {
//     return Habit(
//       id: id ?? this.id,
//       o: o ?? this.o,
//       m: m ?? this.m,
//       s: s ?? this.s,
//       author: author ?? this.author,
//       license: license ?? this.license,
//       date: date ?? this.date,
//       plus: plus ?? this.plus,
//       observationId: observationId ?? this.observationId,
//       hasGeoloc: hasGeoloc ?? this.hasGeoloc,
//       isGeolocPublic: isGeolocPublic ?? this.isGeolocPublic,
//       licenseUrl: licenseUrl ?? this.licenseUrl,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       o,
//       m,
//       s,
//       author,
//       license,
//       date,
//       plus,
//       observationId,
//       hasGeoloc,
//       isGeolocPublic,
//       licenseUrl,
//     ];
//   }
// }
