import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';


class MockData {




  static List<ExampleSection> getExampleSections (
      [int sectionSize = 9, int itemSize = 5]) {
    var sections = List<ExampleSection>.empty(growable: true);
    for (int i = 0; i < sectionSize; i++) {
      var section = ExampleSection()
        ..title = "Recommanded $i"
        ..items = List.generate(itemSize, (index) => "View #$index")
        ..expanded = true;
      sections.add(section);
    }
    return sections;
  }
}



class ExampleSection implements ExpandableListSection<String> {
  

  late bool expanded;

  
  late List<String> items;

 
  late String title;

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
