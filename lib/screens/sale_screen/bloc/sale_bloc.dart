import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:krua_pos/models/receipt.dart';

part 'sale_bloc.g.dart';
part 'sale_state.dart';

sealed class SaleEvent {
  SaleEvent();
}

class SaleReady extends SaleEvent {
  SaleReady();
}

class ItemAdded extends SaleEvent {
  ItemAdded(this.barcode);

  final String barcode;
}

class ItemRemoved extends SaleEvent {
  // ItemRemoved(this.item);

  // Map<String, dynamic> item;
  ItemRemoved(this.item);

  String item;
}

class SaleBloc extends Bloc<SaleEvent, SaleState> {
  SaleBloc() : super(SaleState()) {
    on<SaleReady>((event, emit) {
      var receipt = state.receipt;
      print(state.receipt.itemList);
      emit(state.copyWith(receipt: receipt.copyWith(receiptId: '001')));
    });

    on<ItemAdded>(onItemAdded);
  }

  void onItemAdded(ItemAdded event, Emitter<SaleState> emit) {
    var receipt = state.receipt;
    if (receipt.itemList.isEmpty) {
      print('item list is empty');
      receipt = receipt.copyWith(itemList: [event.barcode]);
    } else {
      print('add item');
      receipt.itemList.add(event.barcode);
    }
    
    print(receipt.itemList);
    emit(state.copyWith(receipt: receipt));
  }
}
