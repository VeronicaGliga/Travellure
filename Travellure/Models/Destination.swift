//
//  Destination.swift
//  Travellure
//
//  Created by veronica.gliga on 14.12.2023.
//

import Foundation

struct Destination: Codable, Identifiable {
    var id: Int
    var category: DestinationCategory
    var country: String
    var city: String
    var description: String
    var image: String
}

let testDetination = Destination(id: 1, category: .nearby, country: "Spain", city: "Barcelona", description: "Bla bla bla bla bla", image: "")

class SuggestionModel {
    
    struct Suggestion: Codable {
        var destinations: [Destination]
    }
    
    var destinations: [Destination] = []
    
    init() {
        if let suggestionsJSON = decodeJSON(data: testData) {
            destinations = suggestionsJSON.destinations
        }
    }
    
    func decodeJSON(data: Data!)-> Suggestion? {
        let decoder = JSONDecoder()
        var suggestions: Suggestion! = nil
        
        do {
            suggestions = try decoder.decode(Suggestion.self, from: data)
        } catch let error as NSError {
            print("Error reading JSON file: \(error.localizedDescription)")
        }
        
        return suggestions
    }
}
/// Basic JSON data ready to use in the MenuModel. Usually this would come in an external file, but for instructional purposes I put it here.
let testData = """
    {"destinations":[
       {
            "id": 0,
            "category": "Top destinations nearby",
            "country": "Spain",
            "city": "Barcelona",
            "description": "The classic pizza of Buffalo. Mozzarella, tomatoes, and basil on a Neopolitan crust",
            "image": "philippines"
       },
    {
            "id": 1,
            "category": "Top destinations nearby",
            "country": "Spain",
            "city": "Valencia",
            "description": "A blend of Asiago, Parmesan, buffalo mozzarella, and Gorgonzola on a Neopolitan crust",
            "image": "philippines"
       },
    {
            "id": 2,
            "category": "Best views nearby",
            "country": "France",
            "city": "Paris",
            "description": "A meaty calzone exploding like a volcano. Sausage combined with vegetables, pineapple, and a special lava sauce leaking out the top crater. Definitely share this one.",
            "image": "philippines"
       },
    {
            "id": 3,
            "category": "Best views nearby",
            "country": "Hungary",
            "city": "Budapest",
            "description": "A very long flatbread for vegetarians and vegans, made with olive oil, mushrooms, garlic, fresh ginger, and macadamias, sweetened with lilikoi.",
            "image": "philippines"
       },
    {
            "id": 4,
            "category": "Best views nearby",
            "country": "Croatia",
            "city": "Zadar",
            "description": " The New York classic version. A thin crust with pizza sauce, cheese, and pepperoni.",
            "image": "philippines"
       },
    {
            "id": 5,
            "category": "Browse by activity",
            "country": "Philippines",
            "city": "Cebu",
            "description": "Chicago Deep Dish: The classic deep dish cheese pizza. 2 inches Thick and filled with sauce and cheese. ",
            "image": "philippines"
       },
    {
            "id": 6,
            "category": "Browse by activity",
            "country": "Austria",
            "city": "Solden",
            "description": "A deep dish for the carnivore. Sausage and pepperoni in the classic Chicago deep dish.",
            "image": "philippines"
       },
    {
            "id": 7,
            "category": "City break",
            "country": "England",
            "city": "London",
            "description": "BBQ Chicken: Grilled chicken with barbecue sauce, red onions, and peppers on a Neopolitan crust",
            "image": "philippines"
       },{
            "id": 8,
            "category": "City break",
            "country": "Switzerland",
            "city": "Zürich",
            "description": "Huli Chicken: Our original Hawaiian street food pizza, with Huli Huli chicken, onions, ginger, crushed macadamia nuts, tomato sauce, and cheese on a classic crust.",
            "image": "philippines"
       },
    {
            "id": 9,
            "category": "City break",
            "country": "Czechia",
            "city": "Praha",
            "description": "It may be from the mainland, but we make it our own. Pineapple, SPAM, cheese, onions, bean sprouts, and tomato sauce on a thin crust.",
            "image": "philippines"
       },
    {
            "id": 10,
            "category": "City break",
            "country": "Poland",
            "city": "Warsaw",
            "description": "Spam, Furikake, Nori on a bed of Sushi rice",
            "image": "philippines"
       },
    {
            "id": 11,
            "category": "Top destinations by season",
            "country": "Hawaii",
            "city": "Oahu",
            "description": "Coffee-Smoked Tofu, Pineapple,  Ube, and Nori on a bed of Sushi rice",
            "image": "philippines"
       }
    ]
    }
    """.data(using: .utf8)
