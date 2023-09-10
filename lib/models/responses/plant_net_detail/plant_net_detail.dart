import 'package:botanic_gaze/models/index.dart';
import 'package:equatable/equatable.dart';

class PlantNetDetail extends Equatable {
  const PlantNetDetail({
    this.species,
    this.family,
    this.genus,
    this.projects,
    this.commonNames,
    this.synonyms,
    this.links,
    this.tags,
    this.images,
    this.imagesCount,
    this.observationsCount,
    this.synonymsDetails,
    this.gbif,
    this.powo,
    this.map,
  });

  factory PlantNetDetail.fromJson(Map<String, dynamic> json) {
    return PlantNetDetail(
      species: json['species'] == null
          ? null
          : Species.fromJson(json['species'] as Map<String, dynamic>),
      family: json['family'] == null
          ? null
          : Family.fromJson(json['family'] as Map<String, dynamic>),
      genus: json['genus'] == null
          ? null
          : Genus.fromJson(json['genus'] as Map<String, dynamic>),
      projects: List.castFrom<dynamic, String>(
        json['projects'] as List? ?? [],
      ),
      commonNames: List.castFrom<dynamic, String>(
        json['commonNames'] as List? ?? [],
      ),
      synonyms: List.castFrom<dynamic, String>(
        json['synonyms'] as List? ?? [],
      ),
      links: List.castFrom<dynamic, String>(json['links'] as List? ?? []),
      // tags: json['tags'] as List<dynamic>?,
      images: json['images'] == null
          ? null
          : PlantNetImages.fromJson(json['images'] as Map<String, dynamic>),
      imagesCount: json['imagesCount'] as int?,
      observationsCount: json['observationsCount'] as int?,
      synonymsDetails: (json['synonymsDetails'] as List<dynamic>?)
          ?.map((e) => SynonymsDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      gbif: json['gbif'] == null
          ? null
          : Gbif.fromJson(json['gbif'] as Map<String, dynamic>),
      powo: json['powo'] == null
          ? null
          : Powo.fromJson(json['powo'] as Map<String, dynamic>),
      map: json['map'] as String?,
    );
  }
  final Species? species;
  final Family? family;
  final Genus? genus;
  final List<String>? projects;
  final List<String>? commonNames;
  final List<String>? synonyms;
  final List<String>? links;
  final List<dynamic>? tags;
  final PlantNetImages? images;
  final int? imagesCount;
  final int? observationsCount;
  final List<SynonymsDetail>? synonymsDetails;
  final Gbif? gbif;
  final Powo? powo;
  final String? map;

  Map<String, dynamic> toJson() => {
        'species': species?.toJson(),
        'family': family?.toJson(),
        'genus': genus?.toJson(),
        'projects': projects,
        'commonNames': commonNames,
        'synonyms': synonyms,
        'links': links,
        'tags': tags,
        'images': images?.toJson(),
        'imagesCount': imagesCount,
        'observationsCount': observationsCount,
        'synonymsDetails': synonymsDetails?.map((e) => e.toJson()).toList(),
        'gbif': gbif?.toJson(),
        'powo': powo?.toJson(),
        'map': map,
      };

  PlantNetDetail copyWith({
    Species? species,
    Family? family,
    Genus? genus,
    List<String>? projects,
    List<String>? commonNames,
    List<String>? synonyms,
    List<String>? links,
    List<dynamic>? tags,
    PlantNetImages? images,
    int? imagesCount,
    int? observationsCount,
    List<SynonymsDetail>? synonymsDetails,
    Gbif? gbif,
    Powo? powo,
    String? map,
  }) {
    return PlantNetDetail(
      species: species ?? this.species,
      family: family ?? this.family,
      genus: genus ?? this.genus,
      projects: projects ?? this.projects,
      commonNames: commonNames ?? this.commonNames,
      synonyms: synonyms ?? this.synonyms,
      links: links ?? this.links,
      tags: tags ?? this.tags,
      images: images ?? this.images,
      imagesCount: imagesCount ?? this.imagesCount,
      observationsCount: observationsCount ?? this.observationsCount,
      synonymsDetails: synonymsDetails ?? this.synonymsDetails,
      gbif: gbif ?? this.gbif,
      powo: powo ?? this.powo,
      map: map ?? this.map,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      species,
      family,
      genus,
      projects,
      commonNames,
      synonyms,
      links,
      tags,
      images,
      imagesCount,
      observationsCount,
      synonymsDetails,
      gbif,
      powo,
      map,
    ];
  }
}
