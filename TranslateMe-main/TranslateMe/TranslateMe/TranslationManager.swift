//
//  TranslationManager.swift
//  TranslateMe
//
//  Created by Jose Folgar on 4/7/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

@Observable
class TranslationManager {
    
    var translations: [Translation] = []
    
    private let dataBase = Firestore.firestore()
    
    init(isMocked: Bool = false) {
        if isMocked {
            translations = Translation.mockedTranslations
        } else {
            getTranslations()
        }
    }
    
    func getTranslations() {
        dataBase.collectionGroup("translations").addSnapshotListener { querySnapshot, error in
            
            // Get the documents for the messages collection (a document represents a message in this case)
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            // Map Firestore documents to Message objects
            let translations = documents.compactMap { document in
                do {
                    
                    // Decode message document to your Message data model
                    return try document.data(as: Translation.self)
                } catch {
                    print("Error decoding document into translation: \(error)")
                    return nil
                }
            }
            
            // Update the translations property with the fetched messages (sorting ascending timestamp)
            self.translations = translations.sorted(by: { $0.timestamp < $1.timestamp })
        }
    }
    
    func sendTranslation(word: String, translation: String) {
        do {
            let translation = Translation(id: UUID().uuidString, word: word, translation: translation, timestamp: Date())
            
            try dataBase.collection("translations").document().setData(from: translation)
        } catch {
            print("Error sending translation to Firestore: \(error)")
        }
    }
}
