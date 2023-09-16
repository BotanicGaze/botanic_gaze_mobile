import 'package:equatable/equatable.dart';

class HeroMobileImage extends Equatable {
	final String? uniqueId;
	final String? modified;
	final String? url;

	const HeroMobileImage({this.uniqueId, this.modified, this.url});

	factory HeroMobileImage.fromJson(Map<String, dynamic> json) {
		return HeroMobileImage(
			uniqueId: json['uniqueId'] as String?,
			modified: json['modified'] as String?,
			url: json['url'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'uniqueId': uniqueId,
				'modified': modified,
				'url': url,
			};

	HeroMobileImage copyWith({
		String? uniqueId,
		String? modified,
		String? url,
	}) {
		return HeroMobileImage(
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
