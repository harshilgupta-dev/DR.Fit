class Yoga {
  final int id;
  final String name;
  final String image;
  final String step;
  final String category;

  Yoga(
    this.id,
    this.name,
    this.image,
    this.step,
    this.category,
  );
}

List<Yoga> yogaList = [
  Yoga(
    1,
    'Easy Pose',
    'assets/images/yoga/easy-pose.jpg',
    'Sit on your mat in Dandasana (Staff Pose). Bend and widen your knees and cross your shins. Slip each foot beneath the opposite knee and bring the shins toward your torso.\n\nRelax your feet so their outer edges rest comfortably on the floor and the inner arches settle just below the opposite shin. There should be a comfortable gap between your feet and the pelvis.\n\nKeep your pelvis in a neutral position, without tilting forward or back.\n\nLengthen your tail bone toward the floor, firm your shoulder blades against your back to lengthen your upper torso. Don’t over arch your lower back or poke your lower front ribs forward.\n\nEither stack your hands in your lap—one inside the other, palms up—or place them on your knees, palms down.\n\nYou can sit in this position for any length of time, but be sure to alternate the cross of the legs, so that the left leg and right leg have equal time on top.',
    'seated',
  ),
  Yoga(
      2,
      'Tadasana (Mountain Pose)',
      'assets/images/yoga/mountain-pose.jpg',
      'Stand with the feel parallel, a few inches apart. (Alternately you may stand with the bases of your big toes touching, heels slightly apart.\n\nLift and spread your toes and the balls of your feet, then lay them softly back down on the floor. Rock gently back and forth and side to side. Gradually reduce this swaying to a standstill, with your weight balanced evenly across your feet. Feel the energy draw from your feet up through your core.\n\nWithout pushing your lower front ribs forward, lift the top of your sternum straight toward the ceiling. Widen your collarbones. Allow your shoulder blades to draw toward each other and down the back, away from the ears.\n\nLet your arms relax beside your torso, palms facing in or forward.\n\nBalance the crown of your head directly over the center of your pelvis, with the underside of your chin parallel to the floor, throat soft, and tongue wide and flat on the floor of your mouth. Soften your eyes. Breathe.',
      'Standing Posture'),
  Yoga(
    3,
    'Utkatasana (Chair Pose)',
    'assets/images/yoga/chair-pose.jpg',
    'Stand in Tadasana. Inhale and raise your arms overhead so that your biceps are just slightly in front of your ears. Either keep the arms parallel, palms facing inward, or join the palms.\n\nExhale and bend your knees so that your thighs are as parallel to the floor as possible. Your knees will project out over your feet, and your trunk will lean slightly forward over your thighs until your front torso forms approximately a right angle with the tops of your thighs.\n\nKeep your inner thighs parallel to each other and press the heads of the thigh bones down toward your heels.\n\nFirm your shoulder blades against your back. Direct your tailbone down toward the floor and in toward your pubis to keep your lower back long.\n\nStay for 30 seconds to a minute. To come out of this pose, straighten your knees with an inhalation, lifting strongly through your arms. Exhale and release your arms to your sides into Tadasana.',
    'Standing balance',
  ),
];
