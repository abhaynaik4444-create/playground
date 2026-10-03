import SwiftUI

struct ContentView: View {
    @State private var current: AngelNumber?
    @State private var history: [AngelNumber] = []
    @State private var glow = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.10, green: 0.07, blue: 0.28),
                         Color(red: 0.36, green: 0.22, blue: 0.62),
                         Color(red: 0.93, green: 0.78, blue: 0.86)],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {
                Text("✨ Angel Numbers ✨")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(.top, 24)

                Spacer()

                if let current {
                    VStack(spacing: 16) {
                        Text(current.number)
                            .font(.system(size: 88, weight: .thin, design: .rounded))
                            .foregroundStyle(.white)
                            .shadow(color: .white.opacity(glow ? 0.9 : 0.3), radius: glow ? 24 : 8)
                        Text(current.meaning)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white.opacity(0.95))
                            .padding(.horizontal, 32)
                        ShareLink(item: "\(current.number): \(current.meaning)") {
                            Label("Share", systemImage: "square.and.arrow.up")
                                .foregroundStyle(.white)
                        }
                    }
                    .id(current.id)
                    .transition(.opacity.combined(with: .scale(scale: 0.9)))
                } else {
                    Text("Tap below to receive your message")
                        .foregroundStyle(.white.opacity(0.85))
                }

                Spacer()

                Button(action: generate) {
                    Text(current == nil ? "Reveal My Number" : "Generate Another")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white.opacity(0.9), in: Capsule())
                        .foregroundStyle(Color(red: 0.25, green: 0.15, blue: 0.5))
                }
                .padding(.horizontal, 32)

                if !history.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(history) { item in
                                Button(item.number) {
                                    withAnimation { current = item }
                                }
                                .padding(.horizontal, 12).padding(.vertical, 6)
                                .background(.white.opacity(0.2), in: Capsule())
                                .foregroundStyle(.white)
                            }
                        }
                        .padding(.horizontal, 32)
                    }
                    .frame(height: 36)
                }
            }
            .padding(.bottom, 24)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                glow = true
            }
        }
    }

    private func generate() {
        let next = AngelNumber.random(excluding: current)
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        withAnimation(.spring(duration: 0.5)) {
            current = next
        }
        history.removeAll { $0 == next }
        history.insert(next, at: 0)
        history = Array(history.prefix(10))
    }
}

#Preview {
    ContentView()
}
