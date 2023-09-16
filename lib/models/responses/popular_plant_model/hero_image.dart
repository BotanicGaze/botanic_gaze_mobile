import 'package:equatable/equatable.dart';

class HeroImage extends Equatable {
	final String? uniqueId;
	final String? modified;
	final String? url;

	const HeroImage({this.uniqueId, this.modified, this.url});

	factory HeroImage.fromJson(Map<String, dynamic> json) => HeroImage(
				uniqueId: json['uniqueId'] as String?,
				modified: json['modified'] as String?,
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'uniqueId': uniqueId,
				'modified': modified,
				'url': url,
			};

	HeroImage copyWith({
		String? uniqueId,
		String? modified,
		String? url,
	}) {
		return HeroImage(
			uniqueId: uniqueId ?? this.uniqueId,
			modified: modified ?? this.modified,
			url: url ?? this.url,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [uniqueId, modified, url];
}
