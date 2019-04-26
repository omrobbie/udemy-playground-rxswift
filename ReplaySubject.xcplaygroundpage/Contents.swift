import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var accountSubject = ReplaySubject<Double>.create(bufferSize: 3)

var accountManager = accountSubject.subscribe(onNext: {
    print("Transaction amount 1: $\($0)")
})

accountSubject.onNext(12.49)
accountSubject.onNext(299.00)
accountSubject.onNext(15.00)
accountSubject.onNext(80.0)
accountSubject.onNext(74.12)
accountSubject.onNext(100.0)

print("\n")

var lastThreeTransactions = accountSubject.subscribe(onNext: {
    print("Transaction amount 2: $\($0)")
})

print("\n")

accountSubject.onNext(1.0)

print("\n")

var nextThreeTransaction = accountSubject.subscribe(onNext: {
    print("Transaction amount 3: $\($0)")
})
