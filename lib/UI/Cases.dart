class Cases{
  final List Countries;
 Cases({this.Countries});
 factory Cases.formJson(Map<String , dynamic> json){
   return new Cases(
     Countries: json['Countries'],
   );
 }
}