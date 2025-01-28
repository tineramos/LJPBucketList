import SwiftUI

struct MenuTabView: View {
	
	enum TabItem: Int, CaseIterable {
		case dashboard = 0
		case gallery
		case extras
	}
	
    var body: some View {
		VStack {
			Text("")
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
				.menuDashboardIcon
		case .gallery:
				.menuGalleryIcon
		case .extras:
				.menuExtrasIcon
		}
	}
	
}

#Preview {
    MenuTabView()
}
