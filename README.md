#### Flutter basic commands

- Check if flutter is installed properly

```
flutter doctor

```

### New project with flutter

```
flutter create project_name
```

> valid project only contains lowercase letters and undersocre.

## List SHA from debug keystore

### mac or linux

```
keytool -list \
-v -keystore \
~/.android/debug.keystore -\
alias androiddebugkey \
-storepass android \
-keypass android
```

### windows

```bash
keytool -list \
-v -keystore \
C:/Users/dell/.android/debug.keystore \
-alias androiddebugkey \
-storepass android \
-keypass android

```
