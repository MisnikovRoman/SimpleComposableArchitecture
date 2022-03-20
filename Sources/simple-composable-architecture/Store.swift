import SwiftUI

@MainActor
open class Store<State, Action, Dependencies>: ObservableObject {

    // MARK: - Public Properties
    
    @Published public var state: State
    
    // MARK: - Private Properties
    
    private let dependencies: Dependencies
    
    // MARK: - Initializers
    
    public init(initialState: State, dependencies: Dependencies) {
        self.state = initialState
        self.dependencies = dependencies
    }
    
    // MARK: - Open methods
    
    open func reduce(_ state: inout State, _ action: Action, _ dependencies: Dependencies) -> Task<Action, Error>? {
        fatalError("Need override reduce() method")
    }
    
    open func handleAsyncError(_ error: Error) {
        assertionFailure("Необработанная ошибка")
    }
    
    // MARK: - Public methods
    
    public func send(_ action: Action) {
        if let nextTask = reduce(&state, action, dependencies) {
            Task {
                do {
                    let nextAction = try await nextTask.value
                    send(nextAction)
                } catch {
                    handleAsyncError(error)
                }
            }
        }
    }
}
