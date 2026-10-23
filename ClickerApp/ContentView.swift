import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var step = 1

    var body: some View {
        ZStack {
            // Градиентный фон
            LinearGradient(
                colors: [Color.indigo, Color.purple, Color.black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                // Заголовок
                VStack(spacing: 8) {
                    Text("🚀 iOS Clicker")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text("Собрано на Windows через GitHub Actions")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 40)

                Spacer()

                // Табло со счетчиком
                VStack(spacing: 12) {
                    Text("СЧЕТ")
                        .font(.caption.bold())
                        .foregroundColor(.white.opacity(0.6))
                        .tracking(3)

                    Text("\(count)")
                        .font(.system(size: 72, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 35)
                .background(.ultraThinMaterial)
                .cornerRadius(24)
                .padding(.horizontal, 24)

                // Выбор шага (+1, +5, +10)
                HStack(spacing: 12) {
                    ForEach([1, 5, 10], id: \.self) { value in
                        Button(action: { step = value }) {
                            Text("+\(value)")
                                .font(.subheadline.bold())
                                .foregroundColor(step == value ? .white : .white.opacity(0.7))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(step == value ? Color.purple : Color.white.opacity(0.15))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal, 24)

                // Основная кнопка клика
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        count += step
                    }
                }) {
                    HStack {
                        Image(systemName: "hand.tap.fill")
                        Text("Клик (+\(step))")
                    }
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .background(
                        LinearGradient(
                            colors: [Color.blue, Color.cyan],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(20)
                    .shadow(color: .cyan.opacity(0.4), radius: 10, y: 5)
                }
                .padding(.horizontal, 24)

                // Кнопка сброса
                Button(action: {
                    withAnimation {
                        count = 0
                    }
                }) {
                    Text("Сбросить счет")
                        .font(.subheadline.semibold())
                        .foregroundColor(.red.opacity(0.9))
                }
                .padding(.top, 10)

                Spacer()
            }
        }
    }
}
