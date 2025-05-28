import SwiftUI

private let gridItemSize: CGFloat = 150
private let gridItemSpacing: CGFloat = 20

struct DashboardView: View {
	
	enum Item: String, CaseIterable {
		case bucketList
		case completed
		case rules
		case instagram

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
	
	@State private var viewModel = DashboardViewModel(service: LJPAPIService())

	private let fixedColumn = [
		GridItem(.flexible(), spacing: gridItemSpacing),
		GridItem(.flexible(), spacing: gridItemSpacing)
	]

    var body: some View {

		NavigationStack {

			GeometryReader { proxy in
				
				ZStack {
					gradientBackground
					contentsView(proxy: proxy)
				}
			}
		}
		.task {
			await viewModel.getDashboardInfo()
		}
    }
	
	private func contentsView(proxy: GeometryProxy) -> some View {
		VStack(spacing: 16) {
			logoHeader
			coverImage
			contentActions(width: proxy.size.width)
			Spacer()
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
		
		let gridItemSize: CGFloat = (width - (gridItemSpacing * 2)) / 2

		let menuItems: [MenuButton.ViewModel] = [.init(title: Item.bucketList.title,
													   value: .text(viewModel.totalBucketlistCountFormatted)),
												 .init(title: Item.completed.title,
													   value: .text(viewModel.totalCompletedCountFormatted)),
												 .init(title: Item.rules.title,
													   value: .image(.Dashboard.rulesIcon)),
												 .init(title: Item.instagram.title,
													   value: .image(.Dashboard.instagramIcon))]
		
		return ScrollView {
			LazyVGrid(columns: fixedColumn, alignment: .center, spacing: gridItemSpacing) {
				ForEach(menuItems, id: \.self) { item in
					MenuButton(viewModel: item, size: gridItemSize)
				}
			}
			.frame(maxWidth: .infinity)
			.padding(.horizontal, gridItemSpacing)
			.redacted(reason: viewModel.isLoading ? .placeholder : [])
		}
		.scrollBounceBehavior(.basedOnSize)
	}
}

#Preview {
	DashboardView()
}
