import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  const Coin({this.coinBalance});

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        coinBalance: json['coinBalance'] as int?,
      );
  final int? coinBalance;

  Map<String, dynamic> toJson() => {
        'coinBalance': coinBalance,
      };

  Coin copyWith({
    int? coinBalance,
  }) {
    return Coin(
      coinBalance: coinBalance ?? this.coinBalance,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [coinBalance];
}
