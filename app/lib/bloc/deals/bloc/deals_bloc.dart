import 'package:app/model/broker/broker.dart';
import 'package:app/model/deals.dart';
import 'package:app/model/deals.dart';
import 'package:app/model/deals.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/repository/deals_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deals_event.dart';
part 'deals_state.dart';

class DealsBloc extends Bloc<DealsEvent, DealsState> {
  final DealsRepository dealsRepository;

  DealsBloc({required this.dealsRepository})
      : super(DealsInitial(deals: Deals()));
  @override
  Stream<DealsState> mapEventToState(DealsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is DealsInitializationEvent) {
    } else if (event is DealsCreateEvent) {
      // get logged in broker information
      UserPreferences userPreference = new UserPreferences();
      Broker broker = await userPreference.getBrokerInformation() as Broker;
      Deals deals = event.deals;
      deals.broker = broker;
      print("delivery Model: ${event.deals.productModel}");
      // deals create method
      // deals create loading
      yield DealsCreating(deals: event.deals);
// call the delivery method call
      bool isCreated =
          await this.dealsRepository.createDeals(state.deals as Deals);
      if (isCreated == true) {
        // delivery created successfully
        yield DealsCreateSuccess(deals: state.deals as Deals);
      } else {
        // delivervy created failed
        yield DealsCreateFailed(deals: state.deals as Deals);
      }

    }
  }
}
