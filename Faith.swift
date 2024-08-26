//
//  Faith.swift
//  Faithify
//
//  Created by Amarachi Akunna Onyekachi on 2/23/24.
//


// from API show only the verses where Theme = Faith

import SwiftUI

struct Faith: View {
    @State private var faithVerses: [Verse] = [] // State variable to store faith-themed verses
    @State private var currentVerseIndex = 0 // State variable to keep track of the current verse index
    
    var body: some View {
        GeometryReader { geo in // Using a GeometryReader to access the size of the parent view
            
            NavigationView {
                ZStack { // Start of ZStack
                    // Background Image
                    Image("faithify_bg4")
                        .resizable() // Making the image resizable
                        .scaledToFill() // Scaling the image to fill the available space
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center) // Setting the frame size of the image to match the parent view's size
                        .opacity(1)
                    
                    // Content
                    VStack { // Start of VStack
                        if faithVerses.isEmpty {
                            Text("No verses found")
                                .padding()
                        } else {
                            // Displaying location above the verse
                            Text(faithVerses[currentVerseIndex].location)
                                .font(.system(size: 20))
                                .foregroundColor(Color.white) // text color
                                .bold()
                                .padding()
                            Text(faithVerses[currentVerseIndex].verse)
                                .font(.system(size: 20))
                                .foregroundColor(Color.white) // text color
                                .padding()
                                .multilineTextAlignment(.center)
                        }
                        
                        // Button to shuffle verses
                        PrimaryButton(text: "Shuffle")
                            .font(.system(size: 20))
                            .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 2, y: 2)
                            .shadow(color: Color.white.opacity(0.5), radius: 2, x: -2, y: -2)
                            .onTapGesture {
                                shuffleVerses()
                            }
                            .padding()
   
                    } // End of VStack
                    
                } // End of ZStack
                .onAppear {
                    // Loading verses when the view appears
                    loadVerses()
                }
            } // End of NavigationView
            
        } // End of GeometryReader
    } // End of body
    
    // Function to load faith-themed verses from JSON
    private func loadVerses() {
        guard let path = Bundle.main.path(forResource: "bible_verses", ofType: "json") else {
            fatalError("Unable to find bible_verses.json")
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let verses = try JSONDecoder().decode([Verse].self, from: data)
            faithVerses = verses.filter { $0.theme == "Faith" } // Query
        } catch {
            print("Error loading bible_verses.json: \(error)")
            // Uncomment the line below to see the detailed error description in the console
            // fatalError("Error loading bible_verses.json: \(error)")
        }
        
        shuffleVerses() // Shuffle initially when loading verses
    }
    
    // Function to shuffle faith-themed verses
    private func shuffleVerses() {
        if !faithVerses.isEmpty {
            faithVerses.shuffle()
            currentVerseIndex = 0 // Resetting to the first verse after shuffling
        }
    }

} // End of Faith

struct Faith_Previews: PreviewProvider {
    static var previews: some View {
        Faith()
    }
}
