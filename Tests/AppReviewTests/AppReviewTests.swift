
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
        XCTAssertNotNil(review.firstLaunchDate)
        
        // Launch 2
        XCTAssertFalse(review.requestIfNeeded())
        XCTAssertEqual(review.launches, 2)
        
        // Launch 3 ✅
        XCTAssertTrue(review.requestIfNeeded())
        XCTAssertEqual(review.launches, 3)
        XCTAssertNotNil(review.lastReviewDate)
        XCTAssertNotNil(review.lastReviewVersion)
        
        // Launch 4
        XCTAssertFalse(review.requestIfNeeded())
        XCTAssertEqual(review.launches, 4)
    }
    
    func testReviewWithMinDays() throws {
        let now = Date()
        
        let review = AppReview(minLaunches: 3, minDays: 5)
        
        // Before
        XCTAssertEqual(review.launches, 0)
        XCTAssertNil(review.firstLaunchDate)
        XCTAssertNil(review.lastReviewDate)
        XCTAssertNil(review.lastReviewVersion)
        
        // Launch 1
        XCTAssertFalse(review.requestIfNeeded())
        XCTAssertEqual(review.launches, 1)
        XCTAssertNotNil(review.firstLaunchDate)
        XCTAssertNil(review.lastReviewDate)
        XCTAssertNil(review.lastReviewVersion)
        XCTAssertEqual(review.daysAfterFirstLaunch, 0)
        
        // Launch 2 in 4 days after first launch
        review.firstLaunchDate = now.shiftDays(-4)
        XCTAssertFalse(review.requestIfNeeded())
        XCTAssertEqual(review.launches, 2)