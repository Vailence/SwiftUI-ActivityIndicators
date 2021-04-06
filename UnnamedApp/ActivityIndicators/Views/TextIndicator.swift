//
//  TextIndicator.swift
//  UnnamedApp
//
//  Created by Akylbek Utekeshev on 4/1/21.
//

import SwiftUI

struct TextIndicator: View {
		
	@State var text = ""
	private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	var body: some View {
		Text("Loading \(text)")
			.font(.title2)
			.fontWeight(.bold)
			.transition(.slide)
			.onReceive(timer, perform: { _ in
				if self.text.count == 3 {
					self.text = ""
				} else {
					self.text += "."
				}
			})
	}
}

struct TextIndicator_Previews: PreviewProvider {
	static var previews: some View {
		TextIndicator().previewLayout(.sizeThatFits)
	}
}
