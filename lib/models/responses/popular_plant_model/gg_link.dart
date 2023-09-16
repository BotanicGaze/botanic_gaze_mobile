import 'package:equatable/equatable.dart';

class GgLink extends Equatable {
	final String? url;

	const GgLink({this.url});

	factory GgLink.fromJson(Map<String, dynamic> json) => GgLink(
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
			};

	GgLink copyWith({
		String? url,
	}) {
		return GgLink(
			url: url ?? this.url,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [url];
}
