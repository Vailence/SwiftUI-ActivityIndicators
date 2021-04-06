//
//  IndicatorType.swift
//  UnnamedApp
//
//  Created by Akylbek Utekeshev on 3/31/21.
//

import Foundation

enum IndicatorType: CaseIterable, Equatable {
	case basic
	case spinner
	case text
	case halfCircle
	case loadingCircle
	case infinityDots
	
	var title: String {
		switch self {
			case .basic:
				return "Default"
			case .spinner:
				return "Spinner Loader"
			case .text:
				return "Text Loader"
			case .halfCircle:
				return "HalfCircle Loader"
			case .loadingCircle:
				return "Loading Circle"
			case .infinityDots:
				return "Infinity Dots"
		}
	}
}
