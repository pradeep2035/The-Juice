class JuiceModel{
  final String avatar;
  final String juiceName;
  final String juicePrice;
  final String juiceDesc;

  JuiceModel( {
  required this.juiceName, required this.juicePrice, required this.juiceDesc,required this.avatar});
}


List <JuiceModel> juiceData=[
  JuiceModel(juiceName:'Berry Juice',juiceDesc:'Blend of berry with ice that makes your tired day feels very fresh again.',juicePrice:'₹60/-', avatar:"https://i.pinimg.com/564x/43/8b/49/438b49284feb728b2c84f4ff2b5b37da.jpg"),
  JuiceModel( juiceName:'Orange Juice',juiceDesc:'Blend of orange with ice that makes your tired day feels very fresh again.',juicePrice:'₹75/-',avatar:"https://i.pinimg.com/564x/81/ab/c7/81abc7398c5157226884245edb99543d.jpg"),
  JuiceModel(juiceName:'Mixfruit Juice',juiceDesc:'Blend of mixfruit with ice that makes your tired day feels very fresh again',juicePrice:'₹60/-', avatar:"https://i.pinimg.com/564x/e2/2f/5e/e22f5e2a199575c925fac7c19ec0467d.jpg"),
  JuiceModel(juiceName:'Watermelon Juice',juiceDesc:'Blend of watermelon with ice that makes your tired day feels very fresh again.',juicePrice:'₹50/-',avatar:"https://i.pinimg.com/736x/7f/91/d6/7f91d6818291e4395bdea19ebe2e8991.jpg"),
  JuiceModel(juiceName:'Strawberry Juice',juiceDesc:'Blend of strawberry with ice that makes your tired day feels very fresh again.',juicePrice:'₹90/-',avatar:"https://i.pinimg.com/564x/08/e6/41/08e6419ad5f0e67547b368f59b08e02f.jpg"),
  JuiceModel( juiceName:'Blackcurrent',juiceDesc:'Blend of blackberry with ice that makes your tired day feels very fresh again.',juicePrice:'₹120/-',avatar:"https://i.pinimg.com/564x/af/9b/c2/af9bc2be76f1f0ce5744607aa4566691.jpg"),
  JuiceModel(juiceName:'Pineapple Special',juiceDesc:'Blend of pineapple with ice that makes your tired day feels very fresh again.',juicePrice:'₹105/-',avatar:"https://i.pinimg.com/564x/b5/f5/9e/b5f59ed11434591f1a422cbe51414974.jpg"),
];