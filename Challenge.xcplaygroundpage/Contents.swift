import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var publishSubject = PublishSubject<String>()

let publishSubjectSubscription = publishSubject.subscribe(onNext: {
    print("Movie Title: \($0)")
})

publishSubject.onNext("Spiderman")
publishSubject.onNext("Ironman")
publishSubject.onNext("Superman")

print("\n")

var behaviorSubject = BehaviorSubject<Double>(value: 0.0)
var bankBalance = Variable<Double>(100.0)

print("Bank Balance: $\(bankBalance.value)")

behaviorSubject.onNext(100.0)

let behaviorSubjectSubscription = behaviorSubject.subscribe(onNext: {
    print("Add: $\($0)")
    bankBalance.value += $0
})

behaviorSubject.onNext(10.0)
behaviorSubject.onNext(5.0)

print("Bank Balance: $\(bankBalance.value)")

print("\n")

var twitterSubject = ReplaySubject<String>.create(bufferSize: 3)

let twitterSubjectSubscription = twitterSubject.subscribe(onNext: {
    print("Followed: @\($0)")
})

twitterSubject.onNext("daprin")
twitterSubject.onNext("putu")
twitterSubject.onNext("ngakan")
twitterSubject.onNext("dewa")

let newTwitterUser = twitterSubject.subscribe(onNext: {
    print("New Twitter User: @\($0)")
})

print("\n")

var fullname = Variable<String>("omrobbie")

fullname.asObservable().subscribe(onNext: {
    print($0)
})

fullname.value = "Putu Roby"
fullname.value = "I Putu Roby Irawan"
