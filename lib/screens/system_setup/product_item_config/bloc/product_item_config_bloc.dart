import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_item_config_event.dart';
part 'product_item_config_state.dart';
part 'product_item_config_bloc.freezed.dart';

class ProductItemConfigBloc extends Bloc<ProductItemConfigEvent, ProductItemConfigState> {
  ProductItemConfigBloc() : super(_Initial()) {
    on<ProductItemConfigEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
