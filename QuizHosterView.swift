//
//  QuizHosterView.swift
//  Faithify
//
//  Created by Amarachi Akunna Onyekachi on 7/16/24.
//

import SwiftUI

struct QuizHosterView: View {
    @StateObject var manager = QuizManager()
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
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
                        VStack(spacing: 5) {
                            TabView {
                                ForEach(manager.questions.indices, id: \.self) { index in
                                    InteractiveQuizzesView(question: $manager.questions[index])
                                }
                            }
                            .tabViewStyle(.page)
                            
                            if manager.canSubmitQuiz() {
                                Button {
                                    print(manager.gradeQuiz())
                                } label: {
                                    PrimaryButton(text: "Submit Quiz")
                                }
                                .buttonStyle(.plain)
                                .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct QuizHosterView_Previews: PreviewProvider {
    static var previews: some View {
        QuizHosterView()
    }
}
