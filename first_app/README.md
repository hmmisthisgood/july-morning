

### creating release keys
    mkdir keys
 
  keytool -genkey  \
  -v -keystore ./keys/release-keystore.jks \
   -keyalg RSA \
   -keysize 2048 \
   -validity 10000 \
   -alias upload


## getting the key hash 
keytool -list \
-v -keystore ./keys/release-keystore.jks \
-alias upload \
-storepass password \
-keypass password