//
//  KIFSpec.swift
//  GithubStarsTests
//
//  Created by Gabriel Souza de Oliveira on 18/06/20.
//  Copyright © 2020 Gabriel Souza de Oliveira. All rights reserved.
//

import Quick
import KIF

public func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
    return KIFUITestActor(inFile: file, atLine: line, delegate: KIFSpec.getCurrentKIFActorDelegate())
}

public func viewTester(file: String = #file, _ line: Int = #line) -> KIFUIViewTestActor {
    return KIFUIViewTestActor(inFile: file, atLine: line, delegate: KIFSpec.getCurrentKIFActorDelegate())
}

public func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
    return KIFSystemTestActor(inFile: file, atLine: line, delegate: KIFSpec.getCurrentKIFActorDelegate())
}

open class KIFSpec: QuickSpec {
    private static var currentKIFActorDelegate: KIFTestActorDelegate?
    
    private class Prepare: KIFSpec {
        override var name: String {
            return "prepare KIF spec"
        }
    }

    fileprivate class func getCurrentKIFActorDelegate() -> KIFTestActorDelegate {
        let delegate = KIFSpec.currentKIFActorDelegate
        precondition(delegate != nil, "Test actor delegate should be configured. " +
            "Did you attempt to use a KIFTestActor outside of a test?")
        return delegate!
    }

    override open class func setUp() {
        super.setUp()
        currentKIFActorDelegate = Prepare()
    }

    override open class func tearDown() {
        currentKIFActorDelegate = nil
        super.tearDown()
    }
    
    override open func setUp() {
        super.setUp()
        continueAfterFailure = false
        KIFSpec.currentKIFActorDelegate = self
    }
}
