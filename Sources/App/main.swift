import Vapor
import HTTP

let drop = Droplet()

var pokemons :[Pokemon]!

// private functions
private func getAll() -> [Pokemon] {
    
    if pokemons == nil {
        pokemons = [Pokemon]()
        
        let pokemon1 = Pokemon(id : 1, name: "Pikachu", imageURL: "http://vignette4.wikia.nocookie.net/pokemon/images/5/5f/025Pikachu_OS_anime_11.png")
        let pokemon2 = Pokemon(id : 2, name: "Pokemon 2", imageURL: "SomeURL")
        let pokemon3 = Pokemon(id : 3, name: "Pokemon 3", imageURL: "SomeURL")
        let pokemon4 = Pokemon(id : 4,name: "Pokemon 4", imageURL: "SomeURL")
        
        pokemons.append(contentsOf: [pokemon1,pokemon2,pokemon3,pokemon4])
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



