//
//  Comparators.swift
//  Comparators
//
//  Created by eyemac on 21/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation

extension Equatable {

    public var `is`: Is<Self> {
        return Is(self)
    }

}

public protocol Being {
    associatedtype Source
    var source: Source { get }
}

public struct Is<Source>: Being {

    public let source: Source

    init(_ source: Source) {
        self.source = source
    }

}

public protocol Toable {
    associatedtype Source
    func to(_ target: Source) -> Bool
}

extension Is: Toable where Source: Equatable {
    public func to(_ target: Source) -> Bool {
        return source == target
    }
}

public struct Not<Source: Equatable>: Being {
    public let source: Source

    init(_ source: Source) {
        self.source = source
    }

    public func to(_ target: Source) -> Bool {
        return source != target
    }

    public func `in`<S: Sequence>(_ sequence: S) -> Bool where S.Element == Source {
        return !sequence.contains(source)
    }
}

public struct NotSequence<Source: Equatable> {
    public let source: [Source]

    init(_ source: [Source]) {
        self.source = source
    }

    public func to(_ target: [Source]) -> Bool {
        return source != target
    }
}

extension Is where Source: Equatable {
    var not: Not<Source> { return Not(self.source) }

    public func to(_ target: Source) -> Bool {
        return source == target
    }

    public func `in`<S: Sequence>(_ sequence: S) -> Bool where S.Element == Source {
        return sequence.contains(source)
    }
}
