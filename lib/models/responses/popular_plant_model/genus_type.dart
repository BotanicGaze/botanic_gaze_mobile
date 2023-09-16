import 'package:equatable/equatable.dart';

class GenusType extends Equatable {
	final String? name;
	final String? uniqueId;
	final int? id;
	final int? displayOrder;
	final String? modified;

	const GenusType({
		this.name, 
		this.uniqueId, 
		this.id, 
		this.displayOrder, 
		this.modified, 
	});

	factory GenusType.fromJson(Map<String, dynamic> json) => GenusType(
				name: json['name'] as String?,
				uniqueId: json['uniqueId'] as String?,
				id: json['id'] as int?,
				displayOrder: json['displayOrder'] as int?,
				modified: json['modified'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'uniqueId': uniqueId,
				'id': id,
				'displayOrder': displayOrder,
				'modified': modified,
			};

	GenusType copyWith({
		String? name,
		String? uniqueId,
		int? id,
		int? displayOrder,
		String? modified,
	}) {
		return GenusType(
			name: name ?? this.name,
			uniqueId: uniqueId ?? this.uniqueId,
			id: id ?? this.id,
			displayOrder: displayOrder ?? this.displayOrder,
			modified: modified ?? this.modified,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [name, uniqueId, id, displayOrder, modified];
}
