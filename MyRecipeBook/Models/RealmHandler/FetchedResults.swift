/*
 * Copyright © 2017-present Naeem G Shaikh. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation
import RealmSwift

public final class FetchedResults<T: Persistable> {
  internal let results: Results<T.ManagedObject>
  
  public var count: Int {
    return results.count
  }
  
  internal init(results: Results<T.ManagedObject>) {
    self.results = results
  }
  
  public func value(at index: Int) -> T {
    return T(managedObject: results[index])
  }
}

// MARK: - Collection

extension FetchedResults: Collection {
  
  public var startIndex: Int {
    return 0
  }
  
  public var endIndex: Int {
    return count
  }
  
  public func index(after i: Int) -> Int {
    precondition(i < endIndex)
    return i + 1
  }
  
  public subscript(position: Int) -> T {
    return value(at: position)
  }
}