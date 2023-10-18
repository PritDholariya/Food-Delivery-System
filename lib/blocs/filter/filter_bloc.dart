import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/filter_model.dart';
// import '/blocs/blocs.dart';
import '/models/models.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading());

  // @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    if (event is FilterLoaded) {
      yield* _mapFilterLoadToState();
    }
    if (event is UpdateCategoryFilter) {
      yield* _mapCategoryFilterUpdatedToState(event, state);
    }
    if (event is UpdatePriceFilter) {
      yield* _mapPriceFilterUpdatedToState(event, state);
    }
  }
    Stream<FilterState> _mapFilterLoadToState() async* {
      yield FilterLoaded(
        filter: Filter(
          categoryFilters: CategoryFilter.filters,
          priceFilters: PriceFilter.filters,
        ),
      );
    }

    Stream<FilterState> _mapCategoryFilterUpdatedToState(
      UpdateCategoryFilter event,
      FilterState state,
    ) async* {
      if (state is FilterLoaded) {
        final List<CategoryFilter> updatedCategoryFilters =
            state.filter.categoryFilters.map((categoryFilter) {
          return categoryFilter.id == event.categoryFilter.id
              ? event.categoryFilter
              : categoryFilter;
        }).toList();

        yield FilterLoaded(
          filter: Filter(
            categoryFilters: updatedCategoryFilters,
            priceFilters: state.filter.priceFilters,
          ),
        );
      }
    }

    Stream<FilterState> _mapPriceFilterUpdatedToState(
      UpdatePriceFilter event,
      FilterState state,
    ) async* {
      if (state is FilterLoaded) {
        final List<PriceFilter> updatedPriceFilters =
            state.filter.priceFilters.map((priceFilter) {
          return priceFilter.id == event.priceFilter.id
              ? event.priceFilter
              : priceFilter;
        }).toList();

        yield FilterLoaded(
          filter: Filter(
            categoryFilters: state.filter.categoryFilters,
            priceFilters: updatedPriceFilters,
          ),
        );
      }
    }
  }

