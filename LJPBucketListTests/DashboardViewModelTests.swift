import Testing
@testable import LJPBucketList

struct DashboardViewModelTests {

	struct DashboardInfoCase {
		
		@Test(arguments: zip([DashboardInfo.default, nil], ["10", "-"]))
		func totalBucketlistCountFormatted(info: DashboardInfo?, expected: String) async throws {
			let sut = DashboardViewModel(service: DashboardAPIDummy())
			sut.dashboardInfo = info
			#expect(sut.totalBucketlistCountFormatted == expected)
		}
		
		@Test(arguments: zip([DashboardInfo.default, nil], ["4", "-"]))
		func totalCompletedCountFormatted(info: DashboardInfo?, expected: String) async throws {
			let sut = DashboardViewModel(service: DashboardAPIDummy())
			sut.dashboardInfo = info
			#expect(sut.totalCompletedCountFormatted == expected)
		}
	}
	
	struct DashboardService {

		@Test func getDashboardInfoCallsToService() async {
			let dashboardServiceSpy = DashboardAPISpy()
			let sut = DashboardViewModel(service: dashboardServiceSpy)
			
			await sut.getDashboardInfo()
			
			#expect(dashboardServiceSpy.logs == [.getDashboardInfo])
		}
	}

	struct ErrorMessage {
		
		@Test func getDashboardInfoResetsError() async {
			let dashboardServiceSpy = DashboardAPISpy()
			let sut = DashboardViewModel(service: dashboardServiceSpy)
			
			await sut.getDashboardInfo()
			
			#expect(sut.errorMessage == nil)
		}

		@Test func getDashboardInfoErrorCase() async {
			
			let dashboardAPIErrorStub = DashboardAPIErrorStub()
			let sut = DashboardViewModel(service: dashboardAPIErrorStub)
			
			await sut.getDashboardInfo()
			
			#expect(sut.errorMessage != nil)
		}
	}
}
