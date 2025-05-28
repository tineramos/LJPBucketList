@testable import LJPBucketList

struct DashboardAPIErrorStub: DashboardAPIService {
	func getDashboardInfo() async throws -> DashboardInfo {
		throw ErrorMock()
	}
}
