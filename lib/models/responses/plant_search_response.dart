import 'package:equatable/equatable.dart';

class PlantSearchResponse extends Equatable {
  const PlantSearchResponse({
    this.id,
    this.botanicalName,
    this.entityDescription,
    this.image,
    this.commonName,
    this.nurseriesCount,
    this.synonymParentPlantId,
    this.synonymParentPlantName,
    this.isAgm,
    this.isSynonym,
    this.isPlantsForPollinators,
    this.price,
  });

  factory PlantSearchResponse.fromJson(Map<String, dynamic> json) {
    return PlantSearchResponse(
      id: json['id'] as int?,
      botanicalName: json['botanicalName'] as String?,
      entityDescription: json['entityDescription'] as String?,
      image: json['image'] as String?,
      commonName: json['commonName'] as String?,
      nurseriesCount: json['nurseriesCount'] as int?,
      synonymParentPlantId: json['synonymParentPlantId'] as int?,
      synonymParentPlantName: json['synonymParentPlantName'] as dynamic,
      isAgm: json['isAgm'] as bool?,
      isSynonym: json['isSynonym'] as bool?,
      isPlantsForPollinators: json['isPlantsForPollinators'] as bool?,
      price: json['price'] as dynamic,
    );
  }
  final int? id;
  final String? botanicalName;
  final String? entityDescription;
  final String? image;
  final String? commonName;
  final int? nurseriesCount;
  final int? synonymParentPlantId;
  final dynamic synonymParentPlantName;
  final bool? isAgm;
  final bool? isSynonym;
  final bool? isPlantsForPollinators;
  final dynamic price;

  Map<String, dynamic> toJson() => {
        'id': id,
        'botanicalName': botanicalName,
        'entityDescription': entityDescription,
        'image': image,
        'commonName': commonName,
        'nurseriesCount': nurseriesCount,
        'synonymParentPlantId': synonymParentPlantId,
        'synonymParentPlantName': synonymParentPlantName,
        'isAgm': isAgm,
        'isSynonym': isSynonym,
        'isPlantsForPollinators': isPlantsForPollinators,
        'price': price,
      };

  PlantSearchResponse copyWith({
    int? id,
    String? botanicalName,
    String? entityDescription,
    String? image,
    String? commonName,
    int? nurseriesCount,
    int? synonymParentPlantId,
    dynamic synonymParentPlantName,
    bool? isAgm,
    bool? isSynonym,
    bool? isPlantsForPollinators,
    dynamic price,
  }) {
    return PlantSearchResponse(
      id: id ?? this.id,
      botanicalName: botanicalName ?? this.botanicalName,
      entityDescription: entityDescription ?? this.entityDescription,
      image: image ?? this.image,
      commonName: commonName ?? this.commonName,
      nurseriesCount: nurseriesCount ?? this.nurseriesCount,
      synonymParentPlantId: synonymParentPlantId ?? this.synonymParentPlantId,
      synonymParentPlantName:
          synonymParentPlantName ?? this.synonymParentPlantName,
      isAgm: isAgm ?? this.isAgm,
      isSynonym: isSynonym ?? this.isSynonym,
      isPlantsForPollinators:
          isPlantsForPollinators ?? this.isPlantsForPollinators,
      price: price ?? this.price,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      botanicalName,
      entityDescription,
      image,
      commonName,
      nurseriesCount,
      synonymParentPlantId,
      synonymParentPlantName,
      isAgm,
      isSynonym,
      isPlantsForPollinators,
      price,
    ];
  }
}
