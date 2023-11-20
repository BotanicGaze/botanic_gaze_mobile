import 'package:equatable/equatable.dart';

class GgImage extends Equatable {

	const GgImage({
		this.alternativeText, 
		this.uniqueId, 
		this.modified, 
		this.url, 
	});

	factory GgImage.fromJson(Map<String, dynamic> json) => GgImage(
				alternativeText: json['alternativeText'] as String?,
				uniqueId: json['uniqueId'] as String?,
				modified: json['modified'] as String?,
				url: json['url'] as String?,
			);
	final String? alternativeText;
	final String? uniqueId;
	final String? modified;
	final String? url;

	Map<String, dynamic> toJson() => {
				'alternativeText': alternativeText,
				'uniqueId': uniqueId,
				'modified': modified,
				'url': url,
			};

	GgImage copyWith({
		String? alternativeText,
		String? uniqueId,
		String? modified,
		String? url,
	}) {
		return GgImage(
			alternativeText: alternativeText ?? this.alternativeText,
			uniqueId: uniqueId ?? this.uniqueId,
			modified: modified ?? this.modified,
			url: url ?? this.url,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [alternativeText, uniqueId, modified, url];
}
