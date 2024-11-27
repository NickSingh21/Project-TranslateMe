//
//  TranslatedText.swift
//  TranslateMe
//
//  Created by Jose Folgar on 4/7/24.
//

import Foundation

struct TranslatedResponse: Codable {
    let responseData: TranslatedText
}

struct TranslatedText: Codable {
    let translatedText: String
    let match: Float
}

struct Translation: Codable, Identifiable {
    let id: String
    let word: String
    let translation: String
    let timestamp: Date
}

extension Translation {
    static let mockedTranslations: [Translation] = [ "cheese", "queso" ].enumerated().map { index, text in
        Translation(id: UUID().uuidString, word: text, translation: index % 2 == 0 ? "hi" : "goodbye", timestamp: Date())
    }
}
