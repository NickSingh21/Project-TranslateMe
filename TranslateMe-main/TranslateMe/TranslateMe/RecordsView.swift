//
//  RecordsView.swift
//  TranslateMe
//
//  Created by Jose Folgar on 4/7/24.
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
