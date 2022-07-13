
// Mezhevikin Alexey: https://github.com/mezhevikin/AppReview
import StoreKit

public class AppReview {
    
    public let minLaunches: Int
    public let minDays: Int

    public init(minLaunches: Int = 0, minDays: Int = 0) {
        self.minLaunches = minLaunches
        self.minDays = minDays
    }