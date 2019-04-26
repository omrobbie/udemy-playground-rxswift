import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var publishSubject = PublishSubject<String>()

publishSubject.onNext("Hello")
publishSubject.onNext("World")

let pubSubSubscription = publishSubject.subscribe(onNext: {
    print($0)
})


publishSubject.onNext("Hello")
publishSubject.onNext("Again")

let pubSubSubscriptionTwo = publishSubject.subscribe(onNext: {
    print($0)
})

publishSubject.onNext("Test")
