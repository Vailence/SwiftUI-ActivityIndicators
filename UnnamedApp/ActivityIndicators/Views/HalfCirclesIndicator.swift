//
//  HalfCirclesIndicator.swift
//  UnnamedApp
//
//  Created by Akylbek Utekeshev on 4/2/21.
//

import SwiftUI

struct HalfCirclesIndicator: View {
		
	@State var animate = false
	private let style = StrokeStyle(lineWidth: 6, lineCap: .round)
	private var firstColor = Color.gray.opacity(0.5)
	private var secondColor = Color.gray
	
	internal init(firstColor: Color = Color.gray.opacity(0.5),
				  secondColor: Color = Color.gray) {
		self.firstColor = firstColor
		self.secondColor = secondColor
	}
	
	var body: some View {
		ZStack {
			Circle()
				.trim(from: 0, to: 0.2)
				.stroke(AngularGradient(gradient: .init(colors: [firstColor, secondColor]), center: .center), style: style)
				.rotationEffect(Angle(degrees: self.animate ? 360 : 0))
				.animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
				.frame(width: 37, height: 37)
			
			Circle()
				.trim(from: 0.5, to: 0.7)
				.stroke(AngularGradient(gradient: .init(colors: [firstColor, secondColor]), center: .center), style: style)
				.rotationEffect(Angle(degrees: self.animate ? 360 : 0))
				.animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
				.frame(width: 37, height: 37)
		}.onAppear() {
			animate.toggle()
		}
	}
}

struct HalfCirclesIndicator_Previews: PreviewProvider {
	static var previews: some View {
		HalfCirclesIndicator()
			.previewLayout(.sizeThatFits)
	}
}
