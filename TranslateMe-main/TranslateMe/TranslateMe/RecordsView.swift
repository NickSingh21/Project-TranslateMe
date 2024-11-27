//
//  RecordsView.swift
//  TranslateMe
//
//  
//

import SwiftUI

struct RecordsView: View {
    
    var translations: [Translation]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(translations) { translation in
                    HStack {
                        Text(translation.word)
                        Spacer()
                        Text(translation.translation)
                    }
                }
            }
        }
    }
}

//#Preview {
//    //RecordsView()
//}
