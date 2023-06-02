import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';
import 'Restaurent_Product_model.dart';

class MockData {


  static List<ExampleSection> getExampleSections(int sectionSize,itemSize,List<Data> check
      ) {
    var sections = List<ExampleSection>.empty(growable: true);
    for (int i = 0; i < sectionSize; i++) {
      var section = ExampleSection()
        ..header = check[i].title.toString()
        ..items = List.generate(check[i].submenuCount!.toInt(), (index) => "View #$index")
        ..expanded = true;
      sections.add(section);
    }
    return sections;
  }
}
class ExampleSection implements ExpandableListSection<String> {
  //store expand state.
  late bool expanded;

  //return item model list.
  late List<String> items;

  //example header, optional
  late String header;

  @override
  List<String> getItems() {
    return items;
  }

  @override
  bool isSectionExpanded() {
    return expanded;
  }

  @override
  void setSectionExpanded(bool expanded) {
    this.expanded = expanded;
  }
}
