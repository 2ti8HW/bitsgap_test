# Bitsgap test

Simple task a simple solution :)

Didn't use riverpod or get don't like tying to big libraries. As major library updates or flutter is a pain:)
I prefer to use simple libraries which you can easily replace or write your own implementation.

## Codename for MobX, JsonSerialization

```
flutter pub get
flutter pub run intl_utils:generate
flutter pub run build_runner build --delete-conflicting-outputs
```

## Working with resources
`dart pub global activate flutter_gen`

`flutter pub run build_runner build`
or 
`fluttergen`
