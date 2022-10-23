
import XCTest
@testable import AppReview

final class AppReviewTests: XCTestCase {
    
    override func setUp() {
        UserDefaults.standard.clear()
    }
    
    func testReviewWithMinLaunches() throws {