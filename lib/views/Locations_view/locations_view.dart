import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/views/Locations_view/location_listview.dart';
import 'package:rick_and_morty/views/widgets/decorated_container.dart';

import '../widgets/appbar_widget.dart';
import 'location_viewmodel.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  @override
  void initState() {
    super.initState();
    context.read<LocationViewmodel>().getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppBarWidget(
          title: 'Konumlar',
          transparentBackground: true,
        ),
        body: Center(
          child: DecoratedContainer(
            topChild: const SizedBox(height: 74),
            child: _locationListView(),
          ),
        ),
      ),
    );
  }

  Flexible _locationListView() {
    return Flexible(
      child: Consumer<LocationViewmodel>(
        builder: (context, viewModel, child) {
          if (viewModel.locationModel == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 30),
              child: LocationListView(
                locationModel: viewModel.locationModel!,
                onLoadMore: viewModel.getMoreLocation,
                loadMore: viewModel.loadMore,
              ),
            );
          }
        },
      ),
    );
  }
}