import 'package:botanic_gaze/models/responses/plant_identify_model/image_plant.dart';
import 'package:equatable/equatable.dart';

class Plant extends Equatable {
  const Plant({
    this.providerPlantId,
    this.providerName,
    this.providerPlantName,
    this.providerPreferredCommonPlantName,
    this.score,
    this.scoreConfidenceCode,
    this.isTopMatch,
    this.images,
    this.isFoundRhsMapping,
    this.rhsPlantId,
    this.rhsPlantEntityNumber,
    this.rhsPlantName,
    this.rhsPreferredCommonName,
    this.rhsPlantProfileUrl,
    this.rhsPlantImageUrl,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        providerPlantId: json['providerPlantId'] as String?,
        providerName: json['providerName'] as String?,
        providerPlantName: json['providerPlantName'] as String?,
        providerPreferredCommonPlantName:
            json['providerPreferredCommonPlantName'] as String?,
        score: (json['score'] as num?)?.toDouble(),
        scoreConfidenceCode: json['scoreConfidenceCode'] as String?,
        isTopMatch: json['isTopMatch'] as bool?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => ImagePlant.fromJson(e as Map<String, dynamic>))
            .toList(),
        isFoundRhsMapping: json['isFoundRhsMapping'] as bool?,
        rhsPlantId: json['rhsPlantId'] as String?,
        rhsPlantEntityNumber: json['rhsPlantEntityNumber'] as String?,
        rhsPlantName: json['rhsPlantName'] as String?,
        rhsPreferredCommonName: json['rhsPreferredCommonName'] as String?,
        rhsPlantProfileUrl: json['rhsPlantProfileUrl'] as String?,
        rhsPlantImageUrl: json['rhsPlantImageUrl'] as String?,
      );
  final String? providerPlantId;
  final String? providerName;
  final String? providerPlantName;
  final String? providerPreferredCommonPlantName;
  final double? score;
  final String? scoreConfidenceCode;
  final bool? isTopMatch;
  final List<ImagePlant>? images;
  final bool? isFoundRhsMapping;
  final String? rhsPlantId;
  final String? rhsPlantEntityNumber;
  final String? rhsPlantName;
  final String? rhsPreferredCommonName;
  final String? rhsPlantProfileUrl;
  final String? rhsPlantImageUrl;

  String get scoreFormat => '${((score ?? 0) * 100).toStringAsFixed(2)}%';
  String get featureImage {
    try {
      return images?.first.originalImageUrl ?? '';
    } catch (e) {
      return '';
    }
  }

  Map<String, dynamic> toJson() => {
        'providerPlantId': providerPlantId,
        'providerName': providerName,
        'providerPlantName': providerPlantName,
        'providerPreferredCommonPlantName': providerPreferredCommonPlantName,
        'score': score,
        'scoreConfidenceCode': scoreConfidenceCode,
        'isTopMatch': isTopMatch,
        'images': images?.map((e) => e.toJson()).toList(),
        'isFoundRhsMapping': isFoundRhsMapping,
        'rhsPlantId': rhsPlantId,
        'rhsPlantEntityNumber': rhsPlantEntityNumber,
        'rhsPlantName': rhsPlantName,
        'rhsPreferredCommonName': rhsPreferredCommonName,
        'rhsPlantProfileUrl': rhsPlantProfileUrl,
        'rhsPlantImageUrl': rhsPlantImageUrl,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      providerPlantId,
      providerName,
      providerPlantName,
      providerPreferredCommonPlantName,
      score,
      scoreConfidenceCode,
      isTopMatch,
      images,
      isFoundRhsMapping,
      rhsPlantId,
      rhsPlantEntityNumber,
      rhsPlantName,
      rhsPreferredCommonName,
      rhsPlantProfileUrl,
      rhsPlantImageUrl,
    ];
  }

  Plant copyWith({
    String? providerPlantId,
    String? providerName,
    String? providerPlantName,
    String? providerPreferredCommonPlantName,
    double? score,
    String? scoreConfidenceCode,
    bool? isTopMatch,
    List<ImagePlant>? images,
    bool? isFoundRhsMapping,
    String? rhsPlantId,
    String? rhsPlantEntityNumber,
    String? rhsPlantName,
    String? rhsPreferredCommonName,
    String? rhsPlantProfileUrl,
    String? rhsPlantImageUrl,
  }) {
    return Plant(
      providerPlantId: providerPlantId ?? this.providerPlantId,
      providerName: providerName ?? this.providerName,
      providerPlantName: providerPlantName ?? this.providerPlantName,
      providerPreferredCommonPlantName: providerPreferredCommonPlantName ??
          this.providerPreferredCommonPlantName,
      score: score ?? this.score,
      scoreConfidenceCode: scoreConfidenceCode ?? this.scoreConfidenceCode,
      isTopMatch: isTopMatch ?? this.isTopMatch,
      images: images ?? this.images,
      isFoundRhsMapping: isFoundRhsMapping ?? this.isFoundRhsMapping,
      rhsPlantId: rhsPlantId ?? this.rhsPlantId,
      rhsPlantEntityNumber: rhsPlantEntityNumber ?? this.rhsPlantEntityNumber,
      rhsPlantName: rhsPlantName ?? this.rhsPlantName,
      rhsPreferredCommonName:
          rhsPreferredCommonName ?? this.rhsPreferredCommonName,
      rhsPlantProfileUrl: rhsPlantProfileUrl ?? this.rhsPlantProfileUrl,
      rhsPlantImageUrl: rhsPlantImageUrl ?? this.rhsPlantImageUrl,
    );
  }
}
