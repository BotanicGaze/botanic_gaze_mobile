import 'package:botanic_gaze/constants/index.dart';
import 'package:equatable/equatable.dart';

class ColourWithAttribute extends Equatable {
  const ColourWithAttribute({this.season, this.colour, this.attributeType});

  factory ColourWithAttribute.fromJson(Map<String, dynamic> json) {
    return ColourWithAttribute(
      season: SeasonOfInterestX.dataFromId(json['season'] as int?),
      colour: ColourTypeX.dataById(json['colour'] as int?),
      attributeType: AttributeTypeX.dataById(json['attributeType'] as int?),
    );
  }
  final SeasonOfInterest? season;
  final ColourType? colour;
  final AttributeType? attributeType;

  Map<String, dynamic> toJson() => {
        'season': season,
        'colour': colour,
        'attributeType': attributeType,
      };

  ColourWithAttribute copyWith({
    SeasonOfInterest? season,
    ColourType? colour,
    AttributeType? attributeType,
  }) {
    return ColourWithAttribute(
      season: season ?? this.season,
      colour: colour ?? this.colour,
      attributeType: attributeType ?? this.attributeType,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [season, colour, attributeType];
}
