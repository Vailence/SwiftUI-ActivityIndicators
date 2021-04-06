//
//  ContentView.swift
//  UnnamedApp
//
//  Created by Akylbek Utekeshev on 3/31/21.
//

import SwiftUI

struct ContentView: View {
	
	@State private var animate = false
	@State private var type: IndicatorType = .halfCircle
	
    var body: some View {
		NavigationView {
			ZStack {
				if animate {
					LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom)
					
					VStack {
						Spacer()
						WhiteBorderView(animate: .constant(animate), type: .constant(type))
						Spacer()
					}
					.onTapGesture {
						animate.toggle()
					}
				} else {
					LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).opacity(0.9)
					
					VStack(spacing: 16) {
						ForEach(IndicatorType.allCases, id: \.self) { type in
							Button(action: {
								animate.toggle()
								self.type = type
							}, label: {
								Text(type.title)
									.fontWeight(.bold)
									.font(.title)
									.foregroundColor(.black)
									.frame(width: 300, height: 80)
									.background(Color.white).opacity(0.8)
									.cornerRadius(15)
							})
						}
					}
				}
			}.ignoresSafeArea()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
