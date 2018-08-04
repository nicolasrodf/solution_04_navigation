// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:solution_04_navigation/category.dart';
import 'package:solution_04_navigation/unit.dart';

final _backgroundColor = Colors.green[100];

/// Category Route (screen).
/// AQUI SE CREARAN EL APPBAR Y EL LISTVIEW.
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  //Category tiene un array de names
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  //de colors
  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  /// Makes the correct number of rows for the list view.
  ///
  /// For portrait, we use a [ListView].
  /// //Se usa este para crear el listview (que es un widget) a partir de un Array (categories).
  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  /// Returns a list of mock [Unit]s.
  /// //Crea un Array de objetos units a partir del category (se asocia a un indice). Se crean units desde 1 al 10.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1; //inicia en 1
      return Unit( //crea el objeto Unit
        name: '$categoryName Unit $i', //se crearán un name del tipo por ej. Length Unit 5
        conversion: i.toDouble(), //Pone el indice como 5.00
      );
    });
  }

  //Se crea el widget principal con objetos (widget) Category a partir de los "metodos" creados anteriormente donde declaramos e iniciamos el Listview y el Array de objetos "units".
  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    //se llena el array categories con de 0 al tamaño (length) con su nombre,color,icono, y array de units.
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: Icons.cake,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }

    //se llena el listview con su color,padding, y el listview como widget.
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    //el app bar
    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    //crea finalmente el widget tipo Scaffold (el q permite crear distintos widgets en una pantalla) q tiene un appBar y un listview.
    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
