import Foundation

protocol DashboardAPIService {
	func getDashboardInfo() async throws -> DashboardInfo
}

final class LJPAPIService {
	
	enum Error: Swift.Error {
		case invalidURL
		case genericError
	}
	
	private let session: URLSession
	
	init(session: URLSession = .shared) {
		self.session = session
	}
}

extension LJPAPIService: DashboardAPIService {
	
	func getDashboardInfo() async throws -> DashboardInfo {
		
		var urlComponents: URLComponents = URLComponents()
		urlComponents.scheme = "https"
		urlComponents.host = "tineramos.github.io"
		urlComponents.path = "/LJPBucketListJSON/dashboard.json"
		
		guard let url = urlComponents.url else {
			throw Error.invalidURL
		}
		
		do {
			let (data, _) = try await session.data(from: url)
			return try decoder.decode(DashboardInfo.self, from: data)
		} catch {
			throw Error.genericError
		}
	}
}

private extension LJPAPIService {

	var decoder: JSONDecoder {
		return JSONDecoder()
	}
}
