class Seed
  def self.start
    new.generate
  end

  def generate
    create_category
    create_item
    create_admin
    create_registered_user
  end

  def create_category
    @category1 = Category.create(name: "Coffee")
    @category2 = Category.create(name: "Latte")
    puts "category created"
  end

  def create_item
      @category1.items.create(title: "iced coffee", description: "charissas drink", price:2.00, image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSgSHt_eNeOtwj7YfD2pzb936T-p967kHRdSVz0rFAijRxQtCP_Kg")
      @category1.items.create(title: "beer", description: "jhun  needs a drinkk", price:7.00, image: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQobXI0QMDBTa-qs27YXoXzH1mwoAnlafJExoW3Y86sGoZ4Xo50Cg")
      @category1.items.create(title: "chai tea", description: "ryans drinks", price: 5.00, image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSH-SgrF3bSunZIVfCuOtF2ENmJaDcNreEbvanX4CC1ivzVgfMC")
      @category1.items.create(title: "hot coffee", description: "frothy deliciousness", price: 4.00, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkDBRWKJ5ZZShWt9U8RKQVXtObCbyF_KvQzI4ApXr9ral44EXT")
      @category2.items.create(title: "chai latte", description: "charissas drink", price:2.00, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMNSxUtudEdAWOJWjG-Jb7MrR37jd1teNNFAdN3JA-SdMuji35")
      @category2.items.create(title: "cappucino", description: "jhun  needs a drinkk", price:7.00, image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRNSXFMdDggKNp-u3LkdJuUxuzXTXL21MgSOWms4NGQaW_T0Mlq")
      @category2.items.create(title: "macciatto", description: "ryans drinks", price: 5.00, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuozcuZZYXrQpEJe0u1XOIl0g86R4ppXAvv3_yIyilkuX2F0wV")
      @category2.items.create(title: "double espresso", description: "frothy deliciousness", price: 4.00, image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSSuvRAQORZqtyF1r2770nPSMGBoh_W8rGcArd-SowSv3kzIY5p")

    puts "items created."
  end

  def create_admin
    User.create(username: "admin", password: "pw", role: 1)

    puts "admin created"
  end

  def create_registered_user
    User.create(username: "Joe", password: "secret", role: 0)

    puts "registered user created"
  end

end

Seed.start
