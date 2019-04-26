import RxSwift
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

Observable.of("omrobbie", "daprin", "putu")
    .map {
        $0.capitalized
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("\n")

struct Car {
    var carPrice: Variable<Double>
}

let honda = Car(carPrice: Variable(2000.0))
let daihatsu = Car(carPrice: Variable(1500.0))

let carSubject = PublishSubject<Car>()

carSubject
    .flatMap {
        $0.carPrice.asObservable()
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

carSubject.onNext(honda)
carSubject.onNext(daihatsu)

print("\n")

struct Element {
    var name: String
    var abbreviation: String
    var periodicNumber: Int
}

let actinium = Element(name: "Actinium", abbreviation: "Ac", periodicNumber: 89)
let aluminum = Element(name: "Aluminum", abbreviation: "Al", periodicNumber: 13)
let americium = Element(name: "Americium", abbreviation: "Am", periodicNumber: 95)
let antimony = Element(name: "Antimony", abbreviation: "Sb", periodicNumber: 51)
let argon = Element(name: "Argon", abbreviation: "Ar", periodicNumber: 18)

Observable.of(actinium, aluminum, americium, antimony, argon)
    .filter {
        $0.periodicNumber < 20
    }
    .subscribe(onNext: {
        print("\($0.name)\t \($0.abbreviation)\t \($0.periodicNumber)")
    })
    .disposed(by: disposeBag)

print("\n")

let nameObservable = Observable.of("roby", "daprin", "putu")
let usernameObservable = Observable.of("omrobbie", "codeapin", "joli")

Observable.zip(nameObservable, usernameObservable) {
    $0 + "\t " + $1
    }.subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
