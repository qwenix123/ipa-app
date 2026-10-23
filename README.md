# 🚀 ClickerApp (iOS IPA Generator)

Базовое iOS-приложение на **SwiftUI** с возможностью автоматической компиляции в `.ipa` через **GitHub Actions** прямо с Windows.

## 📁 Структура проекта
- `ClickerApp/` — исходный код приложения на SwiftUI (`App.swift`, `ContentView.swift`, `Info.plist`).
- `project.yml` — конфигурация для XcodeGen (генерирует `.xcodeproj` без необходимости запускать Xcode на Windows).
- `.github/workflows/build-ipa.yml` — сценарий CI/CD для виртуальной машины macOS на GitHub.

## 🛠 Как собрать .ipa через GitHub:
1. Создайте новый репозиторий на GitHub.
2. Инициализируйте git и загрузите файлы:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/ВАШ_ЛОГИН/ВАШ_РЕПОЗИТОРИЙ.git
   git push -u origin main
   ```
3. Откройте вкладку **Actions** в вашем репозитории на GitHub.
4. Дождитесь завершения сборки `Build iOS IPA`.
5. Скачайте готовый `.ipa` из раздела **Artifacts**.
6. Установите на iPhone через Sideloadly / AltStore.
