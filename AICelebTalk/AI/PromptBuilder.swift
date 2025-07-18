import Foundation

class PromptBuilder {
    func buildPrompt(system: String, persona: String, partnerProfile: String, safety: String) -> String {
        return "SYSTEM: \(system)\nPERSONA: \(persona)\nPARTNER: \(partnerProfile)\nSAFETY: \(safety)"
    }
}