//
//  ThemesView.swift
//  Faithify
//
//  Created by Amaraczhi Akunna Onyekachi on 2/22/24.
//


// click topic --> generate verse (perhaps new screen) --> Saver
// Skip --> Linker(Quizzes, Saver,  Tracker)

import SwiftUI

struct ThemesView: View {
    
    let themes = ["Faith", "Grace", "Hope", "Love", "Overcoming Challenges"]
    @State private var selectedTheme: String? = nil
    
    var body: some View {
        GeometryReader { geo in // Using a GeometryReader to access the size of the parent view
            
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
                        Text("Pick a theme to see bible verses related to it")
                            .whiteTitle() // custom title
                            .foregroundColor(Color.accentColor)
                            .multilineTextAlignment(.center)
                            .padding(15)
  
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 20) { // Start of LazyVGrid
                            ForEach(themes, id: \.self) { theme in // Start of ForEach
                                NavigationLink( // Start of NavigationLink
                                    destination: getDestinationView(for: theme),
                                    tag: theme,
                                    selection: $selectedTheme
                                ) { // End of NavigationLink
                                    Button(action: {
                                        selectedTheme = theme
                                    }) { // Start of Button
                                        Text(theme)
                                            .font(.system(size: 19))
                                            .padding()
                                            .padding(.horizontal)
                                            .foregroundColor(selectedTheme == theme ? .white : .black)
                                            .background(selectedTheme == theme ? Color(#colorLiteral(red: 0.07450980392, green: 0.1333333333, blue: 0.2078431373, alpha: 1)) : Color.clear)
                                            .cornerRadius(30)
                                            .frame(maxWidth: .infinity)
                                    } // End of Button
                                    .buttonStyle(PlainButtonStyle())
                                    .padding()
                                    .padding(.horizontal)
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(30)
                                    .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 2, y: 2) // Outer shadow
                                    .shadow(color: Color.white.opacity(0.5), radius: 2, x: -2, y: -2) // Inner shadow
                                    .onHover { isHovering in
                                        if isHovering {
                                            // Applying highlight effect
                                        } else {
                                            // Removing highlight effect
                                        }
                                    }
                                } // End of NavigationLink
                            } // End of ForEach
                        } // End of LazyVGrid
                        .padding()
                        
                        Spacer()
                    } // End of VStack 1
                    
                    // Skip Button VStack (center aligned) AKA VStack2
                    VStack {
                        Spacer()
                        NavigationLink(destination: Linker()) {
                            PrimaryButton(text: "Skip")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal)
                        .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 2, y: 2)
                        .shadow(color: Color.white.opacity(0.5), radius: 2, x: -2, y: -2)
                    } // End of Skip Button VStack (center aligned) AKA VStack2
                    
                    
                } // End of ZStack
 
        } // End of GeometryReader
    } // End of body
    
    private func getDestinationView(for theme: String) -> some View {
        switch theme {
        case "Faith":
            return AnyView(Faith())
        case "Grace":
            return AnyView(Grace())
        case "Hope":
            return AnyView(Hope())
        case "Love":
            return AnyView(Love())
        case "Overcoming Challenges":
            return AnyView(OC())
        default:
            return AnyView(EmptyView())
        }
    }
} // End of ThemesView

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}
