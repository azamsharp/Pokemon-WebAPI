import Vapor
import HTTP

let drop = Droplet()

var pokemons :[Pokemon]!

// private functions
private func getAll() -> [Pokemon] {
    
    if pokemons == nil {
        pokemons = [Pokemon]()
        
        var pokemon1 = Pokemon(id : 1, name: "Pikachu", imageURL: "http://vignette4.wikia.nocookie.net/pokemon/images/5/5f/025Pikachu_OS_anime_11.png")
        
        pokemon1.latitude = 29.735366
        pokemon1.longitude = -95.392206
        
        var pokemon2 = Pokemon(id : 2, name: "Bulbasaur", imageURL: "http://static.giantbomb.com/uploads/original/13/135472/1891758-001bulbasaur.png")
        
        pokemon2.latitude = 29.735142
        pokemon2.longitude = -95.390081
        
        var pokemon3 = Pokemon(id : 3, name: "Ivysaur", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891759-002ivysaur.png")
        
        pokemon3.latitude = 29.734285
        pokemon3.longitude = -95.390489
        
        var pokemon4 = Pokemon(id : 4,name: "Charmander", imageURL: "http://static.giantbomb.com/uploads/scale_small/0/6087/2438704-1202149925_t.png")
        
        pokemon4.latitude = 29.735403
        pokemon4.longitude = -95.387142
        
        var pokemon5 = Pokemon(id : 5,name: "Charmeleon", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891762-005charmeleon.png")
        
        pokemon5.latitude = 29.736707
        pokemon5.longitude = -95.391047
        
        var pokemon6 = Pokemon(id : 6,name: "Charizard", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891763-006charizard.png")
        
        pokemon6.latitude = 29.737453
        pokemon6.longitude = -95.386777
        
        var pokemon7 = Pokemon(id : 7,name: "Squirtle", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891764-007squirtle.png")
        
        pokemon7.latitude = 29.735124
        pokemon7.longitude = -95.395124
        
        var pokemon8 = Pokemon(id : 8,name: "Wartortle", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891809-008wartortle.png")
        
        pokemon8.latitude = 29.733689
        pokemon8.longitude = -95.393085

        var pokemon9 = Pokemon(id : 9,name: "Blastoise", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891810-009blastoise.png")
        
        pokemon9.latitude = 29.734975
        pokemon9.longitude = -95.387163

        var pokemon10 = Pokemon(id : 10,name: "Caterpie", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1892132-010caterpie.png")

        pokemon10.latitude = 29.736577
        pokemon10.longitude = -95.398171
        
        
        var pokemon11 = Pokemon(id : 11,name: "Butterfree", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1892298-012butterfree.png")

        pokemon11.latitude = 29.737155
        pokemon11.longitude = -95.393128
        
        pokemons.append(contentsOf: [pokemon1,pokemon2,pokemon3,pokemon4,pokemon5,pokemon6,pokemon7,pokemon8,pokemon9,pokemon10,pokemon11])
      
        pokemons.append(contentsOf: [pokemon1,pokemon2,pokemon3,pokemon4,pokemon5,pokemon6,pokemon7,pokemon8,pokemon9,pokemon10,pokemon11])
      
        pokemons.append(contentsOf: [pokemon1,pokemon2,pokemon3,pokemon4,pokemon5,pokemon6,pokemon7,pokemon8,pokemon9,pokemon10,pokemon11])
        
        
    }
    
    return pokemons
}



drop.post("pokemon") { request in
    
    pokemons = getAll()
    
    guard var pokemon = Pokemon(content: request.data) else {
        fatalError("Error initializing the Pokemon object")
    }
    
    pokemon.id = pokemons.count + 1
    
    pokemons.append(pokemon)
    return pokemon
    
   }

drop.get("pokemon","all") { request in
    
    pokemons = getAll()
   // return pokemons as! ResponseRepresentable
    return try! JSON(node: pokemons)
}

drop.get("pokemon",Int.self) { request, pokemonId in
    
    pokemons = getAll()
    let pokemon = pokemons.first(where :{
        $0.id == pokemonId
    })!
    
    return pokemon
}


drop.run()




