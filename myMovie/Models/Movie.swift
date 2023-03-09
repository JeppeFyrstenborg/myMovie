//
//  Movie.swift
//  myMovie
//
//  Created by Line Nørgaard on 08/02/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Movie: Identifiable, Hashable, Codable{
//    var id = UUID()
    @DocumentID var id: String?
    
    var title: String
    var year: String
    var rating: Double
    var resume: String
    var urlString: String
    var url: URL? {
        URL(string: urlString)
        }
    }
