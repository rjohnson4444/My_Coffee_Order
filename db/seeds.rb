class Seed
  def self.start
    new.generate
  end

  def generate
    create_category
    create_item
  end

  def create_category
    @category = Category.create(name: "Coffee")
    puts "category created"
  end

  def create_item
      @category.items.create(title: "iced coffee", description: "charissas drink", price:2.00, image: "http://img4.wikia.nocookie.net/__cb20140916184226/pokemon/images/e/e7/007Squirtle_OS_anime.png")
      @category.items.create(title: "beer", description: "jhun  needs a drinkk", price:7.00, image: "http://img4.wikia.nocookie.net/__cb20140916184226/pokemon/images/e/e7/007Squirtle_OS_anime.png")
      @category.items.create(title: "chai tea latte", description: "ryans drinks", price: 5.00, image: "http://vignette4.wikia.nocookie.net/gpxplus/images/b/b4/001_Bulbasaur_Pic.png/revision/2010122509545")
      @category.items.create(title: "latte", description: "frothy deliciousness", price: 4.00, image: "http://core.dawnolmo.com/50_pokemon__9_pikachu_by_megbeth-d5fga3f_original.png")

    puts "items created."
  end

end

Seed.start
