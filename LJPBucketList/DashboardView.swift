//
//  ContentView.swift
//  LJPBucketList
//
//  Created by Tine Ramos on 19/11/2024.
//

import SwiftUI
import SwiftData

private let gridItemSize: CGFloat = 150
private let gridItemSpacing: CGFloat = 20

struct DashboardView: View {
	
	enum Menu: String, CaseIterable {
		case bucketList
		case completed
		case rules
		case instagram
		
		var titleIcon: MenuButton.TitleIcon {
			switch self {
			case .bucketList:
				return .text("422")
			case .completed:
				return .text("31")
			case .rules:
				return .image(.Dashboard.rulesIcon)
			case .instagram:
				return .image(.Dashboard.instagramIcon)
			}
		}
		
		var title: String {
			switch self {
			case .bucketList:
				return "Bucket List"
			case .completed:
				return "Completed"
			case .rules:
				return "Rules"
			case .instagram:
				return "Instagram"
			}
		}
	}

	private let fixedColumn = [
		GridItem(.fixed(gridItemSize), spacing: gridItemSpacing),
		GridItem(.fixed(gridItemSize), spacing: gridItemSpacing)
	]

    var body: some View {
		NavigationStack {
			
			GeometryReader { proxy in
				
				ZStack {
					gradientBackground
					
					VStack(spacing: 16) {
						logoHeader
						coverImage
						contentActions(width: proxy.size.width)
						Spacer()
					}
				}
			}
		}
    }
	
	private var gradientBackground: some View {
		LinearGradient(gradient: Gradient(colors: [.dashboardBackground, .white]),
					   startPoint: .top,
					   endPoint: .bottom)
		.ignoresSafeArea()
	}
	
	private var logoHeader: some View {
		HStack {
			Image(.Dashboard.bucket)
			Image(.Dashboard.ljpBucketListLogo)
			Spacer()
		}
		.padding(.horizontal, 24)
	}
	
	private var coverImage: some View {
		Image(.Dashboard.cover)
			.resizable()
			.frame(alignment: .center)
			.aspectRatio(contentMode: .fit)
	}
	
	private func contentActions(width: CGFloat) -> some View {
		ScrollView {
			LazyVGrid(columns: fixedColumn, alignment: .center, spacing: gridItemSpacing) {
				ForEach(Menu.allCases, id: \.self) { item in
					MenuButton(menuItem: item)
				}
			}
			.frame(maxWidth: .infinity)
		}
		.scrollBounceBehavior(.basedOnSize)
	}
}

struct MenuButton: View {
	
	enum TitleIcon {
		case text(String)
		case image(ImageResource)
	}
	
	let menuItem: DashboardView.Menu
	
//	let title: String
//	let action: () -> Void

	var body: some View {
		Button(action: {
			print("TINE")
		}) {
			VStack {
				switch menuItem.titleIcon {
				case .text(let string):
					Text(string)
						.foregroundStyle(Color.textBlackForeground)
						.font(.largeTitle.bold())
						.padding(.bottom, 8)
				case .image(let imageResource):
					Image(imageResource)
						.foregroundStyle(Color.textGreenForeground)
				}
				Text(menuItem.title)
					.font(.title2.bold())
			}
		}
		.frame(width: gridItemSize, height: gridItemSize)
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
			
		
	}
}

#Preview {
	DashboardView()
}
