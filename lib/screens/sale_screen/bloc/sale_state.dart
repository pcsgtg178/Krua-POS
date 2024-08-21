part of 'sale_bloc.dart';

enum ScreenStatus { initial, loading, success, failure }

extension ScreenStatusX on ScreenStatus {
  bool get isInitial => this == ScreenStatus.initial;
  bool get isLoading => this == ScreenStatus.loading;
  bool get isSuccess => this == ScreenStatus.success;
  bool get isFailure => this == ScreenStatus.failure;
}

@JsonSerializable()
class SaleState {
  SaleState({
    this.status = ScreenStatus.initial,
    Receipt? receipt
  }) : receipt = receipt ?? Receipt.empty;

  factory SaleState.fromJson(Map<String, dynamic> json) => _$SaleStateFromJson(json);

  final ScreenStatus status;
  final Receipt receipt;

  SaleState copyWith({
    ScreenStatus? status,
    Receipt? receipt,
  }) {
    return SaleState(
      status: status ?? this.status,
      receipt: receipt ?? this.receipt,
    );
  }

  Map<String, dynamic> toJson() => _$SaleStateToJson(this);
}
