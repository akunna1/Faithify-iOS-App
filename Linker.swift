//
//  Linker.swift
//  Faithify
//
//  Created by Amarachi Akunna Onyekachi on 2/22/24.
//

import SwiftUI


struct Linker: View {
    
    let tools = ["Quiz Yourself", "Verse Saver", "Progress Tracker"]
    @State private var selectedTool: String? = nil
    
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
                    Text("Memorization Tools")
                        .whiteTitle() // custom title
                        .foregroundColor(Color.accentColor)
                        .multilineTextAlignment(.center)
                        .padding(15)
                    
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 20) { // Start of LazyVGrid
                        ForEach(tools, id: \.self) { tool in // Start of ForEach
                            NavigationLink( // Start of NavigationLink
                                destination: getDestinationView(for: tool),
                                tag: tool,
                                selection: $selectedTool
                            ) { // End of NavigationLink
                                Button(action: {
                                    selectedTool = tool
                                }) { // Start of Button
                                    Text(tool)
                                        .font(.system(size: 19))
                                        .padding()
                                        .padding(.horizontal)
                                        .foregroundColor(selectedTool == tool ? .white : .black)
                                        .background(selectedTool == tool ? Color(#colorLiteral(red: 0.07450980392, green: 0.1333333333, blue: 0.2078431373, alpha: 1)) : Color.clear)
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
                            } // End of NavigationLink
                        } // End of ForEach
                    } // End of LazyVGrid
                    .padding()
                    
                    Spacer()
                } // End of VStack
            } // End of ZStack
        } // End of GeometryReader
    } // End of body
    
    private func getDestinationView(for tool: String) -> some View {
        switch tool {
        case "Quiz Yourself":
            return AnyView(QuizHosterView())
        case "Verse Saver":
            return AnyView(BibleVerseSaverView())
        case "Progress Tracker":
            return AnyView(ProgressTrackingView())
        default:
            return AnyView(EmptyView())
        }
    }
} // End of Linker

struct Linker_Previews: PreviewProvider {
    static var previews: some View {
        Linker()
    }
}
