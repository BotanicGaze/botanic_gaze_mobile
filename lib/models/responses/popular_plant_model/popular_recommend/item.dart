import 'package:equatable/equatable.dart';

class Item extends Equatable {

	const Item({this.id, this.name, this.isAgm, this.price});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				id: json['id'] as int?,
				name: json['name'] as String?,
				isAgm: json['isAgm'] as bool?,
				price: json['price'] as dynamic,
			);
	final int? id;
	final String? name;
	final bool? isAgm;
	final dynamic price;

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'isAgm': isAgm,
				'price': price,
			};

	Item copyWith({
		int? id,
		String? name,
		bool? isAgm,
		dynamic price,
	}) {
		return Item(
			id: id ?? this.id,
			name: name ?? this.name,
			isAgm: isAgm ?? this.isAgm,
			price: price ?? this.price,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [id, name, isAgm, price];
}
