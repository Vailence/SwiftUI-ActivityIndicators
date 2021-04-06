//
//  InfinityProgressIndicator.swift
//  UnnamedApp
//
//  Created by Akylbek Utekeshev on 4/2/21.
//

import SwiftUI

struct InfinityProgressIndicator: View {
	
	@State var index = 0
	@State var animate = false
	@State var colors: [Color] = [.blue, .red, .yellow, .green]
	private let style = StrokeStyle(lineWidth: 6, lineCap: .round)
	private var firstColor = Color.gray.opacity(0.5)
	private var secondColor = Color.gray
	private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	internal init(firstColor: Color = Color.gray.opacity(0.5),
				  secondColor: Color = Color.gray) {
		self.firstColor = firstColor
		self.secondColor = secondColor
	}
	
	var body: some View {
		ZStack {
			HStack(spacing: 16) {
				ForEach(0..<4) { index in
					Circle()
						.fill(colors[index])
//						.fill(index == self.index ? Color.red : Color.blue)
						.frame(width: 15, height: 15, alignment: .leading)
						.animation(.easeInOut)
				}
			}
		}.onAppear() {
			animate.toggle()
		}.onReceive(timer, perform: { _ in
//			if index == 3 {
//				index = 0
//			} else {
//				index += 1
//			}
			
			rearrange()
		})
	}
	
	func rearrange() {
		let element = colors.last!
		colors.removeLast()
		colors.insert(element, at: 0)
	}
}

struct InfinityProgressIndicator_Previews: PreviewProvider {
	static var previews: some View {
		InfinityProgressIndicator()
			.previewLayout(.fixed(width: 100, height: 100))
	}
}


extension Color {
	static var random: Color {
		return Color(
			red: .random(in: 0...1),
			green: .random(in: 0...1),
			blue: .random(in: 0...1)
		)
	}
}
