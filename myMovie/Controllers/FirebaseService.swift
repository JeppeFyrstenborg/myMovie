//
//  FirebaseService.swift
//  myMovie
//
//  Created by Line Nørgaard on 08/03/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseService {
    private let dbRef = Firestore.firestore()
    private var ref: DocumentReference?
    private let collectionRef: CollectionReference?

    init(){
        collectionRef = dbRef.collection("movieList")
    }

    func add(item: Movie) -> String? {
        var id: String?
        do {
            let newDocumentReference = try collectionRef?.addDocument(from: item)
            id = newDocumentReference?.documentID
        }
        catch{
            print(error)
        }
        return id
    }

    func delete(item: Movie) {
        guard let id = item.id,let docRef = collectionRef?.document(id) else {return}
        docRef.delete()
    }
//
//    func update(_ item: Movie) {
//        guard let id = item.id,let docRef = collectionRef?.document(id) else {return}
//        do {
//            try docRef.setData(from: item)
//        }
//        catch {
//
//        }
//    }

    func getAll() async -> [Movie] {
        guard let collectionRef = self.collectionRef else {return []}
        var items = [Movie]()
        do {
            let snapshot = try await collectionRef.getDocuments()
            items = snapshot.documents.compactMap{ queryDocumentSnapshot in
                return try! queryDocumentSnapshot.data(as: Movie.self)
            }
        } catch {
            print("UPS!")
        }
        return items
    }

    func listenForData(_ completionHandler: @escaping ([Movie])->()){
        guard let collectionRef = self.collectionRef else {return}
        collectionRef.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {return}
            let items = documents.compactMap{ (item) -> Movie? in
                return try? item.data(as: Movie.self)
            }
            completionHandler(items)
        }
    }
}
