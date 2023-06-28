class GroupedWeather{
  int min;
  int max;
  String description;
  String icon;
  String day;

  GroupedWeather(
      this.icon,
      this.description,
      this.max,
      this.min,
      this.day
      );

  String minAndMax() => "Min: $min°C - Max: $max°C";
}