

import Foundation
import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class ScheduleDepsdd07db76ce27ce34c05bProvider: ScheduleDeps {
    var name: Name {
        return groupsListComponent.name
    }
    private let groupsListComponent: GroupsListComponent
    init(groupsListComponent: GroupsListComponent) {
        self.groupsListComponent = groupsListComponent
    }
}
/// ^->RootComponent->GroupsListComponent->ScheduleComponent
private func factory37d1429a85fb0ddf51999974d7e072a0cda74085(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ScheduleDepsdd07db76ce27ce34c05bProvider(groupsListComponent: parent1(component) as! GroupsListComponent)
}
private class ScheduleDepse9554de5c0c0bba38facProvider: ScheduleDeps {
    var name: Name {
        return teachersListComponent.name
    }
    private let teachersListComponent: TeachersListComponent
    init(teachersListComponent: TeachersListComponent) {
        self.teachersListComponent = teachersListComponent
    }
}
/// ^->RootComponent->TeachersListComponent->ScheduleComponent
private func factorybff1430757b5744b7e4a86f4b782155f4f622050(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ScheduleDepse9554de5c0c0bba38facProvider(teachersListComponent: parent1(component) as! TeachersListComponent)
}

#else
extension ScheduleComponent: Registration {
    public func registerItems() {
        keyPathToName[\ScheduleDeps.name] = "name-Name"
    }
}
extension RootComponent: Registration {
    public func registerItems() {


    }
}
extension GroupsListComponent: Registration {
    public func registerItems() {


    }
}
extension TeachersListComponent: Registration {
    public func registerItems() {


    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->RootComponent->GroupsListComponent->ScheduleComponent", factory37d1429a85fb0ddf51999974d7e072a0cda74085)
    registerProviderFactory("^->RootComponent->TeachersListComponent->ScheduleComponent", factorybff1430757b5744b7e4a86f4b782155f4f622050)
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->GroupsListComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->TeachersListComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
