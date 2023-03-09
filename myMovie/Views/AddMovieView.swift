//
//  AddMovieView.swift
//  myMovie
//
//  Created by Line Nørgaard on 07/03/2023.
//

import SwiftUI

struct AddMovieView: View {
    @EnvironmentObject var movieController: MovieController
    @State var title = ""
    @State var year = String(Calendar.current.component(.year, from: Date()))
    @State var rating: Double = 0.0
    @State var resume = ""
    @State var urlString = ""
    var years = (1900...Calendar.current.component(.year, from: Date())).reversed().map { String($0) }
    @State var isShowingAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Name & Year")){
                        TextField("Name of Movie", text: $title)
                        Picker(selection: $year, label: Text("Pick a Year")) {
                            ForEach(years, id: \.self) {
                                Text($0)
                            }
                        }
                    
                }
                    Section(header: Text("Rating")) {
                        Slider(value: $rating, in: 0.00...10.00, step: 0.1)
                        Text(String(format: "%.2f", rating))
                    }
                Section(header: Text("Resumé")){
                    TextEditor(text: $resume)

                    
                }
                DisclosureGroup {
                    TextField("Https....", text: $urlString)
                } label: {
                    Text("Type in URL")
                        .opacity(0.6)
                }
                    Button {
                        isShowingAlert = true
                        movieController.addMovieToDbWith(title: title, year: year, rating: rating, resume: resume, urlString: urlString)
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .alert(isPresented: $isShowingAlert) {
                        Alert(title: Text("Form Submitted\n"), message: Text("Thanks\n \(title) Have been saved to the database!\n📽️📽️📽️📽️📽️📽️"), dismissButton: .default(Text("OK"), action: {
                            dismiss()
                        }))
                    }
                }
                
            }
            .navigationTitle("Hello")
        }
    }

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView().environmentObject(MovieController())
    }
}
