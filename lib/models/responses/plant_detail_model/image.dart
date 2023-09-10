import 'package:equatable/equatable.dart';

class PlantImageDetail extends Equatable {
  const PlantImageDetail({this.image, this.copyRight, this.baseUrl});

  factory PlantImageDetail.fromJson(Map<String, dynamic> json) =>
      PlantImageDetail(
        image: json['image'] as String?,
        copyRight: json['copyRight'] as String?,
        baseUrl: 'https://apps.rhs.org.uk/plantselectorimages/detail/',
        // "${json['baseURL'] as String? ?? 'https://apps.rhs.org.uk/plantselectorimages/detail'}/",
      );
  final String? image;
  final String? copyRight;
  final String? baseUrl;

  Map<String, dynamic> toJson() => {
        'image': image,
        'copyRight': copyRight,
        'baseURL': baseUrl,
      };

  PlantImageDetail copyWith({
    String? image,
    String? copyRight,
    String? baseUrl,
  }) {
    return PlantImageDetail(
      image: image ?? this.image,
      copyRight: copyRight ?? this.copyRight,
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [image, copyRight, baseUrl];
}
