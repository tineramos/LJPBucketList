import SwiftUI

struct MenuButton: View {

	enum SubtitleType: Hashable {
		case text(String)
		case image(ImageResource)
	}

	struct Model: Hashable {
		let title: String
		let subtitle: SubtitleType
		let accessibilityLabel: String?
		
		init(title: String, subtitle: SubtitleType, accessibilityLabel: String? = nil) {
			self.title = title
			self.subtitle = subtitle
			self.accessibilityLabel = accessibilityLabel
		}
	}
	
	let model: Model
	let size: CGFloat

//	let action: () -> Void

	var body: some View {
		Button(action: {
			print("TINE")
		}) {
			VStack {
				switch model.subtitle {
				case .text(let string):
					Text(string)
						.foregroundStyle(Color.textBlackForeground)
						.font(.largeTitle.bold())
						.padding(.bottom, 8)

				case .image(let imageResource):
					Image(imageResource)
						.foregroundStyle(Color.textGreenForeground)
				}

				Text(model.title)
					.font(.title2.bold())
			}
		}
		.frame(minWidth: size, minHeight: size)
		.background(
			LinearGradient(
				stops: [
					.init(color: .white.opacity(0.3), location: 0),
					.init(color: .dashboardBackground.opacity(0.7), location: 1),
				],
				startPoint: .topLeading,
				endPoint: .bottomTrailing
			)
		)
		.cornerRadius(20)
		.overlay(
			RoundedRectangle(cornerRadius: 20)
				.inset(by: 0.5)
				.stroke(Color.white, lineWidth: 0.2)
		)
		.accessibilityElement(children: .combine)
		.accessibilityLabel(model.accessibilityLabel ?? model.title)
	}
}
