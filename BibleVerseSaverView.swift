//
//  BibleVerseSaverView.swift
//  Faithify
//
//  Created by Amarachi Akunna Onyekachi on 4/18/24.
//

import SwiftUI

struct BibleVerseSaverView: View {
    
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
                        VStack(spacing: 5) { // Start of VStack 2
                            Spacer()
                            HStack {
                                Text("Your Saved Verses")
                                    .whiteTitle()
                            } // End of HStack
                            Spacer()
                            } // End of VStack 2
                        }
                    
                } // End of ZStack
            }    // end of NavigationView
            
        } // End of GeometryReader
    } // End of body
} // End of BibleVerseSaverView

struct BibleVerseSaverView_Previews: PreviewProvider {
    static var previews: some View {
        BibleVerseSaverView()
    }
}
