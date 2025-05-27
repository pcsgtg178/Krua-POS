part of 'product_item_config_bloc.dart';

@freezed
class ProductItemConfigEvent with _$ProductItemConfigEvent {
  const factory ProductItemConfigEvent.started() = _Started;
}