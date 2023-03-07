//
//  MovieCell.swift
//  myMovie
//
//  Created by Line Nørgaard on 10/02/2023.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie
//    @Binding var isAuthorized: Bool
    
    var body: some View{
//        if isAuthorized{
            HStack(content: {
                Image(movie.title)
                    .resizable()
                    .scaledToFit()
                //                .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .cornerRadius(18)
                    .padding(.trailing)
                VStack(alignment: .leading, content: {
                    Text(movie.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    Text(movie.year)
                        .font(.title3)
                    Text("IMDB: \(String(format: "%.2f", movie.rating))")
                        .font(.title3)
                        .foregroundColor(.red)
                })
            })
                .padding([.trailing])
//    }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(title: "The Matrix", year: "1999", rating: 8.7, resume: "The Matrix is a science fiction action movie about a hacker named Neo who discovers that the reality he lives in is actually a simulated world created by sentient machines. He joins a group of rebels who fight against the machines and try to save humanity from being trapped in the Matrix."))
    }
}
