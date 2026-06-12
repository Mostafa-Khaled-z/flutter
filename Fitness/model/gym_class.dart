class GymClass {
  final String name;
  final String description;
  final double price;
  final String img;
  final String coach;
  final String time;
  final String coachImg;
  final String level;
  bool isBooked = false;
  GymClass(
      {required this.name,
      required this.coach,
      required this.coachImg,
      required this.description,
      required this.img,
      required this.time,
      required this.level,
      this.isBooked = false,
      required this.price});
}
