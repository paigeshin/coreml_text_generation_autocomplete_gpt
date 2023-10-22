//
//  ContentView.swift
//  ImageClassificationSwiftUI
//
//  Created by Mohammad Azam on 2/3/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    
    let model = GPT2(strategy: .greedy)
    @State private var predictionLabel: String = ""

    var body: some View {
        VStack {
            
            TextField("Enter Prompt", text: self.$text)
                .padding()
            
            Button("Generate") {
                
                // generate the text
                let text = self.text
                
                // Particular Background Service
                DispatchQueue.global(qos: .userInitiated).async {
                    let _ = self.model.generate(text: text) { completion, time in
                        DispatchQueue.main.async {
                            self.predictionLabel = completion
                        }
                    }
                }
                
            }.padding()
            
            Text(self.predictionLabel)
                .font(.largeTitle)
                .padding()
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
