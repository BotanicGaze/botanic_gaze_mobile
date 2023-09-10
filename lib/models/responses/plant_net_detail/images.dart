import 'package:botanic_gaze/models/responses/plant_net_detail/leaf.dart';
import 'package:equatable/equatable.dart';

class PlantNetImages extends Equatable {
  const PlantNetImages({
    this.leaf,
    this.flower,
    this.bark,
    this.habit,
    this.other,
    this.fruit,
  });

  factory PlantNetImages.fromJson(Map<String, dynamic> json) => PlantNetImages(
        leaf: (json['leaf'] as List<dynamic>?)
            ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        flower: (json['flower'] as List<dynamic>?)
            ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        bark: (json['bark'] as List<dynamic>?)
            ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        habit: (json['habit'] as List<dynamic>?)
            ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        fruit: (json['fruit'] as List<dynamic>?)
            ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        other: (json['other'] as List<dynamic>?)
            ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  final List<GalleryImage>? leaf;
  final List<GalleryImage>? flower;
  final List<GalleryImage>? bark;
  final List<GalleryImage>? habit;
  final List<GalleryImage>? other;
  final List<GalleryImage>? fruit;

  List<GalleryImage> get leafSmall =>
      (leaf?.length ?? 0) > 7 ? leaf!.sublist(0, 7) : (leaf ?? []);
  List<GalleryImage> get flowerSmall =>
      (flower?.length ?? 0) > 7 ? flower!.sublist(0, 7) : (flower ?? []);
  List<GalleryImage> get barkSmall =>
      (bark?.length ?? 0) > 7 ? bark!.sublist(0, 7) : (bark ?? []);
  List<GalleryImage> get habitSmall =>
      (habit?.length ?? 0) > 7 ? habit!.sublist(0, 7) : (habit ?? []);
  List<GalleryImage> get otherSmall =>
      (other?.length ?? 0) > 7 ? other!.sublist(0, 7) : (other ?? []);
  List<GalleryImage> get fruitSmall =>
      (fruit?.length ?? 0) > 7 ? fruit!.sublist(0, 7) : (fruit ?? []);

  Map<String, dynamic> toJson() => {
        'leaf': leaf?.map((e) => e.toJson()).toList(),
        'flower': flower?.map((e) => e.toJson()).toList(),
        'bark': bark?.map((e) => e.toJson()).toList(),
        'habit': habit?.map((e) => e.toJson()).toList(),
        'other': other?.map((e) => e.toJson()).toList(),
      };

  PlantNetImages copyWith({
    List<GalleryImage>? leaf,
    List<GalleryImage>? flower,
    List<GalleryImage>? bark,
    List<GalleryImage>? habit,
    List<GalleryImage>? other,
  }) {
    return PlantNetImages(
      leaf: leaf ?? this.leaf,
      flower: flower ?? this.flower,
      bark: bark ?? this.bark,
      habit: habit ?? this.habit,
      other: other ?? this.other,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [leaf, flower, bark, habit, other];
}
