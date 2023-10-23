import 'package:botanic_gaze/models/index.dart';
import 'package:equatable/equatable.dart';

class PlantInfo extends Equatable {
  const PlantInfo({
    this.id,
    this.botanicalName,
    this.images,
    this.commonName,
  });

  factory PlantInfo.fromJson(Map<String, dynamic> json) => PlantInfo(
        id: json['id'] as int?,
        botanicalName: json['botanicalName'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => PlantImageDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
        commonName: json['commonName'] as String?,
      );
  final int? id;
  final String? botanicalName;
  final List<PlantImageDetail>? images;
  final String? commonName;

  String get featureImage {
    try {
      return images!.first.baseUrl! + images!.first.image!;
    } catch (e) {
      return '';
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'botanicalName': botanicalName,
        'images': images?.map((e) => e.toJson()).toList(),
        'commonName': commonName,
      };

  PlantInfo copyWith({
    int? id,
    String? botanicalName,
    List<PlantImageDetail>? images,
    String? commonName,
  }) {
    return PlantInfo(
      id: id ?? this.id,
      botanicalName: botanicalName ?? this.botanicalName,
      images: images ?? this.images,
      commonName: commonName ?? this.commonName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, botanicalName, images, commonName];
}
