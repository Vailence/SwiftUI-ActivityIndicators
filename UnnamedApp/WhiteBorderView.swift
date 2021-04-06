//
//  WhiteBorderView.swift
//  UnnamedApp
//
//  Created by Akylbek Utekeshev on 3/31/21.
//

import SwiftUI

struct WhiteBorderView: View {
	
	@Binding var animate: Bool
	@Binding var type: IndicatorType
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 25)
				.fill(Color.white)
				.frame(width: 200, height: 200)
				.shadow(radius: 5)
				.border(Color.black, width: 0.1)
			Group {
				switch type {
					case .basic:
						DefaultIndicator(animate: .constant(animate))
					case .spinner:
						SpinnerIndicator()
					case .text:
						TextIndicator()
					case .halfCircle:
						HalfCirclesIndicator()
					case .loadingCircle:
						LoadingCircleIndicator()
					case .infinityDots:
						InfinityProgressIndicator()
				}
			}
		}
	}
}

struct WhiteBorderView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			WhiteBorderView(animate: .constant(true), type: .constant(.spinner))
				.previewLayout(.sizeThatFits)
		}
	}
}
