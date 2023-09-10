import 'package:equatable/equatable.dart';

import 'plus.dart';

class Other extends Equatable {
	final String? id;
	final String? o;
	final String? m;
	final String? s;
	final String? author;
	final String? license;
	final String? date;
	final Plus? plus;
	final String? observationId;
	final bool? hasGeoloc;
	final String? licenseUrl;

	const Other({
		this.id, 
		this.o, 
		this.m, 
		this.s, 
		this.author, 
		this.license, 
		this.date, 
		this.plus, 
		this.observationId, 
		this.hasGeoloc, 
		this.licenseUrl, 
	});

	factory Other.fromJson(Map<String, dynamic> json) => Other(
				id: json['id'] as String?,
				o: json['o'] as String?,
				m: json['m'] as String?,
				s: json['s'] as String?,
				author: json['author'] as String?,
				license: json['license'] as String?,
				date: json['date'] as String?,
				plus: json['plus'] == null
						? null
						: Plus.fromJson(json['plus'] as Map<String, dynamic>),
				observationId: json['observationId'] as String?,
				hasGeoloc: json['hasGeoloc'] as bool?,
				licenseUrl: json['licenseUrl'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'o': o,
				'm': m,
				's': s,
				'author': author,
				'license': license,
				'date': date,
				'plus': plus?.toJson(),
				'observationId': observationId,
				'hasGeoloc': hasGeoloc,
				'licenseUrl': licenseUrl,
			};

	Other copyWith({
		String? id,
		String? o,
		String? m,
		String? s,
		String? author,
		String? license,
		String? date,
		Plus? plus,
		String? observationId,
		bool? hasGeoloc,
		String? licenseUrl,
	}) {
		return Other(
			id: id ?? this.id,
			o: o ?? this.o,
			m: m ?? this.m,
			s: s ?? this.s,
			author: author ?? this.author,
			license: license ?? this.license,
			date: date ?? this.date,
			plus: plus ?? this.plus,
			observationId: observationId ?? this.observationId,
			hasGeoloc: hasGeoloc ?? this.hasGeoloc,
			licenseUrl: licenseUrl ?? this.licenseUrl,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				id,
				o,
				m,
				s,
				author,
				license,
				date,
				plus,
				observationId,
				hasGeoloc,
				licenseUrl,
		];
	}
}
