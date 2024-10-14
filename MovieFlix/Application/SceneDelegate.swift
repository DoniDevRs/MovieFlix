//
//  SceneDelegate.swift
//  MovieFlix
//
//  Created by Doni Silva on 19/09/24.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var flowController: MFBaseFlowController!
    var factory: MFFactoryProtocol!
    
    open lazy var assembler: Assembler = {
        let assembler = Assembler()
        return assembler
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let rootNavigation = MFNavigationController()
        rootNavigation.defaultConfiguration()
        
        setup()
        factory = MFFactory(resolver: assembler.resolver)
        flowController = MFBaseFlowController(flowNavigation: rootNavigation, 
                                              factory: factory)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = flowController?.rootViewController()
    }
    
    public func setup() {
        assembler.apply(assemblies: DependencyGraph.build())
    }
}
