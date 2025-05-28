@testable import LJPBucketList

struct DashboardAPIDummy: DashboardAPIService {
	func getDashboardInfo() async throws -> DashboardInfo {
		return .default
	}
}
