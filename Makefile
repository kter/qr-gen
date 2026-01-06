.PHONY: help run build-debug build-release clean analyze test pub-get install

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

run: ## Run app on connected device/emulator
	flutter run

build-debug: ## Build debug APK
	flutter build apk --debug

build-release: ## Build release APK
	flutter build apk --release

build-bundle: ## Build Android App Bundle for Play Store
	flutter build appbundle --release

clean: ## Clean build artifacts
	flutter clean

analyze: ## Run static analysis
	flutter analyze

test: ## Run tests
	flutter test

pub-get: ## Get dependencies
	flutter pub get

pub-upgrade: ## Upgrade dependencies
	flutter pub upgrade

install: ## Install debug APK to connected device
	adb install build/app/outputs/flutter-apk/app-debug.apk

devices: ## List connected devices
	flutter devices

logs: ## Show Flutter logs
	flutter logs
