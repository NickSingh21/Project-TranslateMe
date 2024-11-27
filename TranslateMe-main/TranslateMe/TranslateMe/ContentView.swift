//
//  ContentView.swift
//  TranslateMe
//
//  Created by Jose Folgar on 3/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var word: String = ""
    @State private var translation: String = ""
    @State var translationManager: TranslationManager
    
    init(isMocked: Bool = false) {
        translationManager = TranslationManager(isMocked: isMocked)
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("Translate Me")
                TextField("Word", text: $word)
                Button("Translate!") {
                    Task {
                        await getTranslation()
                    }
                }
                Text("\(translation)")
                NavigationLink("See Previous") {
                    RecordsView(translations: translationManager.translations)
                }
            }
            .padding()
        }
    }
    
    private func getTranslation() async {
        let url = URL(string: "https://api.mymemory.translated.net/get?q=\(word.lowercased())&langpair=en-us|es-mx")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(TranslatedResponse.self, from: data)
            self.translation = response.responseData.translatedText
            translationManager.sendTranslation(word: self.word, translation: self.translation)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
