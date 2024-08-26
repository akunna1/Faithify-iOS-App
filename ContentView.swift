//
//  ContentView.swift
//  Faithify
//
//  Created by Amarachi Akunna Onyekachi on 2/22/24.
//

// Screens:
// Screen 1: Welcome Page
// Screen 2: Flashcards (should have shuffle button)
// Screen 3: Bible Verse Saver
// Screen 4:Interactive Quizzes
// Screen 5: Progress Tracking and Goal Setting

import SwiftUI

struct ContentView: View {
    
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
                    VStack { // Start of VStack 1
                        // Header
                        HStack { // Start of HStack header
                            Text("Hello World!")
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                        } // End of HStack header
                        .padding(.top, 20)
                        
                        Spacer()
                        
                        VStack(spacing: 5) { // Start of VStack 2
                            HStack {
                                Text("Welcome to Faithify")
                                    .whiteTitle()
                                Image(systemName: "cross.fill")
                                    .foregroundColor(.white)
                            }

                            Text("An app to help fellow christains and believers enrich their faith and daily life with inspirational scripture verses!")
                                .font(.system(size: 20))
                                .foregroundColor(Color.white) // text color
                                .multilineTextAlignment(.center)
                                .padding(15)
                            
                            // Button wrapped with NavigationLink
                            NavigationLink(destination: ThemesView()) {
                                PrimaryButton(text: "Get Started")
                                    .font(.system(size: 20))
                                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
                                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: -2, y: -2)
                                    .padding(.bottom, 110)
                                
                            } // End of VStack 2
                        }
                        .buttonStyle(PlainButtonStyle()) // Ensures the button style is plain to enable tap

                    } // End of VStack 1
                    .padding(.bottom, 180)
                    
                } // End of ZStack
            }    // end of NavigationView
            
        } // End of GeometryReader
    } // End of body
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
