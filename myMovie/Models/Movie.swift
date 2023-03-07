//
//  Movie.swift
//  myMovie
//
//  Created by Line Nørgaard on 08/02/2023.
//

import Foundation

struct Movie: Identifiable, Hashable{
    var id = UUID()
    
    var title: String
    var year: String
    var rating: Double
    var resume: String
}
