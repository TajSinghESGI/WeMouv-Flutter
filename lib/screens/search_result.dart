import 'package:esgi_project/components/card_search.dart';
import 'package:esgi_project/controllers/search_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Événements"),
      ),
      body: GetBuilder<SearchEventController>(
        builder: (controller) {
          return _buildListEvent(controller);
        },
      ),
    );
  }

  Widget _buildListEvent(SearchEventController controller) {
    if (controller.searchEvent == null)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (controller.searchEvent.length == 0)
      return Center(
        child: Text("Aucun événements"),
      );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        itemCount: controller.searchEvent.length,
        itemBuilder: (context, index) {
          return CardSearchEvent(controller.searchEvent[index]);
        },
      ),
    );
  }
}