//
//  MovieListView.swift
//  myMovie
//
//  Created by Jeppe Fyrstenborg on 08/02/2023.
//

import SwiftUI

struct MovieListView: View {
    @State var isAuthenticated = false
    @EnvironmentObject var movieViewModel: MovieViewModel
    @State private var showAddView = false
    
    var body: some View {
        NavigationStack(path: $movieViewModel.moviePath){
                List{
                    ForEach(movieViewModel.movieList) { movie in
                        NavigationLink(value: movie) {
                            MovieCell(movie: movie)
                        }
                    }
                    .onDelete{ indexSet in
                        movieViewModel.movieList.remove(atOffsets: indexSet)
                    }
                    .listRowSeparator(.hidden)
                }//list end
            .navigationDestination(for: Movie.self, destination: { movie in
                MovieDetail(movie: movie)
            })
            .listStyle(.plain)
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(
                leading:
                    Button(action: {
                        showAddView = true
                    }, label: {
                        Image(systemName: "plus")
                        Text("Add Movie")
                    }),
                trailing:
                    NavigationLink(destination: LoginView()) {
                        Image(systemName: "square.and.arrow.up")
                        Text("Login")
                    }
            )
            .sheet(isPresented: $showAddView) {
                AddMovieView()
            }
//                HStack(alignment: .bottom){
            Text("AVG Rating: " + String(format: "%.2f", movieViewModel.CalcAverageRating()))
                        SortButton(viewModel: movieViewModel)
//                    }
//                .padding(.top)
        }//NavigationView end
    }//body end
}// STRUCT END


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView().environmentObject(MovieViewModel())
    }
}
