//
//  MovieDetail.swift
//  myMovie


import SwiftUI

struct MovieDetail: View {
    @EnvironmentObject var movieController: MovieController
    @EnvironmentObject var navigationController: NavigationController
    var movie : Movie
    @State private var tapped = false
    @State var angle = Angle(degrees: 0.0)
    @GestureState var magnifyBy = 1.0
    @State private var dragOffset = CGSize.zero
    
    
//    Computed property. Bliver beregnet når der er brug for det.
//    By default er det en get. Kan både være en get og en set.
    var rotation: some Gesture {
        RotationGesture()
            .onChanged { Angle in
                self.angle = angle
            }
    }
    
    var magnification: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy){
                currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    
    var body: some View {
        VStack{
            NavigationLink(destination: Text(movie.resume)
                .font(.title)
                .padding()){
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            Image(movie.title)
                .resizable()
                .aspectRatio(contentMode: tapped ? .fill : .fit)
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/22/*@END_MENU_TOKEN@*/)
                .onTapGesture{
                    tapped.toggle()
                }
                .scaleEffect(magnifyBy)
                .gesture(magnification)
                .rotationEffect(self.angle)
                .gesture(rotation)
            NavigationButtonsView(movie: movie)
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation
                }
                .onEnded { value in
                    let currIndex = movieController.IndexOfThis(movie: movie)
                    let direc = value.translation.width > 0 ? 1 : -1
                    if direc == 1, let prev = movieController.CheckForPrevMovieWith(currIndex: currIndex){
                        navigationController.MoveToThis(nxtMovie: prev)
                    }
                    if direc == -1,  let nxt = movieController.CheckForNxtMovieWith(currIndex: currIndex){
                        navigationController.MoveToThis(nxtMovie: nxt)
                    }
                    dragOffset = .zero
                }
        )
        .offset(dragOffset)
    }
}

//struct MovieDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetail(movie: Movie(title: "The Matrix", year: "1999", rating: 8.7, resume: "The Matrix is a science fiction action movie about a hacker named Neo who discovers that the reality he lives in is actually a simulated world created by sentient machines. He joins a group of rebels who fight against the machines and try to save humanity from being trapped in the Matrix."))
//            .environmentObject(MovieController()).environmentObject(NavigationController())
//    }
//}
