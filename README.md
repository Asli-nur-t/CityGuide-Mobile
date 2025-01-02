


# CityGuide 🗺️
video link: https://drive.google.com/file/d/1Bsb4EXE02fQwvzhzsCYjKsNrcUKglN-G/view?usp=sharing

CityGuide, kullanıcıların çevresindeki turistik yerleri kolayca keşfetmelerine yardımcı olmak için tasarlanmış bir akıllı şehir rehberi mobil uygulamasıdır. Uygulama, konum tabanlı öneriler, çevrimdışı veri desteği ve Firebase kimlik doğrulama gibi özellikleri bir araya getirerek sezgisel ve güvenilir bir kullanıcı deneyimi sunar.

---

## Proje Özeti 📝
CityGuide, kullanıcıların bulunduğu yere yakın turistik yerleri keşfetmelerini, interaktif bir harita üzerinde görüntülemelerini ve verileri çevrimdışı erişim için kaydetmelerini sağlar. Uygulama, Firebase kimlik doğrulama, arka plan konum güncellemeleri ve Google Maps API entegrasyonu ile sorunsuz bir kullanım sunar.

---

## Özellikler ✨
- **Şehri Keşfet:** Konumunuza göre en yakın yeme, gezme, konaklama yeri görüntüleyin.
- **İnteraktif Harita:** Google Maps entegrasyonu ile turistik yerleri gezin yol tarifi alın.
- **Çevrimdışı Destek:** Hive kullanarak verileri çevrimdışı erişim için yerel olarak kaydedin.
- **Firebase Kimlik Doğrulama:** Güvenli oturum açma ve oturum yönetimi.
- **Anlık Bildirimler:** Yeni yerler hakkında güncellemeler alın.
- **Arka Plan Güncellemeleri:** Yakınınızdaki yerleri otomatik olarak arka planda alın.
- **Kullanıcı Tercihleri:** Tercihlerinizi ve son ziyaret edilen yerleri yerel olarak kaydedin.

---

## Demo 🎥
![CityGuide Demo](assets/screenshots/demo1.gif)


---

## Teknoloji Yığını 🛠️
- **Frontend:** Flutter (Dart)
- **Veritabanı:** Hive (yerel çevrimdışı depolama)
- **Kimlik Doğrulama:** Firebase Authentication
- **Haritalar:** Google Maps API
- **Ağ:** REST API, Dio ile
- **Yerel Depolama:** SharedPreferences ile tercihlerin ve ayarların kaydedilmesi
- **Arka Plan İşleme:** Geolocator ile gerçek zamanlı konum takibi

---

## Bağımlılıklar 📦
Proje, çeşitli işlevler için aşağıdaki paketleri kullanır:


| Bağımlılık                | Versiyon   | Amacı                                                    |
|---------------------------|-----------|------------------------------------------------------------|
| flutter                   | ^3.6.0    | Flutter SDK                                                |
| build_runner              | ^2.4.14   | Code generation                                            |
| flutter_translate         | ^4.1.0    | App localization                                           |
| firebase_auth             | ^5.3.4    | User authentication                                        |
| firebase_core             | ^3.9.0    | Firebase core integration                                  |
| google_maps_flutter       | ^2.10.0   | Google Maps integration                                    |
| geolocator                | ^13.0.2   | GPS location services                                      |
| dio                       | ^5.7.0    | HTTP client for API calls                                  |
| shared_preferences        | ^2.3.4    | Persistent key-value storage                               |
| location                  | ^6.0.2    | Access to device location                                  |
| chucker_flutter           | ^1.8.3    | API debugging and logging                                  |
| hive                      | ^2.2.3    | Lightweight local database                                 |
| hive_flutter              | ^1.1.0    | Hive integration with Flutter                              |
| hive_generator            | ^2.0.1    | Code generation for Hive models                           |
| connectivity_plus         | ^6.1.1    | Network connectivity status                               |
| flutter_dotenv            | ^5.2.1    | Load environment variables from `.env` files              |

---

## Kurulum 🚀
Projeyi yerel olarak kurmak için aşağıdaki adımları izleyin:

1. **Depoyu klonlayın:**
   ```bash
   git clone https://github.com/Asli-nur-t/CityGuide-Mobile.git
   cd CityGuide-Mobile
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter run

## Notlar 🗒️
Google Maps API için geçerli bir API anahtarınız olduğundan emin olun. Bu anahtarı AndroidManifest.xml ve Info.plist dosyalarınıza ekleyin.
Firebase yapılandırma dosyalarını (google-services.json Android için ve GoogleService-Info.plist iOS için) uygun dizinlere yerleştirin.



<!-- Eng -->
# CityGuide 🗺️

CityGuide is a smart city guide mobile application designed to help users explore nearby tourist attractions effortlessly. The app integrates location-based recommendations, offline data support, and Firebase authentication to deliver an intuitive and reliable user experience.

---

## Project Overview 📝
CityGuide helps users discover tourist attractions near their location, view them on an interactive map, and save data for offline access. The app ensures seamless usability with features like Firebase authentication, background location updates, and integration with Google Maps API.

---

## Features ✨
- **Discover Attractions:** View the closest places to eat, visit, and stay based on your location.
- **Interactive Map:** Navigate attractions with Google Maps integration.
- **Offline Support:** Save data locally using Hive for offline access.
- **Firebase Authentication:** Secure login and session management.
- **Push Notifications:** Receive updates about new places.
- **Background Updates:** Automatically fetch nearby places in the background.
- **User Preferences:** Save preferences and recently visited places locally.

---

## Tech Stack 🛠️
- **Frontend:** Flutter (Dart)
- **Database:** Hive (local offline storage)
- **Authentication:** Firebase Authentication
- **Maps:** Google Maps API
- **Networking:** REST API with Dio
- **Local Storage:** SharedPreferences for preferences and settings
- **Background Processing:** Geolocator for real-time location tracking

---

## Dependencies 📦
The project uses the following packages for various functionalities:

| Dependency                | Version   | Purpose                                                    |
|---------------------------|-----------|------------------------------------------------------------|
| flutter                   | ^3.6.0    | Flutter SDK                                                |
| build_runner              | ^2.4.14   | Code generation                                            |
| flutter_translate         | ^4.1.0    | App localization                                           |
| firebase_auth             | ^5.3.4    | User authentication                                        |
| firebase_core             | ^3.9.0    | Firebase core integration                                  |
| google_maps_flutter       | ^2.10.0   | Google Maps integration                                    |
| geolocator                | ^13.0.2   | GPS location services                                      |
| dio                       | ^5.7.0    | HTTP client for API calls                                  |
| shared_preferences        | ^2.3.4    | Persistent key-value storage                               |
| location                  | ^6.0.2    | Access to device location                                  |
| chucker_flutter           | ^1.8.3    | API debugging and logging                                  |
| hive                      | ^2.2.3    | Lightweight local database                                 |
| hive_flutter              | ^1.1.0    | Hive integration with Flutter                              |
| hive_generator            | ^2.0.1    | Code generation for Hive models                           |
| connectivity_plus         | ^6.1.1    | Network connectivity status                               |
| flutter_dotenv            | ^5.2.1    | Load environment variables from `.env` files              |

---

## Installation 🚀
To set up the project locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Asli-nur-t/CityGuide-Mobile.git
   cd CityGuide-Mobile
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter run

