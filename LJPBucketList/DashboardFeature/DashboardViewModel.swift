import Foundation
import Observation

@Observable
final class DashboardViewModel {

	private let service: DashboardAPIService

	var dashboardInfo: DashboardInfo?
	var errorMessage: String?
	var isLoading: Bool = false
	
	init(service: DashboardAPIService) {
		self.service = service
	}
	
	var totalBucketlistCountFormatted: String {
		guard let dashboardInfo else { return "-" }
		return "\(dashboardInfo.bucketListItemCount)"
	}
	
	var totalCompletedCountFormatted: String {
		guard let dashboardInfo else { return "-" }
		return "\(dashboardInfo.completedItemCount)"
	}

	func getDashboardInfo() async {
		
		defer {
			isLoading = false
		}
		
		isLoading = true
		
		do {
			dashboardInfo = try await service.getDashboardInfo()
			errorMessage = nil
		} catch {
			errorMessage = error.localizedDescription
		}
	}
}
