# AppReview

⭐️ A tiny library to request review on the AppStore.

This is wrapper around native SKStoreReviewController.

### Review after 3 launches
```swift
AppReview.requestIf(launches: 3)
```

### Review after 5 days
```swift
AppReview.requestIf(days: 5)
```

### Review after 3 launches and 5 days
```swift
App