import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trippinr/core/app_export.dart';

class MapController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //
  LocationData? _locationData;
  Set<Marker> _markers = Set();
  BitmapDescriptor? _markerIcon;

  @override
  void onInit() {
    super.onInit();
    _loadMarkerIcon();
  }

  Future<void> _loadMarkerIcon() async {
    final markerIconData = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/marker_icon.png',
    );
    _markerIcon = markerIconData;
  }

  Future<void> getCurrentLocation() async {
    try {
      final location = Location();
      _locationData = await location.getLocation();
      _addMarkers();
      update();
    } catch (e) {
      print('Could not get location: $e');
    }
  }

  void _addMarkers() {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: MarkerId('Current Location'),
        position: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        infoWindow: InfoWindow(title: 'You are here'),
        icon: _markerIcon!,
      ),
    );
    // Call your API to get the nearby locations here and add them to the set of markers
  }

  void moveCameraToCurrentLocation(GoogleMapController controller) async {
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
          zoom: 15,
        ),
      ),
    );
  }

  LocationData get locationData => _locationData!;

  Set<Marker> get markers => _markers;

//
}
