class Meditation {
  final int id;
  final String name;
  final String image;
  final String step;
  final String category;

  Meditation(
    this.id,
    this.name,
    this.image,
    this.step,
    this.category,
  );
}

List<Meditation> meditationList = [
  Meditation(
    1,
    'Body scan',
    'assets/images/meditation/body_scan.jpg',
    'Often, our body is doing one thing while our mind is elsewhere. This technique is designed to sync body and mind by performing a mental scan, from the top of the head to the end of your toes. Imagine a photocopier light slowly moving over your body, bringing attention to any discomfort, sensations, tensions, or aches that exist.',
    'Meditation',
  ),
  Meditation(
    2,
    'Noting',
    'assets/images/meditation/noting.jpg',
    'Whether you are focusing on the breath or simply sitting in quiet, this technique involves specifically “noting” what’s distracting the mind, to the extent that we are so caught up in a thought or emotion that we’ve lost our awareness of the breath (or whatever the object of focus is). We “note” the thought or feeling to restore awareness, create a bit of space, as a way of letting go, and to learn more about our thought patterns, tendencies, and conditioning.',
    'Meditation',
  ),
];
