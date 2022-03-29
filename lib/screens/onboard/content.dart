
class UnboardingContent{
  //String image;
  String title;
  String svgPictures;
  String discription;

  UnboardingContent({ required this.title, required this.discription, required this.svgPictures});
}

List<UnboardingContent> contents =[
  UnboardingContent(
      svgPictures: 'assets/icons/undraw4.svg',
     // image: 'assets/icons/undraw1.svg',
      title: "Welcome To CleanCity",
      discription: "Keep the City Clean. Avoid Ilegal dumping of dirts  on land and water bodies"),

  UnboardingContent(

      svgPictures: 'assets/icons/undraw3.svg',
      //image: 'assets/images/undraw2.svg',
      title: "Locate TrashCans Arround the City",
      discription: "Easily Loacate trashCans arround the City With this App and dump your dirts.")
];