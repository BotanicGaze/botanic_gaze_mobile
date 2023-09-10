import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:equatable/equatable.dart';

class PlantDetailModel extends Equatable {
  const PlantDetailModel({
    this.id,
    this.synonyms,
    this.isSynonym,
    this.synonymParentPlantId,
    this.synonymParentPlantName,
    this.autoCompleteField,
    this.autoCompleteFieldList,
    this.botanicalName,
    this.botanicalNameUnFormatted,
    this.family,
    this.genus,
    this.entityDescription,
    this.genusDescription,
    this.plantTypes,
    this.foliage,
    this.notedForFragrance,
    this.fragrance,
    this.isNative,
    this.habit,
    this.images,
    this.imageCopyRight,
    this.commonName,
    this.commonNameSortField,
    this.commonNames,
    this.nurseriesCount,
    this.isAgm,
    this.isGenus,
    this.isSpecie,
    this.isPlantsForPollinators,
    this.hardinessLevel,
    this.sunlight,
    this.soilType,
    this.spreadType,
    this.heightType,
    this.spread,
    this.height,
    this.timeToFullHeight,
    this.aspect,
    this.moisture,
    this.ph,
    this.suggestedPlantUses,
    this.plantingPlaces,
    this.exposure,
    this.cultivation,
    this.pestResistance,
    this.diseaseResistance,
    this.pruning,
    this.propagation,
    this.isLowMaintenance,
    this.isDroughtResistance,
    this.supplierUrl,
    this.hortGroupDescription,
    this.range,
    this.toxicity,
    this.seasonOfInterest,
    this.colourWithAttributes,
    this.nameStatus,
    this.hasFullProfile,
    this.seasonColourAgg,
    this.plantEntityId,
    this.gbif,
    this.powo,
    this.links,
    this.plantNetImages,
  });

  factory PlantDetailModel.fromJson(Map<String, dynamic> json) {
    return PlantDetailModel(
      id: json['id'] as int?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => Synonym.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSynonym: json['isSynonym'] as bool?,
      synonymParentPlantId: json['synonymParentPlantId'] as int?,
      synonymParentPlantName: json['synonymParentPlantName'] as dynamic,
      autoCompleteField: json['autoCompleteField'] as String?,
      autoCompleteFieldList: List.castFrom<dynamic, String>(
        json['autoCompleteFieldList'] as List<dynamic>? ?? [],
      ),
      botanicalName: json['botanicalName'] as String?,
      botanicalNameUnFormatted: json['botanicalNameUnFormatted'] as String?,
      family: json['family'] as String?,
      genus: json['genus'] as String?,
      entityDescription: json['entityDescription'] as String?,
      genusDescription: json['genusDescription'] as String?,
      plantTypes: json['plantType'] != null
          ? PlantTypesX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['plantType'] as List<dynamic>,
              ),
            )
          : [],
      foliage: json['foliage'] != null
          ? FoliageX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['foliage'] as List<dynamic>,
              ),
            )
          : [],
      notedForFragrance: json['notedForFragrance'] as bool?,
      fragrance: json['fragrance'] as String?,
      isNative: json['isNative'] as bool?,
      habit: json['habit'] != null
          ? HabitX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['habit'] as List<dynamic>,
              ),
            )
          : [],
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => PlantImageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageCopyRight: json['imageCopyRight'] as String?,
      commonName: json['commonName'] as String?,
      commonNameSortField: json['commonNameSortField'] as String?,
      commonNames: json['commonNames'] as dynamic,
      nurseriesCount: json['nurseriesCount'] as int?,
      isAgm: json['isAgm'] as bool?,
      isGenus: json['isGenus'] as bool?,
      isSpecie: json['isSpecie'] as bool?,
      isPlantsForPollinators: json['isPlantsForPollinators'] as bool?,
      hardinessLevel: json['hardinessLevel'] as int?,
      sunlight: json['sunlight'] != null
          ? SunlightX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['sunlight'] as List<dynamic>,
              ),
            )
          : [],
      soilType: json['soilType'] != null
          ? SoilTypeX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['soilType'] as List<dynamic>,
              ),
            )
          : [],
      spreadType: json['spreadType'] != null
          ? SpreadTypeX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['spreadType'] as List<dynamic>,
              ),
            )
          : [],
      heightType: json['heightType'] != null
          ? HeightTypeX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['heightType'] as List<dynamic>,
              ),
            )
          : [],
      spread: json['spread'] as String?,
      height: json['height'] as String?,
      timeToFullHeight: json['timeToFullHeight'] != null
          ? TimeFullHeightX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['timeToFullHeight'] as List<dynamic>,
              ),
            )
          : [],
      aspect: json['aspect'] != null
          ? AspectTypeX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['aspect'] as List<dynamic>,
              ),
            )
          : [],
      moisture: json['moisture'] != null
          ? MoistureX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['moisture'] as List<dynamic>,
              ),
            )
          : [],
      // ph: List.castFrom(json['ph'] as List<dynamic>? ?? <int>[]),
      ph: json['ph'] != null
          ? PHLevelX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['ph'] as List<dynamic>,
              ),
            )
          : [],
      suggestedPlantUses: List.castFrom(
        json['suggestedPlantUses'] as List<dynamic>? ?? <int>[],
      ),
      plantingPlaces:
          List.castFrom(json['plantingPlaces'] as List<dynamic>? ?? <int>[]),
      exposure: json['exposure'] != null
          ? WeatherExposureX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['exposure'] as List<dynamic>,
              ),
            )
          : [],
      cultivation: json['cultivation'] as String?,
      pestResistance: json['pestResistance'] as String?,
      diseaseResistance: json['diseaseResistance'] as String?,
      pruning: json['pruning'] as String?,
      propagation: json['propagation'] as String?,
      isLowMaintenance: json['isLowMaintenance'] as bool?,
      isDroughtResistance: json['isDroughtResistance'] as bool?,
      supplierUrl: json['supplierURL'] as String?,
      hortGroupDescription: json['hortGroupDescription'] as String?,
      range: json['range'] as String?,
      toxicity: List.castFrom<dynamic, String>(
        json['toxicity'] as List<dynamic>? ?? [],
      ),
      // seasonOfInterest:
      //     List.castFrom(json['seasonOfInterest'] as List<dynamic>? ?? <int>[]),
      seasonOfInterest: json['seasonOfInterest'] != null
          ? SeasonOfInterestX.datasFromListId(
              List.castFrom<dynamic, int>(
                json['seasonOfInterest'] as List<dynamic>,
              ),
            )
          : [],
      colourWithAttributes: (json['colourWithAttributes'] as List<dynamic>?)
          ?.map((e) => ColourWithAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      nameStatus: json['nameStatus'] as String?,
      hasFullProfile: json['hasFullProfile'] as bool?,
      seasonColourAgg:
          List.castFrom(json['seasonColourAgg'] as List<dynamic>? ?? <int>[]),
      plantEntityId: json['plantEntityId'] as String?,
      gbif: json['gbif'] == null
          ? null
          : Gbif.fromJson(json['gbif'] as Map<String, dynamic>),
      powo: json['powo'] == null
          ? null
          : Powo.fromJson(json['powo'] as Map<String, dynamic>),
      links: json['links'] == null
          ? []
          : List.castFrom<dynamic, String>(
              json['links'] as List<dynamic>,
            ),
      // plantNetImages: json['plantNetImages'] == null
      //     ? []
      //     : List.castFrom<dynamic, String>(
      //         json['links'] as List<dynamic>,
      //       ),
      plantNetImages: json['plantNetImages'] == null
          ? null
          : PlantNetImages.fromJson(
              json['plantNetImages'] as Map<String, dynamic>,
            ),
    );
  }

  List<ColourWithAttribute> get colourWithAttributeSpring =>
      colourWithAttributes
          ?.where((e) => e.season == SeasonOfInterest.spring)
          .toList() ??
      [];
  List<ColourWithAttribute> get colourWithAttributeSummer =>
      colourWithAttributes
          ?.where((e) => e.season == SeasonOfInterest.summer)
          .toList() ??
      [];
  List<ColourWithAttribute> get colourWithAttributeAutumn =>
      colourWithAttributes
          ?.where((e) => e.season == SeasonOfInterest.autumn)
          .toList() ??
      [];
  List<ColourWithAttribute> get colourWithAttributeWinter =>
      colourWithAttributes
          ?.where((e) => e.season == SeasonOfInterest.winter)
          .toList() ??
      [];

  final int? id;
  final List<Synonym>? synonyms;
  final bool? isSynonym;
  final int? synonymParentPlantId;
  final dynamic synonymParentPlantName;
  final String? autoCompleteField;
  final List<String>? autoCompleteFieldList;
  final String? botanicalName;
  final String? botanicalNameUnFormatted;
  final String? family;
  final String? genus;
  final String? entityDescription;
  final String? genusDescription;
  final List<PlantType>? plantTypes;
  final List<Foliage>? foliage;
  final bool? notedForFragrance;
  final String? fragrance;
  final bool? isNative;
  final List<Habit>? habit;
  final List<PlantImageDetail>? images;
  final String? imageCopyRight;
  final String? commonName;
  final String? commonNameSortField;
  final dynamic commonNames;
  final int? nurseriesCount;
  final bool? isAgm;
  final bool? isGenus;
  final bool? isSpecie;
  final bool? isPlantsForPollinators;
  final int? hardinessLevel;
  final List<Sunlight>? sunlight;
  final List<SoilType>? soilType;
  final List<SpreadType>? spreadType;
  final List<HeightType>? heightType;
  final String? spread;
  final String? height;
  final List<TimeFullHeight>? timeToFullHeight;
  final List<AspectType>? aspect;
  final List<MoistureType>? moisture;
  final List<PHLevel>? ph;
  final List<int>? suggestedPlantUses;
  final List<int>? plantingPlaces;
  final List<WeatherExposure>? exposure;
  final String? cultivation;
  final String? pestResistance;
  final String? diseaseResistance;
  final String? pruning;
  final String? propagation;
  final bool? isLowMaintenance;
  final bool? isDroughtResistance;
  final String? supplierUrl;
  final String? hortGroupDescription;
  final String? range;
  final List<String>? toxicity;
  final List<SeasonOfInterest>? seasonOfInterest;
  final List<ColourWithAttribute>? colourWithAttributes;
  final String? nameStatus;
  final bool? hasFullProfile;
  final List<int>? seasonColourAgg;
  final String? plantEntityId;
  final Gbif? gbif;
  final Powo? powo;
  final List<String>? links;
  final PlantNetImages? plantNetImages;

  Map<String, dynamic> toJson() => {
        'id': id,
        'synonyms': synonyms?.map((e) => e.toJson()).toList(),
        'isSynonym': isSynonym,
        'synonymParentPlantId': synonymParentPlantId,
        'synonymParentPlantName': synonymParentPlantName,
        'autoCompleteField': autoCompleteField,
        'autoCompleteFieldList': autoCompleteFieldList,
        'botanicalName': botanicalName,
        'botanicalNameUnFormatted': botanicalNameUnFormatted,
        'family': family,
        'genus': genus,
        'entityDescription': entityDescription,
        'genusDescription': genusDescription,
        'plantType': plantTypes,
        'foliage': foliage,
        'notedForFragrance': notedForFragrance,
        'fragrance': fragrance,
        'isNative': isNative,
        'habit': habit,
        'images': images?.map((e) => e.toJson()).toList(),
        'imageCopyRight': imageCopyRight,
        'commonName': commonName,
        'commonNameSortField': commonNameSortField,
        'commonNames': commonNames,
        'nurseriesCount': nurseriesCount,
        'isAgm': isAgm,
        'isGenus': isGenus,
        'isSpecie': isSpecie,
        'isPlantsForPollinators': isPlantsForPollinators,
        'hardinessLevel': hardinessLevel,
        'sunlight': sunlight,
        'soilType': soilType,
        'spreadType': spreadType,
        'heightType': heightType,
        'spread': spread,
        'height': height,
        'timeToFullHeight': timeToFullHeight,
        'aspect': aspect,
        'moisture': moisture,
        'ph': ph,
        'suggestedPlantUses': suggestedPlantUses,
        'plantingPlaces': plantingPlaces,
        'exposure': exposure,
        'cultivation': cultivation,
        'pestResistance': pestResistance,
        'diseaseResistance': diseaseResistance,
        'pruning': pruning,
        'propagation': propagation,
        'isLowMaintenance': isLowMaintenance,
        'isDroughtResistance': isDroughtResistance,
        'supplierURL': supplierUrl,
        'hortGroupDescription': hortGroupDescription,
        'range': range,
        'toxicity': toxicity,
        'seasonOfInterest': seasonOfInterest,
        'colourWithAttributes':
            colourWithAttributes?.map((e) => e.toJson()).toList(),
        'nameStatus': nameStatus,
        'hasFullProfile': hasFullProfile,
        'seasonColourAgg': seasonColourAgg,
        'plantEntityId': plantEntityId,
        'gbif': gbif?.toJson(),
        'powo': powo?.toJson(),
        'links': links?.map((x) => x).toList()
      };

  PlantDetailModel copyWith({
    int? id,
    List<Synonym>? synonyms,
    bool? isSynonym,
    int? synonymParentPlantId,
    dynamic synonymParentPlantName,
    String? autoCompleteField,
    List<String>? autoCompleteFieldList,
    String? botanicalName,
    String? botanicalNameUnFormatted,
    String? family,
    String? genus,
    String? entityDescription,
    String? genusDescription,
    List<PlantType>? plantType,
    List<Foliage>? foliage,
    bool? notedForFragrance,
    String? fragrance,
    bool? isNative,
    List<Habit>? habit,
    List<PlantImageDetail>? images,
    String? imageCopyRight,
    String? commonName,
    String? commonNameSortField,
    dynamic commonNames,
    int? nurseriesCount,
    bool? isAgm,
    bool? isGenus,
    bool? isSpecie,
    bool? isPlantsForPollinators,
    int? hardinessLevel,
    List<Sunlight>? sunlight,
    List<SoilType>? soilType,
    List<SpreadType>? spreadType,
    List<HeightType>? heightType,
    String? spread,
    String? height,
    List<TimeFullHeight>? timeToFullHeight,
    List<AspectType>? aspect,
    List<MoistureType>? moisture,
    List<PHLevel>? ph,
    List<int>? suggestedPlantUses,
    List<int>? plantingPlaces,
    List<WeatherExposure>? exposure,
    String? cultivation,
    String? pestResistance,
    String? diseaseResistance,
    String? pruning,
    String? propagation,
    bool? isLowMaintenance,
    bool? isDroughtResistance,
    String? supplierUrl,
    String? hortGroupDescription,
    String? range,
    List<String>? toxicity,
    List<SeasonOfInterest>? seasonOfInterest,
    List<ColourWithAttribute>? colourWithAttributes,
    String? nameStatus,
    bool? hasFullProfile,
    List<int>? seasonColourAgg,
    String? plantEntityId,
  }) {
    return PlantDetailModel(
      id: id ?? this.id,
      synonyms: synonyms ?? this.synonyms,
      isSynonym: isSynonym ?? this.isSynonym,
      synonymParentPlantId: synonymParentPlantId ?? this.synonymParentPlantId,
      synonymParentPlantName:
          synonymParentPlantName ?? this.synonymParentPlantName,
      autoCompleteField: autoCompleteField ?? this.autoCompleteField,
      autoCompleteFieldList:
          autoCompleteFieldList ?? this.autoCompleteFieldList,
      botanicalName: botanicalName ?? this.botanicalName,
      botanicalNameUnFormatted:
          botanicalNameUnFormatted ?? this.botanicalNameUnFormatted,
      family: family ?? this.family,
      genus: genus ?? this.genus,
      entityDescription: entityDescription ?? this.entityDescription,
      genusDescription: genusDescription ?? this.genusDescription,
      plantTypes: plantType ?? plantTypes,
      foliage: foliage ?? this.foliage,
      notedForFragrance: notedForFragrance ?? this.notedForFragrance,
      fragrance: fragrance ?? this.fragrance,
      isNative: isNative ?? this.isNative,
      habit: habit ?? this.habit,
      images: images ?? this.images,
      imageCopyRight: imageCopyRight ?? this.imageCopyRight,
      commonName: commonName ?? this.commonName,
      commonNameSortField: commonNameSortField ?? this.commonNameSortField,
      commonNames: commonNames ?? this.commonNames,
      nurseriesCount: nurseriesCount ?? this.nurseriesCount,
      isAgm: isAgm ?? this.isAgm,
      isGenus: isGenus ?? this.isGenus,
      isSpecie: isSpecie ?? this.isSpecie,
      isPlantsForPollinators:
          isPlantsForPollinators ?? this.isPlantsForPollinators,
      hardinessLevel: hardinessLevel ?? this.hardinessLevel,
      sunlight: sunlight ?? this.sunlight,
      soilType: soilType ?? this.soilType,
      spreadType: spreadType ?? this.spreadType,
      heightType: heightType ?? this.heightType,
      spread: spread ?? this.spread,
      height: height ?? this.height,
      timeToFullHeight: timeToFullHeight ?? this.timeToFullHeight,
      aspect: aspect ?? this.aspect,
      moisture: moisture ?? this.moisture,
      ph: ph ?? this.ph,
      suggestedPlantUses: suggestedPlantUses ?? this.suggestedPlantUses,
      plantingPlaces: plantingPlaces ?? this.plantingPlaces,
      exposure: exposure ?? this.exposure,
      cultivation: cultivation ?? this.cultivation,
      pestResistance: pestResistance ?? this.pestResistance,
      diseaseResistance: diseaseResistance ?? this.diseaseResistance,
      pruning: pruning ?? this.pruning,
      propagation: propagation ?? this.propagation,
      isLowMaintenance: isLowMaintenance ?? this.isLowMaintenance,
      isDroughtResistance: isDroughtResistance ?? this.isDroughtResistance,
      supplierUrl: supplierUrl ?? this.supplierUrl,
      hortGroupDescription: hortGroupDescription ?? this.hortGroupDescription,
      range: range ?? this.range,
      toxicity: toxicity ?? this.toxicity,
      seasonOfInterest: seasonOfInterest ?? this.seasonOfInterest,
      colourWithAttributes: colourWithAttributes ?? this.colourWithAttributes,
      nameStatus: nameStatus ?? this.nameStatus,
      hasFullProfile: hasFullProfile ?? this.hasFullProfile,
      seasonColourAgg: seasonColourAgg ?? this.seasonColourAgg,
      plantEntityId: plantEntityId ?? this.plantEntityId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      synonyms,
      isSynonym,
      synonymParentPlantId,
      synonymParentPlantName,
      autoCompleteField,
      autoCompleteFieldList,
      botanicalName,
      botanicalNameUnFormatted,
      family,
      genus,
      entityDescription,
      genusDescription,
      plantTypes,
      foliage,
      notedForFragrance,
      fragrance,
      isNative,
      habit,
      images,
      imageCopyRight,
      commonName,
      commonNameSortField,
      commonNames,
      nurseriesCount,
      isAgm,
      isGenus,
      isSpecie,
      isPlantsForPollinators,
      hardinessLevel,
      sunlight,
      soilType,
      spreadType,
      heightType,
      spread,
      height,
      timeToFullHeight,
      aspect,
      moisture,
      ph,
      suggestedPlantUses,
      plantingPlaces,
      exposure,
      cultivation,
      pestResistance,
      diseaseResistance,
      pruning,
      propagation,
      isLowMaintenance,
      isDroughtResistance,
      supplierUrl,
      hortGroupDescription,
      range,
      toxicity,
      seasonOfInterest,
      colourWithAttributes,
      nameStatus,
      hasFullProfile,
      seasonColourAgg,
      plantEntityId,
    ];
  }
}

class Gbif {
  Gbif({
    this.id,
  });

  factory Gbif.fromJson(Map<String, dynamic> json) => Gbif(
        id: json['id'] == null ? null : json['id'].toString(),
      );
  final String? id;

  Gbif copyWith({
    String? id,
  }) =>
      Gbif(
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

class Powo {
  Powo({
    this.id,
  });

  factory Powo.fromJson(Map<String, dynamic> json) => Powo(
        id: json['id'] as String?,
      );
  final String? id;

  Powo copyWith({
    String? id,
  }) =>
      Powo(
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
