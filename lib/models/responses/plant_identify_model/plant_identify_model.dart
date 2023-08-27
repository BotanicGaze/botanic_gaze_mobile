import 'package:botanic_gaze/models/responses/plant_identify_model/plant.dart';
import 'package:equatable/equatable.dart';

class PlantIdentifyModel extends Equatable {
  const PlantIdentifyModel({
    this.resultReferenceId,
    this.isResultSaved,
    this.isDisplayLowScoreMessage,
    this.plants,
    this.plantImageMetaDataId,
    this.blobSasUri,
    this.imageReferenceId,
    this.requestReferenceId,
    this.sessionReferenceId,
    this.userReferenceId,
  });

  factory PlantIdentifyModel.fromJson(Map<String, dynamic> json) {
    return PlantIdentifyModel(
      resultReferenceId: json['resultReferenceId'] as String?,
      isResultSaved: json['isResultSaved'] as bool?,
      isDisplayLowScoreMessage: json['isDisplayLowScoreMessage'] as bool?,
      plants: (json['plants'] as List<dynamic>?)
          ?.map((e) => Plant.fromJson(e as Map<String, dynamic>))
          .toList(),
      plantImageMetaDataId: json['plantImageMetaDataId'] as String?,
      blobSasUri: json['blobSasUri'] as String?,
      imageReferenceId: json['imageReferenceId'] as String?,
      requestReferenceId: json['requestReferenceId'] as String?,
      sessionReferenceId: json['sessionReferenceId'] as String?,
      userReferenceId: json['userReferenceId'] as String?,
    );
  }
  final String? resultReferenceId;
  final bool? isResultSaved;
  final bool? isDisplayLowScoreMessage;
  final List<Plant>? plants;
  final String? plantImageMetaDataId;
  final String? blobSasUri;
  final String? imageReferenceId;
  final String? requestReferenceId;
  final String? sessionReferenceId;
  final String? userReferenceId;

  Map<String, dynamic> toJson() => {
        'resultReferenceId': resultReferenceId,
        'isResultSaved': isResultSaved,
        'isDisplayLowScoreMessage': isDisplayLowScoreMessage,
        'plants': plants?.map((e) => e.toJson()).toList(),
        'plantImageMetaDataId': plantImageMetaDataId,
        'blobSasUri': blobSasUri,
        'imageReferenceId': imageReferenceId,
        'requestReferenceId': requestReferenceId,
        'sessionReferenceId': sessionReferenceId,
        'userReferenceId': userReferenceId,
      };

  PlantIdentifyModel copyWith({
    String? resultReferenceId,
    bool? isResultSaved,
    bool? isDisplayLowScoreMessage,
    List<Plant>? plants,
    String? plantImageMetaDataId,
    String? blobSasUri,
    String? imageReferenceId,
    String? requestReferenceId,
    String? sessionReferenceId,
    String? userReferenceId,
  }) {
    return PlantIdentifyModel(
      resultReferenceId: resultReferenceId ?? this.resultReferenceId,
      isResultSaved: isResultSaved ?? this.isResultSaved,
      isDisplayLowScoreMessage:
          isDisplayLowScoreMessage ?? this.isDisplayLowScoreMessage,
      plants: plants ?? this.plants,
      plantImageMetaDataId: plantImageMetaDataId ?? this.plantImageMetaDataId,
      blobSasUri: blobSasUri ?? this.blobSasUri,
      imageReferenceId: imageReferenceId ?? this.imageReferenceId,
      requestReferenceId: requestReferenceId ?? this.requestReferenceId,
      sessionReferenceId: sessionReferenceId ?? this.sessionReferenceId,
      userReferenceId: userReferenceId ?? this.userReferenceId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      resultReferenceId,
      isResultSaved,
      isDisplayLowScoreMessage,
      plants,
      plantImageMetaDataId,
      blobSasUri,
      imageReferenceId,
      requestReferenceId,
      sessionReferenceId,
      userReferenceId,
    ];
  }
}
