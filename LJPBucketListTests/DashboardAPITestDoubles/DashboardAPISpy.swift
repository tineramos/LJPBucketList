@testable import LJPBucketList

final class DashboardAPISpy: DashboardAPIService {
	
	enum Event {
		case getDashboardInfo
	}
	
	private(set) var logs: [Event] = []
	
	func getDashboardInfo() async throws -> DashboardInfo {
		logs.append(.getDashboardInfo)
		return .default
	}
	
	func clearLogs() {
		logs.removeAll()
	}
}
