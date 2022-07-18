
// Mezhevikin Alexey: https://github.com/mezhevikin/AppReview
import StoreKit

public class AppReview {
    
    public let minLaunches: Int
    public let minDays: Int

    public init(minLaunches: Int = 0, minDays: Int = 0) {
        self.minLaunches = minLaunches
        self.minDays = minDays
    }
    
    @discardableResult
    public static func requestIf(launches: Int = 0, days: Int = 0) -> Bool {
        AppReview(minLaunches: launches, minDays: days).requestIfNeeded()
    }