class Excercise {
  final int id;
  final String name;
  final String step;
  final String image;
  final String category;

  Excercise(
    this.id,
    this.name,
    this.step,
    this.image,
    this.category,
  );
}

List<Excercise> excerciseList = [
  Excercise(
      1,
      'Incling Bench Sit-Ups',
      'Sit on the bench with your knees bent. Your feet should be on the inclined side of the bench. \n\nHook your legs under the foot brace or support bar. \n\nLie down so that your upper body is declined, place your hands behind your neck, or cross them over your chest. \n\nRaise yourself from the bench, make sure your abs stay tightened and your back is straight. You should raise up until your upper body is completely vertical. Lower yourself down slowly until the back of your shoulders touch the incline board. Keep your back straight and your abs tight. For a more challenging sit up, you can hold a weight against your chest, with your arms crossed over top of it.',
      'assets/images/2.jpg',
      'abs'),
  Excercise(
      2,
      'Hanging Leg Raises',
      'Muscle: Rectus Abdominis \n\nStep 1: Lie on your back with your hands underneath your tailbone and have your legs straight upward, as illustrated \n\nStep 2: Pull your navel inward and flex your glutes as you lift your hips just a few inches the floor. Then lower your hips.',
      'assets/images/3.jpg',
      'abs'),
  Excercise(3, 'Twisting Hip Raises', '', 'assets/images/4.jpg', 'abs'),
  Excercise(
      4,
      'Bent Leg V Up',
      'Muscle Group: Rectus Abdominis \n\nStep 1: Lie face up on the floor, your arms at your sides. Bend your knees up and hold them still. \n\nStep 2: Quickly lift your torso as you pull your chest to your knees. Keep your arms parallel to the floor.',
      'assets/images/5.jpg',
      'abs'),
  Excercise(
      5,
      '1 2 Burpees',
      '\n\nStart in a staggered fight stance. \n\nPlant your hands on the ground and shoot your legs out to form a plank. \n\nBring your legs back in, plant both feet on the ground and return to your staggered fight stance. \n\nThrow two straight punches, left then right. Again!',
      'assets/images/6.jpg',
      'triceps'),
  Excercise(
      6,
      'Alternating side planks',
      '\n\nFrom a full plank position, shift your weight over to one side and rotate your body so that you can raise your arm. \n\nReturn controlled to plank and repeat on the other side.',
      'assets/images/7.jpeg',
      'triceps')
];
