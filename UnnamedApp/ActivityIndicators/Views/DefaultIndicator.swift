//
//  DefaultIndicator.swift
//  UnnamedApp
//
//  Created by Akylbek Utekeshev on 3/31/21.
//

import SwiftUI

struct DefaultIndicator: UIViewRepresentable {
	
	@Binding var animate: Bool
	
	func makeUIView(context: UIViewRepresentableContext<DefaultIndicator>) -> UIActivityIndicatorView {
		return .init(style: .large)
	}
	
	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
		animate ? uiView.startAnimating() : uiView.stopAnimating()
	}
}

struct DefaultIndicator_Previews: PreviewProvider {
	static var previews: some View {
		DefaultIndicator(animate: .constant(true))
			.previewLayout(.sizeThatFits)
	}
}
