import 'dart:convert';

import 'package:botanic_gaze/models/responses/popular_plant_model/genus_type.dart';
import 'package:botanic_gaze/models/responses/popular_plant_model/gg_image.dart';
import 'package:botanic_gaze/models/responses/popular_plant_model/gg_link.dart';
import 'package:botanic_gaze/models/responses/popular_plant_model/hero_image.dart';
import 'package:botanic_gaze/models/responses/popular_plant_model/hero_mobile_image.dart';
import 'package:botanic_gaze/models/responses/popular_plant_model/popular_recommend/popular_recommend.dart';
import 'package:equatable/equatable.dart';

class PopularPlantModel extends Equatable {
  const PopularPlantModel({
    this.name,
    this.heroImage,
    this.heroMobileImage,
    this.heroImageCredit,
    this.introductionText,
    this.looksDescription,
    this.likesDescription,
    this.dislikesDescription,
    this.needToKnowDescription,
    this.plantsWeLove,
    this.ggTitle,
    this.ggImage,
    this.ggSubtitle,
    this.ggText,
    this.ggLink,
    this.adviceLinks,
    this.promoCard,
    this.moreAbout,
    this.inspirationArticles,
    this.genusCarousel,
    this.genusTypes,
    // this.tags,
    this.uniqueId,
    this.id,
    this.displayOrder,
    this.parentId,
    this.modified,
    this.url,
    this.pageType,
    this.pageTemplate,
  });

  factory PopularPlantModel.fromJson(Map<String, dynamic> json) {
    return PopularPlantModel(
      name: json['name'] as String?,
      heroImage: json['heroImage'] == null
          ? null
          : HeroImage.fromJson(json['heroImage'] as Map<String, dynamic>),
      heroMobileImage: json['heroMobileImage'] == null
          ? null
          : HeroMobileImage.fromJson(
              json['heroMobileImage'] as Map<String, dynamic>,
            ),
      heroImageCredit: json['heroImageCredit'] as String?,
      introductionText: json['introductionText'] as String?,
      looksDescription: json['looksDescription'] as String?,
      likesDescription: json['likesDescription'] as String?,
      dislikesDescription: json['dislikesDescription'] as String?,
      needToKnowDescription: json['needToKnowDescription'] as String?,
      plantsWeLove: json['plantsWeLove'] != null
          ? PopularRecommend.fromJson(
              jsonDecode(json['plantsWeLove'].toString())
                  as Map<String, dynamic>,
            )
          : null,
      ggTitle: json['ggTitle'] as String?,
      ggImage: json['ggImage'] == null
          ? null
          : GgImage.fromJson(json['ggImage'] as Map<String, dynamic>),
      ggSubtitle: json['ggSubtitle'] as String?,
      ggText: json['ggText'] as String?,
      ggLink: json['ggLink'] == null
          ? null
          : GgLink.fromJson(json['ggLink'] as Map<String, dynamic>),
      adviceLinks: json['adviceLinks'] as String?,
      promoCard: json['promoCard'] as String?,
      moreAbout: json['moreAbout'] as String?,
      inspirationArticles: json['inspirationArticles'] as String?,
      genusCarousel: json['genusCarousel'] as String?,
      genusTypes: (json['genusTypes'] as List<dynamic>?)
          ?.map((e) => GenusType.fromJson(e as Map<String, dynamic>))
          .toList(),
      // tags: (json['tags'] as List<dynamic>?)
      //     ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      uniqueId: json['uniqueId'] as String?,
      id: json['id'] as int?,
      displayOrder: json['displayOrder'] as int?,
      parentId: json['parentId'] as int?,
      modified: json['modified'] == null
          ? null
          : DateTime.parse(json['modified'] as String),
      url: json['url'] as String?,
      pageType: json['pageType'] as String?,
      pageTemplate: json['pageTemplate'] as String?,
    );
  }
  final String? name;
  final HeroImage? heroImage;
  final HeroMobileImage? heroMobileImage;
  final String? heroImageCredit;
  final String? introductionText;
  final String? looksDescription;
  final String? likesDescription;
  final String? dislikesDescription;
  final String? needToKnowDescription;
  final PopularRecommend? plantsWeLove;
  final String? ggTitle;
  final GgImage? ggImage;
  final String? ggSubtitle;
  final String? ggText;
  final GgLink? ggLink;
  final String? adviceLinks;
  final String? promoCard;
  final String? moreAbout;
  final String? inspirationArticles;
  final String? genusCarousel;
  final List<GenusType>? genusTypes;
  // final List<Tag>? tags;
  final String? uniqueId;
  final int? id;
  final int? displayOrder;
  final int? parentId;
  final DateTime? modified;
  final String? url;
  final String? pageType;
  final String? pageTemplate;

  Map<String, dynamic> toJson() => {
        'name': name,
        'heroImage': heroImage?.toJson(),
        'heroMobileImage': heroMobileImage?.toJson(),
        'heroImageCredit': heroImageCredit,
        'introductionText': introductionText,
        'looksDescription': looksDescription,
        'likesDescription': likesDescription,
        'dislikesDescription': dislikesDescription,
        'needToKnowDescription': needToKnowDescription,
        'plantsWeLove': plantsWeLove,
        'ggTitle': ggTitle,
        'ggImage': ggImage?.toJson(),
        'ggSubtitle': ggSubtitle,
        'ggText': ggText,
        'ggLink': ggLink?.toJson(),
        'adviceLinks': adviceLinks,
        'promoCard': promoCard,
        'moreAbout': moreAbout,
        'inspirationArticles': inspirationArticles,
        'genusCarousel': genusCarousel,
        'genusTypes': genusTypes?.map((e) => e.toJson()).toList(),
        // 'tags': tags?.map((e) => e.toJson()).toList(),
        'uniqueId': uniqueId,
        'id': id,
        'displayOrder': displayOrder,
        'parentId': parentId,
        'modified': modified?.toIso8601String(),
        'url': url,
        'pageType': pageType,
        'pageTemplate': pageTemplate,
      };

  PopularPlantModel copyWith({
    String? name,
    HeroImage? heroImage,
    HeroMobileImage? heroMobileImage,
    String? heroImageCredit,
    String? introductionText,
    String? looksDescription,
    String? likesDescription,
    String? dislikesDescription,
    String? needToKnowDescription,
    PopularRecommend? plantsWeLove,
    String? ggTitle,
    GgImage? ggImage,
    String? ggSubtitle,
    String? ggText,
    GgLink? ggLink,
    String? adviceLinks,
    String? promoCard,
    String? moreAbout,
    String? inspirationArticles,
    String? genusCarousel,
    List<GenusType>? genusTypes,
    // List<Tag>? tags,
    String? uniqueId,
    int? id,
    int? displayOrder,
    int? parentId,
    DateTime? modified,
    String? url,
    String? pageType,
    String? pageTemplate,
  }) {
    return PopularPlantModel(
      name: name ?? this.name,
      heroImage: heroImage ?? this.heroImage,
      heroMobileImage: heroMobileImage ?? this.heroMobileImage,
      heroImageCredit: heroImageCredit ?? this.heroImageCredit,
      introductionText: introductionText ?? this.introductionText,
      looksDescription: looksDescription ?? this.looksDescription,
      likesDescription: likesDescription ?? this.likesDescription,
      dislikesDescription: dislikesDescription ?? this.dislikesDescription,
      needToKnowDescription:
          needToKnowDescription ?? this.needToKnowDescription,
      plantsWeLove: plantsWeLove ?? this.plantsWeLove,
      ggTitle: ggTitle ?? this.ggTitle,
      ggImage: ggImage ?? this.ggImage,
      ggSubtitle: ggSubtitle ?? this.ggSubtitle,
      ggText: ggText ?? this.ggText,
      ggLink: ggLink ?? this.ggLink,
      adviceLinks: adviceLinks ?? this.adviceLinks,
      promoCard: promoCard ?? this.promoCard,
      moreAbout: moreAbout ?? this.moreAbout,
      inspirationArticles: inspirationArticles ?? this.inspirationArticles,
      genusCarousel: genusCarousel ?? this.genusCarousel,
      genusTypes: genusTypes ?? this.genusTypes,
      // tags: tags ?? this.tags,
      uniqueId: uniqueId ?? this.uniqueId,
      id: id ?? this.id,
      displayOrder: displayOrder ?? this.displayOrder,
      parentId: parentId ?? this.parentId,
      modified: modified ?? this.modified,
      url: url ?? this.url,
      pageType: pageType ?? this.pageType,
      pageTemplate: pageTemplate ?? this.pageTemplate,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      heroImage,
      heroMobileImage,
      heroImageCredit,
      introductionText,
      looksDescription,
      likesDescription,
      dislikesDescription,
      needToKnowDescription,
      plantsWeLove,
      ggTitle,
      ggImage,
      ggSubtitle,
      ggText,
      ggLink,
      adviceLinks,
      promoCard,
      moreAbout,
      inspirationArticles,
      genusCarousel,
      genusTypes,
      // tags,
      uniqueId,
      id,
      displayOrder,
      parentId,
      modified,
      url,
      pageType,
      pageTemplate,
    ];
  }
}
