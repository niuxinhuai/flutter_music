import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/sections/home/models/home_module.dart';

class HomeDrawerState implements Cloneable<HomeDrawerState> {
  bool isLogin = true;

  List<DrawerSectionModel>? sectionModels;

  @override
  HomeDrawerState clone() {
    return HomeDrawerState()
      ..isLogin = isLogin
      ..sectionModels = sectionModels;
  }
}

HomeDrawerState initState(Map<String, dynamic>? args) {
  List<DrawerSectionModel> sectionModels = [];
  for (int i = 0; i < HomeModule.drawTitleList.length; ++i) {
    DrawerSectionModel sectionModel = DrawerSectionModel();
    List<String> images = HomeModule.drawImageNamedList[i];
    List<String> titles = HomeModule.drawTitleList[i];
    List<DrawerCellModel> cellModels = [];
    for (int j = 0; j < images.length; ++j) {
      String imageNamed = images[j];
      String title = titles[j];
      DrawerCellModel cellModel = DrawerCellModel();
      cellModel.title = title;
      cellModel.imageNamed = imageNamed;
      cellModels.add(cellModel);
    }
    sectionModel.models = cellModels;
    if (i == 1) {
      sectionModel.title = "音乐服务";
    } else if (i == 2) {
      sectionModel.title = "其他";
    }
    sectionModels.add(sectionModel);
  }

  return HomeDrawerState()..sectionModels = sectionModels;
}
