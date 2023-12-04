class JuiceModel{
  final String avatar;
  final String juiceName;
  final String juicePrice;
  final String juiceDesc;

  JuiceModel( {
  required this.juiceName, required this.juicePrice, required this.juiceDesc,required this.avatar});
}


List <JuiceModel> juiceData=[
  JuiceModel(juiceName:'Berry Blast',juiceDesc:"Savor the freshness of 'the Berry Blast' - a delightful mix of sweet berries that's both thirst-quenching and delicious. Enjoy the perfect combo of tart and sweet in every sip, a treat for your taste buds.",juicePrice:'₹60/-', avatar:"https://i.pinimg.com/564x/43/8b/49/438b49284feb728b2c84f4ff2b5b37da.jpg"),
  JuiceModel( juiceName:'Orange Delight',juiceDesc:'Sip into pure bliss with Orange Delight -  a symphony of freshness from the juiciest oranges. Embrace the vibrant, zesty flavor that makes every sip a delightful citrus celebration.',juicePrice:'₹75/-',avatar:"https://i.pinimg.com/564x/81/ab/c7/81abc7398c5157226884245edb99543d.jpg"),
  JuiceModel(juiceName:'Fruity Blast',juiceDesc:'Dive into a burst of fruity goodness with Fruity Blast. This vibrant blend combines a medley of your favorite fruits, creating an explosion of flavors in every sip. Experience the refreshing fusion of sweetness and tanginess that makes Fruity Blast a delightful and energizing choice.',juicePrice:'₹60/-', avatar:"https://i.pinimg.com/564x/e2/2f/5e/e22f5e2a199575c925fac7c19ec0467d.jpg"),
  JuiceModel(juiceName:'Minty melon',juiceDesc:'Refresh your senses with Minty Melon - a cool blend that combines the crispness of melons with a hint of minty freshness. Dive into a delightful symphony of flavors that awaken your taste buds, leaving you with a rejuvenating and satisfying experience in every sip.',juicePrice:'₹50/-',avatar:"https://i.pinimg.com/736x/7f/91/d6/7f91d6818291e4395bdea19ebe2e8991.jpg"),
  JuiceModel(juiceName:'Strawberry Bliss',juiceDesc:"Dive into a world of sweetness with our Strawberry Bliss. This irresistible is a symphony of flavor, carefully crafted from the juiciest and ripest strawberries.It's more than just a drink, it's a celebration of sweet moments.",juicePrice:'₹90/-',avatar:"https://i.pinimg.com/564x/08/e6/41/08e6419ad5f0e67547b368f59b08e02f.jpg"),
  JuiceModel( juiceName:'Blackcurrent',juiceDesc:'Discover the bold and rich flavor of our Blackcurrant Juice. Immerse yourself in the deep, vibrant hues and the robust, slightly tart taste that defines this exquisite beverage. Savor the unique essence of blackcurrants with every refreshing sip.',juicePrice:'₹120/-',avatar:"https://i.pinimg.com/564x/af/9b/c2/af9bc2be76f1f0ce5744607aa4566691.jpg"),
  JuiceModel(juiceName:'Pineapple Punch',juiceDesc:'Experience a tropical escape with Pineapple Punch. This blend packs a punch of vibrant pineapple flavor that transports you to sun-soaked beaches with every sip.\nRefreshment meets tropical delight in Pineapple Punch - your ticket to a sip of paradise.',juicePrice:'₹105/-',avatar:"https://i.pinimg.com/564x/b5/f5/9e/b5f59ed11434591f1a422cbe51414974.jpg"),
];