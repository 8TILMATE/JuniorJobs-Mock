# Junior Jobs

Aplicatie Flutter demo pentru tineri care cauta stagii si joburi de inceput.

Structura este impartita pe MVVM:

- `models`: formele de date pentru joburi, chat, comunitate si profil
- `repositories`: date demo si autentificare fara backend
- `viewmodels`: stare de ecran si actiuni
- `views`: autentificare, joburi, comunitate, chat si shell-ul principal
- `widgets`: componente UI reutilizabile

## Functionalitati

- Autentificare si creare cont demo
- Feed vertical cu joburi video
- Aplicare cu VideoCV si CV clasic
- Actiuni de distribuire si aplicare
- Informatii peste video: plata, durata, locatie, abilitati, companie si descriere
- Filtre pentru campuri vizibile si joburi remote
- Navigatie jos cu actiune centrala pentru joburi
- Comunitate si chat cu recrutori
- Profil editabil cu abilitati si portofoliu
- Identitate vizuala albastra, inspirata de logo
- Font centralizat in `lib/core/app_brand.dart`

## Rulare

```sh
flutter pub get
flutter run -d chrome
```

Build web:

```sh
flutter build web
```

## Schimbare logo

Inlocuieste `assets/logos/logo.png` sau modifica `BrandAssets.logoAsset` in `lib/core/brand_assets.dart`.

## Schimbare iconite audio

Pune iconitele in `assets/icons/`, apoi seteaza:

```dart
static const String? soundOnIconAsset = "assets/icons/sound_on.png";
static const String? soundOffIconAsset = "assets/icons/sound_off.png";
```

## Schimbare font

Fontul este setat in `lib/core/app_brand.dart`, in metoda `textTheme`.

## Schimbare video

Inlocuieste fisierele din `assets/videos/` sau actualizeaza valorile video din `lib/repositories/mock_content_repository.dart`.
