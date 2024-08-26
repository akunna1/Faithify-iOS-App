//
//  InteractiveQuizzesView.swift
//  Faithify
//
//  Created by Amarachi Akunna Onyekachi on 4/18/24.
//

import SwiftUI

// Defining a struct for a question
struct Question: Identifiable, Decodable {
    let id: Int
    let createAt: String
    let location: String // Bible verse location
    let title: String // The question text i.e bible verse quiz question
    let answer: String // The correct answer
    let options: [String] // List of possible answers
    var selection: String? // User's selected answer
}

struct InteractiveQuizzesView: View {
    @Binding var question: Question
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Background Image
                Image("faithify_bg4")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1)
                
                // Content
                VStack {
                    HStack {
                        Text("Select the Correct Answer")
                            .whiteTitle()
                            .padding(.bottom, 30)
                    }
                    
                    VStack(alignment: .leading) {
                        VStack(spacing: 20) {
                            Spacer()
                            
                            Text(question.location)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text(question.title)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Spacer().frame(height: 20)
                            
                            ForEach(question.options, id: \.self) { option in
                                HStack {
                                    Button(action: {
                                        question.selection = option
                                    }) {
                                        HStack {
                                            Circle()
                                                .fill(question.selection == option ? Color.white : Color.clear)
                                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                                .frame(width: 24, height: 24)
                                                .shadow(radius: 3)
                                            Text(option)
                                                .font(.system(size: 20))
                                        }
                                        .padding(.horizontal)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            Spacer()
                        }
                    }
                    .frame(width: 350, height: 580)
                    .foregroundColor(.white)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 2, y: 2)
                }
            }
        }
    }
}

// Preview provider for the InteractiveQuizzesView
struct InteractiveQuizzesView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveQuizzesView(question: .constant(Question(id: 1, createAt: "", location: "Psalm 23:1", title: "The Lord is my ____, I shall not ____.", answer: "shepherd, want", options: ["shepherd, want", "guide, fear", "king, worry", "leader, falter"])))
    }
}

