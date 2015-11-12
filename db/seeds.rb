class Seed
  def self.start
    new.generate
  end

  def generate
    create_category
    create_item
  end

  def create_category
    @category1 = Category.create(name: "Coffee")
    @category2 = Category.create(name: "Latte")
    puts "category created"
  end

  def create_item
      @category1.items.create(title: "iced coffee", description: "charissas drink", price:2.00, image: "http://img4.wikia.nocookie.net/__cb20140916184226/pokemon/images/e/e7/007Squirtle_OS_anime.png")
      @category1.items.create(title: "beer", description: "jhun  needs a drinkk", price:7.00, image: "http://img4.wikia.nocookie.net/__cb20140916184226/pokemon/images/e/e7/007Squirtle_OS_anime.png")
      @category1.items.create(title: "chai tea", description: "ryans drinks", price: 5.00, image: "http://vignette4.wikia.nocookie.net/gpxplus/images/b/b4/001_Bulbasaur_Pic.png/revision/2010122509545")
      @category1.items.create(title: "hot coffee", description: "frothy deliciousness", price: 4.00, image: "http://core.dawnolmo.com/50_pokemon__9_pikachu_by_megbeth-d5fga3f_original.png")
      @category2.items.create(title: "chai latte", description: "charissas drink", price:2.00, image: "http://img4.wikia.nocookie.net/__cb20140916184226/pokemon/images/e/e7/007Squirtle_OS_anime.png")
      @category2.items.create(title: "cappucino", description: "jhun  needs a drinkk", price:7.00, image: "http://img4.wikia.nocookie.net/__cb20140916184226/pokemon/images/e/e7/007Squirtle_OS_anime.png")
      @category2.items.create(title: "macciatto", description: "ryans drinks", price: 5.00, image: "http://vignette4.wikia.nocookie.net/gpxplus/images/b/b4/001_Bulbasaur_Pic.png/revision/2010122509545")
      @category2.items.create(title: "double espresso", description: "frothy deliciousness", price: 4.00, image: "http://core.dawnolmo.com/50_pokemon__9_pikachu_by_megbeth-d5fga3f_original.png")

    puts "items created."
  end

end

Seed.start
