//
//  ContentView.swift
//  webviewlinksample
//
//  Created by lethe2211 on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    @State var inputtedText: String = ""
    @State var hasError: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    // Background image
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 239 / 255,
                                    green: 239 / 255,
                                    blue: 241 / 255))
                        .frame(height: 36)

                    // Search bar
                    HStack(spacing: 6) {
                        Spacer()
                            .frame(width: 6)
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Input the link URL here", text: $inputtedText)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        if !inputtedText.isEmpty {
                            Button {
                                inputtedText.removeAll()
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 6)
                        }
                    }
                }
                .padding(.horizontal)

                Text(inputtedText)
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        if let textUrl = URL(string: inputtedText) {
                            if UIApplication.shared.canOpenURL(textUrl) {
                                UIApplication.shared.open(textUrl)
                                hasError = false
                            } else {
                                hasError = true
                            }
                        }
                    }

                if hasError {
                    Text("It couldn't open the URL. Please try it again.")
                }

                Spacer()
            }
            .navigationTitle("WebView link sample")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
