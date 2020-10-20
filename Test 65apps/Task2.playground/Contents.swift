import UIKit

let serialQueue = DispatchQueue(label: "com.foo.bar")
serialQueue.async {
    print("Work 1")
    serialQueue.sync {
        print("Work 2") }
}
