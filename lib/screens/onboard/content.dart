
class UnboardingContent{
  String image;
  String title;
  String discription;

  UnboardingContent({required this.image,required this.title,required this.discription});
}

List<UnboardingContent> contents =[
  UnboardingContent(
      image: 'assets/images/Litter In Bin Sign.png',
      title: "Welcome To CleanCity",
      discription: "Keep the City Clean. Avoid Ilegal dumping of deaths  on land and water bodies"),

  UnboardingContent(
      image: 'assets/images/tacker.png',
      title: "Locate TrashCans Arround the City",
      discription: "Easily Loacate trashCans arround the City With this App and dump your deaths.")
];