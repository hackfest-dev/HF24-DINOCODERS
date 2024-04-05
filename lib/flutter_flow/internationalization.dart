import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'kn', 'hi', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? knText = '',
    String? hiText = '',
    String? taText = '',
  }) =>
      [enText, knText, hiText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Create
  {
    'lgnvb24z': {
      'en': 'Genefarm',
      'hi': 'जीनफार्म',
      'kn': 'ಜಿನೆಫಾರ್ಮ್',
      'ta': 'மரபணு பண்ணை',
    },
    '10s04v0h': {
      'en': 'Get Started',
      'hi': 'शुरू हो जाओ',
      'kn': 'ಪ್ರಾರಂಭಿಸಿ',
      'ta': 'தொடங்குங்கள்',
    },
    'o2bujler': {
      'en': 'Create an account by using the form below.',
      'hi': 'नीचे दिए गए फॉर्म का उपयोग करके एक खाता बनाएं।',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಬಳಸಿಕೊಂಡು ಖಾತೆಯನ್ನು ರಚಿಸಿ.',
      'ta': 'கீழே உள்ள படிவத்தைப் பயன்படுத்தி கணக்கை உருவாக்கவும்.',
    },
    'b3bdrmel': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
      'ta': 'மின்னஞ்சல்',
    },
    '841d8t4k': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
      'ta': 'கடவுச்சொல்',
    },
    '7pblgo14': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    '77w9k0h4': {
      'en': 'Or sign up with',
      'hi': 'या इसके साथ साइन अप करें',
      'kn': 'ಅಥವಾ ಸೈನ್ ಅಪ್ ಮಾಡಿ',
      'ta': 'அல்லது உடன் பதிவு செய்யவும்',
    },
    'uuog5l8g': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
      'kn': 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಯಿರಿ',
      'ta': 'Google உடன் தொடரவும்',
    },
    '3t6mfevu': {
      'en': 'Continue with Phone Number',
      'hi': 'फ़ोन नंबर के साथ जारी रखें',
      'kn': 'ಫೋನ್ ಸಂಖ್ಯೆಯೊಂದಿಗೆ ಮುಂದುವರಿಸಿ',
      'ta': 'தொலைபேசி எண்ணுடன் தொடரவும்',
    },
    '1cqkiwom': {
      'en': 'Already have an account? ',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'kn': 'ಈಗಾಗಲೇ ಖಾತೆ ಹೊಂದಿದ್ದೀರ?',
      'ta': 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
    },
    'lttlcu2s': {
      'en': 'Sign in here',
      'hi': 'यहां साइन इन करो',
      'kn': 'ಇಲ್ಲಿ ಸೈನ್ ಇನ್ ಮಾಡಿ',
      'ta': 'இங்கே உள்நுழையவும்',
    },
    'flub04ka': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // Login
  {
    'y6iv2aj7': {
      'en': 'Genefarm',
      'hi': 'जीनफार्म',
      'kn': 'ಜಿನೆಫಾರ್ಮ್',
      'ta': 'மரபணு பண்ணை',
    },
    'hk8hy2fu': {
      'en': 'Welcome Back',
      'hi': 'वापसी पर स्वागत है',
      'kn': 'ಮರಳಿ ಸ್ವಾಗತ',
      'ta': 'மீண்டும் வருக',
    },
    'skmymnzy': {
      'en': 'Fill out the information below in order to access your account.',
      'hi': 'अपने खाते तक पहुंचने के लिए नीचे दी गई जानकारी भरें।',
      'kn': 'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಪ್ರವೇಶಿಸಲು ಕೆಳಗಿನ ಮಾಹಿತಿಯನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
      'ta': 'உங்கள் கணக்கை அணுக, கீழே உள்ள தகவலை நிரப்பவும்.',
    },
    'fbgzqtmp': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
      'ta': 'மின்னஞ்சல்',
    },
    '38yuwbb3': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
      'ta': 'கடவுச்சொல்',
    },
    'lxrxzq5f': {
      'en': 'Sign In',
      'hi': 'दाखिल करना',
      'kn': 'ಸೈನ್ ಇನ್ ಮಾಡಿ',
      'ta': 'உள்நுழையவும்',
    },
    's3zg5sx8': {
      'en': 'Or sign in with',
      'hi': 'या इसके साथ साइन इन करें',
      'kn': 'ಅಥವಾ ಇದರೊಂದಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ',
      'ta': 'அல்லது உடன் உள்நுழையவும்',
    },
    'xhciznzb': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
      'kn': 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಯಿರಿ',
      'ta': 'Google உடன் தொடரவும்',
    },
    '80r7vn9n': {
      'en': 'Don\'t have an account?  ',
      'hi': 'क्या आपके पास खाता नहीं है?',
      'kn': 'ಖಾತೆ ಇಲ್ಲವೇ?',
      'ta': 'கணக்கு இல்லையா?',
    },
    'lgwc9fbd': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    'r7nlytur': {
      'en': 'Forgot password?',
      'hi': 'पासवर्ड भूल गए?',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ?',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
    },
    '1awic8rq': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // ForgotPassword
  {
    'wixpdlfe': {
      'en': 'Genefarm',
      'hi': 'जीनफार्म',
      'kn': 'ಜಿನೆಫಾರ್ಮ್',
      'ta': 'மரபணு பண்ணை',
    },
    'jlf1hgrh': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா',
    },
    'ecgkaip8': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'hi': 'रीसेट पासवर्ड लिंक प्राप्त करने के लिए कृपया नीचे अपना ईमेल भरें।',
      'kn':
          'ಮರುಹೊಂದಿಸುವ ಪಾಸ್‌ವರ್ಡ್ ಲಿಂಕ್ ಅನ್ನು ಸ್ವೀಕರಿಸಲು ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
      'ta':
          'கடவுச்சொல்லை மீட்டமைக்கும் இணைப்பைப் பெற, உங்கள் மின்னஞ்சலை நிரப்பவும்.',
    },
    '7ikmhj9g': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
      'ta': 'மின்னஞ்சல்',
    },
    't77mrb18': {
      'en': 'Send Reset Link',
      'hi': 'रीसेट लिंक भेजें',
      'kn': 'ಮರುಹೊಂದಿಸುವ ಲಿಂಕ್ ಕಳುಹಿಸಿ',
      'ta': 'மீட்டமை இணைப்பை அனுப்பவும்',
    },
    'yel3s75o': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // createProfile
  {
    'm44y5tjp': {
      'en': 'Genefarm',
      'hi': 'जीनफार्म',
      'kn': 'ಜಿನೆಫಾರ್ಮ್',
      'ta': 'மரபணு பண்ணை',
    },
    'dv2ienv6': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // Profile
  {
    '4a0z1gen': {
      'en': 'Your Account',
      'hi': 'आपका खाता',
      'kn': 'ನಿಮ್ಮ ಖಾತೆ',
      'ta': 'உங்கள் கணக்கு',
    },
    'cmxgh6lk': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'kn': 'ಪ್ರೊಫೈಲ್ ಬದಲಿಸು',
      'ta': 'சுயவிவரத்தைத் திருத்து',
    },
    'dk3s7x1j': {
      'en': 'App Settings',
      'hi': 'एप्लिकेशन सेटिंग',
      'kn': 'ಅಪ್ಲಿಕೇಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
      'ta': 'பயன்பாட்டு அமைப்புகள்',
    },
    '0u56qkhg': {
      'en': 'Light Mode',
      'hi': 'लाइट मोड',
      'kn': 'ಲೈಟ್ ಮೋಡ್',
      'ta': 'ஒளி முறை',
    },
    'je2bzwgl': {
      'en': 'Dark Mode',
      'hi': 'डार्क मोड',
      'kn': 'ಡಾರ್ಕ್ ಮೋಡ್',
      'ta': 'இருண்ட பயன்முறை',
    },
    'vehkmp67': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'kn': 'ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ',
      'ta': 'கடவுச்சொல்லை மாற்று',
    },
    'e8h9lqzn': {
      'en': 'Support',
      'hi': 'सहायता',
      'kn': 'ಬೆಂಬಲ',
      'ta': 'ஆதரவு',
    },
    'tkn0xt8n': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
      'ta': 'வெளியேறு',
    },
    '0jyqypxs': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // EditProfile
  {
    '272rv52n': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // ChangePassword
  {
    'h9nj3ugf': {
      'en': 'Genefarm',
      'hi': 'जीनफार्म',
      'kn': 'ಜಿನೆಫಾರ್ಮ್',
      'ta': 'மரபணு பண்ணை',
    },
    'ymtyhcag': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'kn': 'ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ',
      'ta': 'கடவுச்சொல்லை மாற்று',
    },
    'kw6pq2t0': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'hi': 'रीसेट पासवर्ड लिंक प्राप्त करने के लिए कृपया नीचे अपना ईमेल भरें।',
      'kn':
          'ಮರುಹೊಂದಿಸುವ ಪಾಸ್‌ವರ್ಡ್ ಲಿಂಕ್ ಅನ್ನು ಸ್ವೀಕರಿಸಲು ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
      'ta':
          'கடவுச்சொல்லை மீட்டமைக்கும் இணைப்பைப் பெற, உங்கள் மின்னஞ்சலை நிரப்பவும்.',
    },
    'j30ccdjv': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
      'ta': 'மின்னஞ்சல்',
    },
    'vb2wbik1': {
      'en': 'Send Reset Link',
      'hi': 'रीसेट लिंक भेजें',
      'kn': 'ಮರುಹೊಂದಿಸುವ ಲಿಂಕ್ ಕಳುಹಿಸಿ',
      'ta': 'மீட்டமை இணைப்பை அனுப்பவும்',
    },
    'ky8v25jf': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // Home
  {
    'pav4mnid': {
      'en': ' login ',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '7h8f7ugc': {
      'en': 'profile',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '4i6iv9vl': {
      'en': 'Page Title',
      'hi': 'पृष्ठ का शीर्षक',
      'kn': 'ಪುಟದ ಶೀರ್ಷಿಕೆ',
      'ta': 'பக்கத்தின் தலைப்பு',
    },
    'f08xg1sc': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // Phone
  {
    'c1atxvma': {
      'en': 'Genefarm',
      'hi': 'जीनफार्म',
      'kn': 'ಜಿನೆಫಾರ್ಮ್',
      'ta': 'மரபணு பண்ணை',
    },
    'qkqsz96l': {
      'en': 'Phone Sign In',
      'hi': 'फ़ोन साइन इन करें',
      'kn': 'ಫೋನ್ ಸೈನ್ ಇನ್',
      'ta': 'தொலைபேசி உள்நுழைவு',
    },
    'e132xx0x': {
      'en':
          'Please fill out your phone number below in order to recieve a otp.',
      'hi': 'ओटीपी प्राप्त करने के लिए कृपया नीचे अपना फ़ोन नंबर भरें।',
      'kn':
          'ಒಟಿಪಿಯನ್ನು ಸ್ವೀಕರಿಸಲು ದಯವಿಟ್ಟು ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ಕೆಳಗೆ ಭರ್ತಿ ಮಾಡಿ.',
      'ta': 'Otpஐப் பெற கீழே உங்கள் தொலைபேசி எண்ணை நிரப்பவும்.',
    },
    'w0v6w6r0': {
      'en': 'Phone',
      'hi': 'फ़ोन',
      'kn': 'ದೂರವಾಣಿ',
      'ta': 'தொலைபேசி',
    },
    'g7oeuu3g': {
      'en': 'Get OTP',
      'hi': 'ओटीपी प्राप्त करें',
      'kn': 'OTP ಪಡೆಯಿರಿ',
      'ta': 'OTP பெறவும்',
    },
    'i4dn5eol': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // VerifyOTP
  {
    'y47wrwdz': {
      'en': 'Genefarm',
      'hi': 'जीनफार्म',
      'kn': 'ಜಿನೆಫಾರ್ಮ್',
      'ta': 'மரபணு பண்ணை',
    },
    '0bae7uv8': {
      'en': 'verify',
      'hi': 'सत्यापित करें',
      'kn': 'ಪರಿಶೀಲಿಸಿ',
      'ta': 'சரிபார்க்க',
    },
    'qcbkhw4k': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'kn': 'ಸಲ್ಲಿಸು',
      'ta': 'சமர்ப்பிக்கவும்',
    },
    '36erbktp': {
      'en': 'Did not recieved OTP?',
      'hi': 'ओटीपी नहीं मिला?',
      'kn': 'OTP ಸ್ವೀಕರಿಸಲಿಲ್ಲವೇ?',
      'ta': 'OTP வரவில்லையா.?',
    },
    'gmk38rsr': {
      'en': 'Resend',
      'hi': 'पुन: भेजें',
      'kn': 'ಮರುಕಳುಹಿಸಿ',
      'ta': 'மீண்டும் அனுப்பு',
    },
    'f6dmmowg': {
      'en': 'Wrong Number.?',
      'hi': 'गलत संख्या।?',
      'kn': 'ತಪ್ಪು ಸಂಖ್ಯೆ.?',
      'ta': 'தவறான எண்.?',
    },
    'p6kjvelu': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // SplashScreen
  {
    '317slhdo': {
      'en': 'Consumer  ',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'noxsf8cv': {
      'en': '  Producer ',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'di9ecn09': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // homepage
  {
    'co36d2pe': {
      'en': 'Order Now',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'cio6sbvp': {
      'en': 'Our menu is below',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'va4egbh3': {
      'en': 'Title',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'i92e5i7f': {
      'en': 'Subtext',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'iwb7tn80': {
      'en': '\$11.00',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '60ysn6hl': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ta': '',
    },
  },
  // EditProfileC
  {
    'hsqjv1rn': {
      'en': 'Adjust the content below to update your profile.',
      'hi':
          'अपनी प्रोफ़ाइल अपडेट करने के लिए नीचे दी गई सामग्री को समायोजित करें।',
      'kn': 'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಅನ್ನು ನವೀಕರಿಸಲು ಕೆಳಗಿನ ವಿಷಯವನ್ನು ಹೊಂದಿಸಿ.',
      'ta':
          'உங்கள் சுயவிவரத்தைப் புதுப்பிக்க கீழே உள்ள உள்ளடக்கத்தைச் சரிசெய்யவும்.',
    },
    'r9n9cqc2': {
      'en': 'Change Photo',
      'hi': 'छवि बदलो',
      'kn': 'ಫೋಟೋ ಬದಲಾಯಿಸಿ',
      'ta': 'புகைப்படத்தை மாற்று',
    },
    'u3hifguq': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'kn': 'ಪೂರ್ಣ ಹೆಸರು',
      'ta': 'முழு பெயர்',
    },
    'l603iwgx': {
      'en': 'Your full name...',
      'hi': 'आपका पूरा नाम...',
      'kn': 'ನಿಮ್ಮ ಪೂರ್ಣ ಹೆಸರು...',
      'ta': 'உன் முழு பெயர்...',
    },
    'rnle6ud3': {
      'en': 'Consumer',
      'hi': 'किसान',
      'kn': 'ರೈತ',
      'ta': 'உழவர்',
    },
    '2vnxwtj8': {
      'en': 'Producer',
      'hi': 'युवा',
      'kn': 'ಯುವಕ',
      'ta': 'இளைஞர்',
    },
    '6od49j52': {
      'en': 'Your Role',
      'hi': 'आपकी भूमिका',
      'kn': 'ನಿಮ್ಮ ಪಾತ್ರ',
      'ta': 'உங்கள் பங்கு',
    },
    'w2rcenmx': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'nh920rx9': {
      'en': 'Short Description',
      'hi': 'संक्षिप्त वर्णन',
      'kn': 'ಸಣ್ಣ ವಿವರಣೆ',
      'ta': 'குறுகிய விளக்கம்',
    },
    'f9gc9rzm': {
      'en': 'A little about you...',
      'hi': 'आपके बारे में थोड़ा...',
      'kn': 'ನಿಮ್ಮ ಬಗ್ಗೆ ಸ್ವಲ್ಪ...',
      'ta': 'உன்னை பற்றி கொஞ்சம்...',
    },
  },
  // GMOdetails
  {
    'idpxabni': {
      'en': 'GMO',
      'hi': 'जीएमओ',
      'kn': 'GMO',
      'ta': 'GMO',
    },
    'dsft8g4p': {
      'en': 'Hybrid',
      'hi': 'हाइब्रिड',
      'kn': 'ಹೈಬ್ರಿಡ್',
      'ta': 'கலப்பின',
    },
    'xye653jk': {
      'en':
          'Notes & descriptions go here they will maybe help explain when it needs done.',
      'hi':
          'नोट्स और विवरण यहां दिए गए हैं, शायद जरूरत पड़ने पर वे समझाने में मदद करेंगे।',
      'kn':
          'ಟಿಪ್ಪಣಿಗಳು ಮತ್ತು ವಿವರಣೆಗಳು ಇಲ್ಲಿಗೆ ಹೋಗುತ್ತವೆ, ಅದು ಯಾವಾಗ ಮಾಡಬೇಕೆಂದು ವಿವರಿಸಲು ಅವರು ಸಹಾಯ ಮಾಡಬಹುದು.',
      'ta':
          'குறிப்புகள் மற்றும் விளக்கங்கள் இங்கே செல்கின்றன, அவை எப்போது செய்ய வேண்டும் என்பதை விளக்க உதவும்.',
    },
    '6yi2s0po': {
      'en': 'Buy',
      'hi': 'खरीदना',
      'kn': 'ಖರೀದಿಸಿ',
      'ta': 'வாங்க',
    },
  },
  // Miscellaneous
  {
    'fs4ad0xh': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'uqjx5458': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'vn0gvp2t': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'y8683kav': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'jfibu72q': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '3f3j7c90': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'cop86ynd': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '0q9xyp9y': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '6zwe8tmg': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'wcad2yxa': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '0mr57j0i': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'cgehmobv': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'buzo59yx': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'kjd0as4t': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'dokvk4gv': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'j9i9w808': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'ow0ktcmw': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'iow0exlq': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'rs04emob': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'cq0mqlhp': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'wapprsgc': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'ud601ojl': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'hj51xroq': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '5jkptj47': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'qx3sh6zz': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    '9a1mrxjn': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
    'jijkukie': {
      'en': '',
      'hi': '',
      'kn': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
