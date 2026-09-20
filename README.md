# Playerok Beta

Статичная бета-версия приложения Playerok на Flutter: главный экран и экран чатов (чат поддержки, чат Playerok и чаты сделок). Остальные вкладки — заглушки.

## Структура

```
.github/workflows/build.yml
playerok_app/
```

## Сборка

1. Залей содержимое в репозиторий GitHub, сохранив структуру.
2. Запушь в ветку main или запусти вручную: Actions, Build Playerok, Run workflow.
3. Когда все три задачи станут зелёными, скачай артефакт Playerok-builds. Внутри Playerok.apk и Playerok.ipa.

Отдельно доступны артефакты playerok-android-apk и playerok-ios-unsigned-ipa.

## iOS

Playerok.ipa собирается без подписи. Подпиши его в ESign своим сертификатом и установи.

## Android

APK подписан debug-ключом Flutter и устанавливается напрямую.
