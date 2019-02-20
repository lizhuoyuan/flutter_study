/*
 * author: Created by 李卓原 on 2019/2/19.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  ///显示搜索框右边的图标按钮
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            // 清除搜索内容
            query = '';
            showSuggestions(context);
          })
    ];
  }

  ///显示为搜索框左侧的按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        //关闭搜索页面
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Text(
            query.length == 0 ? '搜索内容不能为空,当然也可以展示推荐的东西' : '你好，我是$query的搜索结果'));
  }

  ///显示建议的搜索内容(搜索热词) ， 点击直接展示相关搜索结果
  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Wrap(
        runSpacing: 10,
        spacing: 20,
        children: searchRecommendationWidget(context),
      ),
    );
  }

  ///搜索热词
  List<Widget> searchRecommendationWidget(BuildContext context) {
    List list = ['斗破苍穹', '遮天', '斗罗大陆', '大主宰', '凡人修仙传', '盗墓笔记', '校花的贴身高手', '诛仙'];
    List<Widget> searchRecommendation = [];
    list.forEach((item) => searchRecommendation.add(InkWell(
          onTap: () {
            query = item;
            showResults(context);
          },
          child: Container(
              padding: EdgeInsets.all(5),
              color: Colors.green,
              child: Text(
                item,
                style: TextStyle(color: Colors.white),
              )),
        )));
    return searchRecommendation;
  }
}
