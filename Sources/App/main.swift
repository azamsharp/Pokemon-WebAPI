import Vapor
import HTTP

let drop = Droplet()

var pokemons :[Pokemon]!

// private functions
private func getAll() -> [Pokemon] {
    
    if pokemons == nil {
        pokemons = [Pokemon]()
        
        let pokemon1 = Pokemon(id : 1, name: "Pikachu", imageURL: "http://vignette4.wikia.nocookie.net/pokemon/images/5/5f/025Pikachu_OS_anime_11.png")
        let pokemon2 = Pokemon(id : 2, name: "Bulbasaur", imageURL: "http://static.giantbomb.com/uploads/original/13/135472/1891758-001bulbasaur.png")
        let pokemon3 = Pokemon(id : 3, name: "Ivysaur", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891759-002ivysaur.png")
        let pokemon4 = Pokemon(id : 4,name: "Charmander", imageURL: "http://static.giantbomb.com/uploads/scale_small/0/6087/2438704-1202149925_t.png")
        let pokemon5 = Pokemon(id : 5,name: "Charmeleon", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891762-005charmeleon.png")
        let pokemon6 = Pokemon(id : 6,name: "Charizard", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891763-006charizard.png")
        
        let pokemon7 = Pokemon(id : 7,name: "Squirtle", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891764-007squirtle.png")
        
        let pokemon8 = Pokemon(id : 8,name: "Wartortle", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891809-008wartortle.png")

        let pokemon9 = Pokemon(id : 9,name: "Blastoise", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891810-009blastoise.png")

        let pokemon10 = Pokemon(id : 10,name: "Caterpie", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1892132-010caterpie.png")

        
        let pokemon11 = Pokemon(id : 11,name: "Butterfree", imageURL: "http://static.giantbomb.com/uploads/scale_small/13/135472/1892298-012butterfree.png")

        
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




