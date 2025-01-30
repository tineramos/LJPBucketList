import SwiftUI

struct MenuTabView: View {
	
	enum TabItem: Int, CaseIterable {
		case dashboard = 0
		case gallery
		case extras
	}
	
	@State var selectedTab: TabItem = .dashboard
	
    var body: some View {
		TabView(selection: $selectedTab) {
			ForEach(TabItem.allCases, id: \.self) { item in
				createTabItem(for: item)
			}
			.toolbarBackground(.visible, for: .tabBar)
		}
    }

	@ViewBuilder
	private func createTabItem(for item: TabItem) -> some View {
		item.contentView
			.tabItem {
				Image(item.image)
				Text(item.title)
			}
	}
}

private extension MenuTabView.TabItem {
	
	var title: LocalizedStringResource {
		switch self {
		case .dashboard:
			"Dashboard"
		case .gallery:
			"Gallery"
		case .extras:
			"Extras"
		}
	}
	
	var image: ImageResource {
		switch self {
		case .dashboard:
				.Menu.dashboard
		case .gallery:
				.Menu.gallery
		case .extras:
				.Menu.extras
		}
	}
	
	@ViewBuilder
	var contentView: some View {
		switch self {
		case .dashboard:
			DashboardView()
		case .gallery:
			GalleryView()
		case .extras:
			ExtrasView()
		}
	}
}

struct GalleryView: View {
	var body: some View {
		Text("GalleryView")
	}
}

struct ExtrasView: View {
	var body: some View {
		Text("ExtrasView")
	}
}

#Preview {
    MenuTabView()
}
