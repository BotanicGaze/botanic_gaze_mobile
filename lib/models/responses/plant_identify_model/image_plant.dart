import 'package:equatable/equatable.dart';

class ImagePlant extends Equatable {
  const ImagePlant({
    this.smallImageUrl,
    this.mediumImageUrl,
    this.originalImageUrl,
    this.imageAuthor,
    this.imageLicense,
    this.imageTakenDate,
    this.imageTakenDateTime,
  });

  factory ImagePlant.fromJson(Map<String, dynamic> json) => ImagePlant(
        smallImageUrl: json['smallImageUrl'] as String?,
        mediumImageUrl: json['mediumImageUrl'] as String?,
        originalImageUrl: json['originalImageUrl'] as String?,
        imageAuthor: json['imageAuthor'] as String?,
        imageLicense: json['imageLicense'] as String?,
        imageTakenDate: json['imageTakenDate'] as String?,
        imageTakenDateTime: json['imageTakenDateTime'] == null
            ? null
            : DateTime.parse(json['imageTakenDateTime'] as String),
      );
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? originalImageUrl;
  final String? imageAuthor;
  final String? imageLicense;
  final String? imageTakenDate;
  final DateTime? imageTakenDateTime;

  Map<String, dynamic> toJson() => {
        'smallImageUrl': smallImageUrl,
        'mediumImageUrl': mediumImageUrl,
        'originalImageUrl': originalImageUrl,
        'imageAuthor': imageAuthor,
        'imageLicense': imageLicense,
        'imageTakenDate': imageTakenDate,
        'imageTakenDateTime': imageTakenDateTime?.toIso8601String(),
      };

  ImagePlant copyWith({
    String? smallImageUrl,
    String? mediumImageUrl,
    String? originalImageUrl,
    String? imageAuthor,
    String? imageLicense,
    String? imageTakenDate,
    DateTime? imageTakenDateTime,
  }) {
    return ImagePlant(
      smallImageUrl: smallImageUrl ?? this.smallImageUrl,
      mediumImageUrl: mediumImageUrl ?? this.mediumImageUrl,
      originalImageUrl: originalImageUrl ?? this.originalImageUrl,
      imageAuthor: imageAuthor ?? this.imageAuthor,
      imageLicense: imageLicense ?? this.imageLicense,
      imageTakenDate: imageTakenDate ?? this.imageTakenDate,
      imageTakenDateTime: imageTakenDateTime ?? this.imageTakenDateTime,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      smallImageUrl,
      mediumImageUrl,
      originalImageUrl,
      imageAuthor,
      imageLicense,
      imageTakenDate,
      imageTakenDateTime,
    ];
  }
}
