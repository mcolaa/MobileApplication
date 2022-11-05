
import XCTest
@testable import AppReview

final class AppReviewTests: XCTestCase {
    
    override func setUp() {
        UserDefaults.standard.clear()
    }
    
    func testReviewWithMinLaunches() throws {
        let review = AppReview(minLaunches: 3)
        
        // Before
        XCTAssertEqual(review.launches, 0)
        XCTAssertNil(review.firstLaunchDate)
        XCTAssertNil(review.lastReviewDate)
        XCTAssertNil(review.lastReviewVersion)
        
        // Launch 1
        XCTAssertFalse(review.requestIfNeeded())
        XCTAssertEqual(review.launches, 1)