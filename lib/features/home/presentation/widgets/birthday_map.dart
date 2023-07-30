import 'dart:async';

import 'package:birthday_app/core/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class BirthdayMap extends StatefulWidget {
  const BirthdayMap({super.key});

  @override
  State<BirthdayMap> createState() => _BirthdayMapState();
}

class _BirthdayMapState extends State<BirthdayMap> {
  final _mapControllerCompleter = Completer<YandexMapController>();

  final _moscowPoint = const Point(
    latitude: 55.7522200,
    longitude: 37.6155600,
  );

  Future<void> _moveToMoscow() async {
    await (await _mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _moscowPoint),
      ),
    );
  }

  @override
  void initState() {
    _moveToMoscow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245.h,
      width: 343.w,
      child: YandexMap(
        onMapCreated: _mapControllerCompleter.complete,
        mapObjects: [
          PlacemarkMapObject(
            opacity: 0.8,
            point: _moscowPoint,
            mapId: const MapObjectId('День рождения'),
            text: const PlacemarkText(
              text: 'День рождения',
              style: PlacemarkTextStyle(placement: TextStylePlacement.bottom),
            ),
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  AssetPath.placemark,
                ),
                scale: 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
