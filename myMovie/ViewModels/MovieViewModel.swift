//
//  MovieViewModel.swift
//  myMovie

import Foundation

class MovieViewModel: ObservableObject{
    @Published var movieList = [Movie]()
    @Published var sortType = SortType.title{
        didSet {
            sort()
        }
    }
    @Published var moviePath: [Movie]
    
    
    
    init(moviePath: [Movie] = []){
        self.moviePath = moviePath
        createTestData()
    }
    
    func MoveToThisPath(nxtMovie: Movie){
        moviePath.removeLast()
        moviePath.append(nxtMovie)
    }
    
    func IndexOfThis(movie: Movie) -> Int{
        guard let currentIndex = movieList.firstIndex(of: movie) else {return -1}
        return currentIndex
    }
    
    func CheckForPrevMovieWith(currIndex: Int) -> Movie? {
        guard currIndex-1 != -1 else { return nil }
        return movieList[currIndex - 1]
    }
    
    func CheckForNxtMovieWith(currIndex: Int) -> Movie?{
        guard currIndex >= 0, currIndex+1 < movieList.count else { return nil }
        return movieList[currIndex + 1]
    }
    
    func MoveBySwipeInThis(direction: Int, movie: Movie){
        
        let index = IndexOfThis(movie: movie)
//        Prev
        if direction > 0, let prevMovie = CheckForPrevMovieWith(currIndex: index){
            MoveToThisPath(nxtMovie: prevMovie)
        }
//        Nxt
        else if direction <= 0, let nxtMovie = CheckForNxtMovieWith(currIndex: index){
            MoveToThisPath(nxtMovie: nxtMovie)
        }
        else{
            return
        }
    }
    
    func CalcAverageRating()-> Double{
        let ratings = movieList.map { $0.rating }
        let numEntries = ratings.count

        let sumRatings = ratings.reduce(0.0) { result, rating in
            return result+rating
        }
        return sumRatings/Double(numEntries)
    }
    
    func AddMovieToListWith(title: String, year: String, rating: Double, resume: String){
        movieList.append(Movie(title: title, year: year, rating: rating, resume: resume))
    }
    
    
    func createTestData() {
        movieList.append(Movie(title: "The Matrix", year: "1999", rating: 8.7, resume: "The Matrix is a science fiction action movie about a hacker named Neo who discovers that the reality he lives in is actually a simulated world created by sentient machines. He joins a group of rebels who fight against the machines and try to save humanity from being trapped in the Matrix."))
        movieList.append(Movie(title: "Inception", year: "2010", rating: 8.8, resume: "Inception is a sci-fi action movie about a team of thieves who enter the dreams of others to steal their secrets and ideas. The protagonist, Cobb, is hired to perform the reverse, i.e., plant an idea in someone's mind, but as they delve deeper into the dream world, they face challenges that blur the lines between reality and imagination."))
        movieList.append(Movie(title: "Blade Runner 2049", year: "2017", rating: 8.0, resume: "Blade Runner 2049 is a neo-noir science fiction film set thirty years after the events of the original Blade Runner. The movie follows a blade runner named K who discovers a long-buried secret that leads him on a quest to find Rick Deckard, a former blade runner who has been missing for decades."))
        movieList.append(Movie(title: "Edge of Tomorrow", year: "2014", rating: 7.9, resume: "Edge of Tomorrow is a science fiction action movie about a military officer named Major William Cage who is thrown into a time loop where he relives the same day over and over again after being caught in an alien invasion. As he relives the day, he gains new skills and knowledge that he uses to try and change the outcome of the battle and save humanity."))
        movieList.append(Movie(title: "Alita", year: "2019", rating: 7.2, resume: "Alita: Battle Angel is a sci-fi action movie set in a post-apocalyptic world. The film follows a cyborg named Alita who is discovered in a scrapyard by a doctor named Ido. As Alita learns more about her past and her unique abilities, she becomes embroiled in a larger conflict and battles against those who seek to control the world."))
        movieList.append(Movie(title: "The Shawshank Redemption", year: "1994", rating: 9.3, resume: "The Shawshank Redemption is a drama movie about a banker named Andy Dufresne who is convicted of murder and sent to Shawshank prison. He befriends a fellow inmate named Red and together they navigate the harsh realities of prison life. Over time, Andy proves to be a man of integrity and intelligence, and he uses his skills to help his fellow prisoners."))
        movieList.append(Movie(title: "The Godfather", year: "1972", rating: 9.2, resume: "The Godfather is a crime drama movie about the Corleone family, a powerful Mafia dynasty. The movie follows the family patriarch, Vito Corleone, as he tries to maintain control of his empire while navigating the dangerous waters of organized crime."))
        movieList.append(Movie(title: "The Dark Knight", year: "2008", rating: 9.0, resume: "The Dark Knight is a superhero movie based on the DC Comics character Batman. The movie follows Batman as he tries to stop the Joker, a maniacal criminal who wants to destroy Gotham City and everything Batman stands for."))
        movieList.append(Movie(title: "Pulp Fiction", year: "1994", rating: 8.9, resume: "Pulp Fiction is a crime movie about several people in the criminal underworld of Los Angeles, including hit men Vincent Vega and Jules Winnfield, a gangster's wife named Mia Wallace, and a boxer named Butch Coolidge. The movie is known for its non-linear narrative structure and its witty, fast-paced dialogue."))
        movieList.append(Movie(title: "The Lord of the Rings- The Return of the King", year: "2003", rating: 9.0, resume: "The Lord of the Rings: The Return of the King is a fantasy movie based on the book series by J.R.R. Tolkien. The movie is the final installment in the Lord of the Rings trilogy and follows the journey of a hobbit named Frodo and his friends as they try to destroy the One Ring and defeat the evil Sauron."))
        movieList.append(Movie(title: "Interstellar", year: "2014", rating: 8.6, resume: "Interstellar is a science fiction movie about a team of astronauts who travel through a wormhole in search of a new home for humanity. The film explores the themes of love, sacrifice, and the future of humanity as the astronauts face dangerous challenges and make difficult choices in order to save the human race."))
        movieList.append(Movie(title: "The Silence of the Lambs", year: "1991", rating: 8.6, resume: "The Silence of the Lambs is a psychological horror-thriller movie about a young FBI trainee named Clarice Sterling who is tasked with tracking down a serial killer known as 'Buffalo Bill'. She seeks the help of a former psychiatrist and cannibal, Dr. Hannibal Lecter, to catch the killer."))
        movieList.append(Movie(title: "The Godfather- Part II", year: "1974", rating: 9.0, resume: "The Godfather: Part II is a 1974 American crime film directed by Francis Ford Coppola. It is the second installment in The Godfather trilogy, and it is both a sequel and a prequel to the first film."))

        movieList.append(Movie(title: "Schindler's List", year: "1993", rating: 8.7, resume: "Schindler's List is a 1993 American epic historical period drama film directed and produced by Steven Spielberg. The film is based on the real-life story of Oskar Schindler, a German businessman who saves the lives of more than a thousand Jewish refugees from the Holocaust by employing them in his factories."))

        movieList.append(Movie(title: "The Green Mile", year: "1999", rating: 8.5, resume: "The Green Mile is a 1999 American fantasy crime drama film directed by Frank Darabont. The film is based on the 1996 novel of the same name by Stephen King and tells the story of a death row corrections officer's encounter with a supernatural inmate."))

        movieList.append(Movie(title: "The Prestige", year: "2006", rating: 8.5, resume: "The Prestige is a 2006 mystery-thriller film directed by Christopher Nolan. The film is about the rivalry between two magicians, Alfred Borden and Robert Angier, who engage in a escalating series of daring tricks and illusions that eventually lead to fatal consequences."))

        movieList.append(Movie(title: "Goodfellas", year: "1990", rating: 8.7, resume: "Goodfellas is a 1990 American crime film directed by Martin Scorsese. The film is based on the 1986 non-fiction book Wiseguy by Nicholas Pileggi and tells the story of the rise and fall of Henry Hill, a small-time gangster who becomes associated with the Lucchese crime family."))

        movieList.append(Movie(title: "Saving Private Ryan", year: "1998", rating: 8.6, resume: "Saving Private Ryan is a 1998 American war film directed by Steven Spielberg. The film is set during the Invasion of Normandy in World War II and follows a group of American soldiers as they search for Private James Francis Ryan, a paratrooper who is the only surviving member of his immediate family."))

        movieList.append(Movie(title: "The Departed", year: "2006", rating: 8.5, resume: "The Departed is a 2006 crime-thriller film directed by Martin Scorsese. The film is a remake of the 2002 Hong Kong film Infernal Affairs and is set in South Boston where an undercover cop is tasked with infiltrating the Irish-American mob while a gangster goes undercover within the police force."))
    }
    
    func sort() {
        switch sortType {
        case .year:
            self.movieList = movieList.sorted { movie1, movie2 in
                movie1.year < movie2.year
            }
        case .title:
            self.movieList = movieList.sorted { movie1, movie2 in
                movie1.title < movie2.title
            }
        case .rating:
            self.movieList = movieList.sorted { movie1, movie2 in
                movie1.rating > movie2.rating
            }
        }
    }
}

enum SortType: CaseIterable {
    case year, title, rating
    
//    static let allCases: [SortType] = [.title, .year, .rating]
    
    var toString : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .year: return "Year"
        case .title: return "Title"
        case .rating: return "Rating"
        }
      }
}
