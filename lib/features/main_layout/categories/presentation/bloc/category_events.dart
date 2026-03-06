abstract class CategoryEvents {}

class GetCategoriesEvent extends CategoryEvents {}


class ChangeSelectedCategory extends CategoryEvents{
  int selectedIndex;
  ChangeSelectedCategory(this.selectedIndex);
}
