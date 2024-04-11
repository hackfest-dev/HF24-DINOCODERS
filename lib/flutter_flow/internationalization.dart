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
      'hi': 'या साइन अप करें',
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
      'hi': 'या साइन इन करें',
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
    'jlf1hgrh': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா',
    },
    'ecgkaip8': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'hi': 'कृपया पासवर्ड रीसेट लिंक प्राप्त करने के लिए नीचे अपना ईमेल भरें।',
      'kn':
          'ಮರುಹೊಂದಿಸುವ ಪಾಸ್‌ವರ್ಡ್ ಲಿಂಕ್ ಅನ್ನು ಸ್ವೀಕರಿಸಲು ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ಕೆಳಗೆ ಭರ್ತಿ ಮಾಡಿ.',
      'ta':
          'கடவுச்சொல்லை மீட்டமைக்கும் இணைப்பைப் பெற, கீழே உங்கள் மின்னஞ்சலை நிரப்பவும்.',
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
    'o4rtofot': {
      'en': 'Queries..?',
      'hi': 'प्रश्न..?',
      'kn': 'ಪ್ರಶ್ನೆಗಳು..?',
      'ta': 'கேள்விகள்..?',
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
    'ymtyhcag': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'kn': 'ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ',
      'ta': 'கடவுச்சொல்லை மாற்று',
    },
    'kw6pq2t0': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'hi': 'कृपया पासवर्ड रीसेट लिंक प्राप्त करने के लिए नीचे अपना ईमेल भरें।',
      'kn':
          'ಮರುಹೊಂದಿಸುವ ಪಾಸ್‌ವರ್ಡ್ ಲಿಂಕ್ ಅನ್ನು ಸ್ವೀಕರಿಸಲು ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ಕೆಳಗೆ ಭರ್ತಿ ಮಾಡಿ.',
      'ta':
          'கடவுச்சொல்லை மீட்டமைக்கும் இணைப்பைப் பெற, கீழே உங்கள் மின்னஞ்சலை நிரப்பவும்.',
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
  // Phone
  {
    'qkqsz96l': {
      'en': 'Phone Sign In',
      'hi': 'फ़ोन साइन इन',
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
      'hi': 'क्या आपको OTP प्राप्त नहीं हुआ?',
      'kn': 'OTP ಸ್ವೀಕರಿಸಲಿಲ್ಲವೇ?',
      'ta': 'OTP பெறவில்லையா?',
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
      'hi': 'उपभोक्ता',
      'kn': 'ಗ್ರಾಹಕ',
      'ta': 'நுகர்வோர்',
    },
    'noxsf8cv': {
      'en': '  Producer ',
      'hi': 'निर्माता',
      'kn': 'ನಿರ್ಮಾಪಕ',
      'ta': 'தயாரிப்பாளர்',
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
    'pvh3ks24': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
    '60ysn6hl': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // lists
  {
    'ctk5w74r': {
      'en': 'List',
      'hi': 'सूची',
      'kn': 'ಪಟ್ಟಿ',
      'ta': 'பட்டியல்',
    },
    'eth1rwcg': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // listdetails
  {
    'hqda69ye': {
      'en': 'add to cart ',
      'hi': 'कार्ट में जोड़ें',
      'kn': 'ಕಾರ್ಟ್ಗೆ ಸೇರಿಸಿ',
      'ta': 'பெட்டகத்தில் சேர்',
    },
  },
  // cart
  {
    'tsdm07vl': {
      'en': 'checkout ',
      'hi': 'चेक आउट',
      'kn': 'ಚೆಕ್ಔಟ್',
      'ta': 'சரிபார்',
    },
    '46g1va6a': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // PaymentGATE
  {
    'ubmkbmtr': {
      'en': 'Proceed to Pay',
      'hi': 'चुकाने के लिए कार्रवाई शुरू करो',
      'kn': 'ಪಾವತಿಸಲು ಮುಂದುವರಿಯಿರಿ',
      'ta': 'பணம் செலுத்த தொடரவும்',
    },
    '6ghnovjf': {
      'en': 'Click Here to  Pay',
      'hi': 'भुगतान हेतु यहां क्लिक करें',
      'kn': 'ಪಾವತಿಸಲು ಇಲ್ಲಿ ಕ್ಲಿಕ್ ಮಾಡಿ',
      'ta': 'பணம் செலுத்த இங்கே கிளிக் செய்யவும்',
    },
    'i0bhvx7u': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // transactionSuccessfull
  {
    'ol3vjryb': {
      'en': 'Thank You.!',
      'hi': 'धन्यवाद।!',
      'kn': 'ಧನ್ಯವಾದ.!',
      'ta': 'நன்றி.!',
    },
    'zuaoe16x': {
      'en': 'Your transaction is successfull',
      'hi': 'आपका लेन-देन सफल हुआ',
      'kn': 'ನಿಮ್ಮ ವಹಿವಾಟು ಯಶಸ್ವಿಯಾಗಿದೆ',
      'ta': 'உங்கள் பரிவர்த்தனை வெற்றிகரமாக உள்ளது',
    },
    'vax68hm7': {
      'en': 'Back to home',
      'hi': 'घर वापिस जा रहा हूँ',
      'kn': 'ಮರಳಿ ಮನೆಗೆ',
      'ta': 'வீட்டுக்குத் திரும்பு',
    },
    'le741h3e': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // transactionFailed
  {
    's1p637m8': {
      'en': 'Ooops.!',
      'hi': 'उफ़!',
      'kn': 'ಓಹ್.!',
      'ta': 'அச்சச்சோ.!',
    },
    '6sxu5i06': {
      'en': 'Your transaction is failed',
      'hi': 'आपका लेनदेन विफल हो गया है',
      'kn': 'ನಿಮ್ಮ ವಹಿವಾಟು ವಿಫಲವಾಗಿದೆ',
      'ta': 'உங்கள் பரிவர்த்தனை தோல்வியடைந்தது',
    },
    '3udxua98': {
      'en': 'Back to home',
      'hi': 'घर वापिस जा रहा हूँ',
      'kn': 'ಮರಳಿ ಮನೆಗೆ',
      'ta': 'வீட்டுக்குத் திரும்பு',
    },
    '2y36d0os': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // chatbot
  {
    '6gbjqhpn': {
      'en': 'Ask anything...',
      'hi': 'कुछ भी पूछें...',
      'kn': 'ಏನು ಬೇಕಾದರೂ ಕೇಳಿ...',
      'ta': 'எதையும் கேள்...',
    },
    'wriar5st': {
      'en': 'Ask',
      'hi': 'पूछना',
      'kn': 'ಕೇಳು',
      'ta': 'கேள்',
    },
    'ubkstpak': {
      'en': 'Ask Genee',
      'hi': 'जिनी से पूछें',
      'kn': 'ಜೀನಿಯನ್ನು ಕೇಳಿ',
      'ta': 'ஜெனியிடம் கேளுங்கள்',
    },
    'nojolmsi': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // listP
  {
    'gea4vrhu': {
      'en': 'List',
      'hi': 'सूची',
      'kn': 'ಪಟ್ಟಿ',
      'ta': 'பட்டியல்',
    },
    'bjtuz64q': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // homepageP
  {
    '02ts0zze': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
    'pfhiy7n7': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // AddVarity
  {
    'i2fucr74': {
      'en': 'Add Varity',
      'hi': 'संपादन करना',
      'kn': 'ತಿದ್ದು',
      'ta': 'தொகு',
    },
    'vyk9of1e': {
      'en': 'Upload',
      'hi': 'डालना',
      'kn': 'ಅಪ್ಲೋಡ್ ಮಾಡಿ',
      'ta': 'பதிவேற்றவும்',
    },
    'mch5f2ns': {
      'en': 'Name',
      'hi': 'नाम',
      'kn': 'ಹೆಸರು',
      'ta': 'பெயர்',
    },
    'qmiocjy6': {
      'en': 'Enter the short description here.',
      'hi': 'संक्षिप्त विवरण यहां दर्ज करें.',
      'kn': 'ಚಿಕ್ಕ ವಿವರಣೆಯನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ.',
      'ta': 'சுருக்கமான விளக்கத்தை இங்கே உள்ளிடவும்.',
    },
    'g5ybynso': {
      'en': 'Add',
      'hi': 'जोड़ना',
      'kn': 'ಸೇರಿಸಿ',
      'ta': 'கூட்டு',
    },
    'zmiidcvr': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // CreateP
  {
    'vn214pmg': {
      'en': 'Get Started',
      'hi': 'शुरू हो जाओ',
      'kn': 'ಪ್ರಾರಂಭಿಸಿ',
      'ta': 'தொடங்குங்கள்',
    },
    '8aqim8ke': {
      'en': 'Create an account by using the form below.',
      'hi': 'नीचे दिए गए फॉर्म का उपयोग करके एक खाता बनाएं।',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಬಳಸಿಕೊಂಡು ಖಾತೆಯನ್ನು ರಚಿಸಿ.',
      'ta': 'கீழே உள்ள படிவத்தைப் பயன்படுத்தி கணக்கை உருவாக்கவும்.',
    },
    'jz8jl8mi': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
      'ta': 'மின்னஞ்சல்',
    },
    '0f71te4g': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
      'ta': 'கடவுச்சொல்',
    },
    'j1jfn5zd': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    'i3r82ylh': {
      'en': 'Or sign up with',
      'hi': 'या साइन अप करें',
      'kn': 'ಅಥವಾ ಸೈನ್ ಅಪ್ ಮಾಡಿ',
      'ta': 'அல்லது உடன் பதிவு செய்யவும்',
    },
    'am0lk3ah': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
      'kn': 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಯಿರಿ',
      'ta': 'Google உடன் தொடரவும்',
    },
    'h6mc6emk': {
      'en': 'Continue with Phone Number',
      'hi': 'फ़ोन नंबर के साथ जारी रखें',
      'kn': 'ಫೋನ್ ಸಂಖ್ಯೆಯೊಂದಿಗೆ ಮುಂದುವರಿಸಿ',
      'ta': 'தொலைபேசி எண்ணுடன் தொடரவும்',
    },
    '9ci5hj99': {
      'en': 'Already have an account? ',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'kn': 'ಈಗಾಗಲೇ ಖಾತೆ ಹೊಂದಿದ್ದೀರ?',
      'ta': 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
    },
    'eo9golz9': {
      'en': 'Sign in here',
      'hi': 'यहां साइन इन करो',
      'kn': 'ಇಲ್ಲಿ ಸೈನ್ ಇನ್ ಮಾಡಿ',
      'ta': 'இங்கே உள்நுழையவும்',
    },
    'n84ndo2a': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // LoginP
  {
    'ueb4vigs': {
      'en': 'Welcome Back',
      'hi': 'वापसी पर स्वागत है',
      'kn': 'ಮರಳಿ ಸ್ವಾಗತ',
      'ta': 'மீண்டும் வருக',
    },
    'i3vkurfp': {
      'en': 'Fill out the information below in order to access your account.',
      'hi': 'अपने खाते तक पहुंचने के लिए नीचे दी गई जानकारी भरें।',
      'kn': 'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಪ್ರವೇಶಿಸಲು ಕೆಳಗಿನ ಮಾಹಿತಿಯನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
      'ta': 'உங்கள் கணக்கை அணுக, கீழே உள்ள தகவலை நிரப்பவும்.',
    },
    'k7ljwjdl': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
      'ta': 'மின்னஞ்சல்',
    },
    '5auxbxzy': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
      'ta': 'கடவுச்சொல்',
    },
    'oeodk7dg': {
      'en': 'Sign In',
      'hi': 'दाखिल करना',
      'kn': 'ಸೈನ್ ಇನ್ ಮಾಡಿ',
      'ta': 'உள்நுழையவும்',
    },
    'vpn6f7kn': {
      'en': 'Or sign in with',
      'hi': 'या साइन इन करें',
      'kn': 'ಅಥವಾ ಇದರೊಂದಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ',
      'ta': 'அல்லது உடன் உள்நுழையவும்',
    },
    '0gp8j3ra': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
      'kn': 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಯಿರಿ',
      'ta': 'Google உடன் தொடரவும்',
    },
    '5vff1k64': {
      'en': 'Don\'t have an account?  ',
      'hi': 'क्या आपके पास खाता नहीं है?',
      'kn': 'ಖಾತೆ ಇಲ್ಲವೇ?',
      'ta': 'கணக்கு இல்லையா?',
    },
    'hvqhllug': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    'xp818u2v': {
      'en': 'Forgot password?',
      'hi': 'पासवर्ड भूल गए?',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ?',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
    },
    'qn4tsq2b': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // createProfileP
  {
    'v6naqhus': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // PhoneP
  {
    'h0m3dpbn': {
      'en': 'Phone Sign In',
      'hi': 'फ़ोन साइन इन',
      'kn': 'ಫೋನ್ ಸೈನ್ ಇನ್',
      'ta': 'தொலைபேசி உள்நுழைவு',
    },
    'y5me99bg': {
      'en':
          'Please fill out your phone number below in order to recieve a otp.',
      'hi': 'ओटीपी प्राप्त करने के लिए कृपया नीचे अपना फ़ोन नंबर भरें।',
      'kn':
          'ಒಟಿಪಿಯನ್ನು ಸ್ವೀಕರಿಸಲು ದಯವಿಟ್ಟು ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ಕೆಳಗೆ ಭರ್ತಿ ಮಾಡಿ.',
      'ta': 'Otpஐப் பெற கீழே உங்கள் தொலைபேசி எண்ணை நிரப்பவும்.',
    },
    'u2mtn56r': {
      'en': 'Phone',
      'hi': 'फ़ोन',
      'kn': 'ದೂರವಾಣಿ',
      'ta': 'தொலைபேசி',
    },
    'tllcr43o': {
      'en': 'Get OTP',
      'hi': 'ओटीपी प्राप्त करें',
      'kn': 'OTP ಪಡೆಯಿರಿ',
      'ta': 'OTP பெறவும்',
    },
    '6mzko9dr': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // VerifyOTPP
  {
    '77d89ze2': {
      'en': 'verify',
      'hi': 'सत्यापित करें',
      'kn': 'ಪರಿಶೀಲಿಸಿ',
      'ta': 'சரிபார்க்க',
    },
    'v53ogh80': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'kn': 'ಸಲ್ಲಿಸು',
      'ta': 'சமர்ப்பிக்கவும்',
    },
    'v7kx5u3v': {
      'en': 'Did not recieved OTP?',
      'hi': 'क्या आपको OTP प्राप्त नहीं हुआ?',
      'kn': 'OTP ಸ್ವೀಕರಿಸಲಿಲ್ಲವೇ?',
      'ta': 'OTP பெறவில்லையா?',
    },
    'oxlf4t5g': {
      'en': 'Resend',
      'hi': 'पुन: भेजें',
      'kn': 'ಮರುಕಳುಹಿಸಿ',
      'ta': 'மீண்டும் அனுப்பு',
    },
    'pjkxzx6i': {
      'en': 'Wrong Number.?',
      'hi': 'गलत संख्या।?',
      'kn': 'ತಪ್ಪು ಸಂಖ್ಯೆ.?',
      'ta': 'தவறான எண்.?',
    },
    '541d0g0x': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // ProfileP
  {
    'bao4fy4k': {
      'en': 'Your Account',
      'hi': 'आपका खाता',
      'kn': 'ನಿಮ್ಮ ಖಾತೆ',
      'ta': 'உங்கள் கணக்கு',
    },
    '2q2hh4vh': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'kn': 'ಪ್ರೊಫೈಲ್ ಬದಲಿಸು',
      'ta': 'சுயவிவரத்தைத் திருத்து',
    },
    '90n30ptp': {
      'en': 'App Settings',
      'hi': 'एप्लिकेशन सेटिंग',
      'kn': 'ಅಪ್ಲಿಕೇಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
      'ta': 'பயன்பாட்டு அமைப்புகள்',
    },
    '7ylz949q': {
      'en': 'Light Mode',
      'hi': 'लाइट मोड',
      'kn': 'ಲೈಟ್ ಮೋಡ್',
      'ta': 'ஒளி முறை',
    },
    'ky37piyx': {
      'en': 'Dark Mode',
      'hi': 'डार्क मोड',
      'kn': 'ಡಾರ್ಕ್ ಮೋಡ್',
      'ta': 'இருண்ட பயன்முறை',
    },
    'jn67122k': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'kn': 'ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ',
      'ta': 'கடவுச்சொல்லை மாற்று',
    },
    'bkq3kseu': {
      'en': 'Support',
      'hi': 'सहायता',
      'kn': 'ಬೆಂಬಲ',
      'ta': 'ஆதரவு',
    },
    'tqf8iy7t': {
      'en': 'Queries..?',
      'hi': 'प्रश्न..?',
      'kn': 'ಪ್ರಶ್ನೆಗಳು..?',
      'ta': 'கேள்விகள்..?',
    },
    'm04br0dh': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
      'ta': 'வெளியேறு',
    },
    'h5hww8po': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // addListElement
  {
    '34picz5u': {
      'en': 'Add List Element',
      'hi': 'सूची तत्व जोड़ें',
      'kn': 'ಪಟ್ಟಿ ಅಂಶವನ್ನು ಸೇರಿಸಿ',
      'ta': 'பட்டியல் உறுப்பு சேர்க்கவும்',
    },
    'szh3frxf': {
      'en': 'Upload',
      'hi': 'डालना',
      'kn': 'ಅಪ್ಲೋಡ್ ಮಾಡಿ',
      'ta': 'பதிவேற்றவும்',
    },
    'hsf3f0n5': {
      'en': 'Name',
      'hi': 'नाम',
      'kn': 'ಹೆಸರು',
      'ta': 'பெயர்',
    },
    'sqc7hnh0': {
      'en': 'Price',
      'hi': 'कीमत',
      'kn': 'ಬೆಲೆ',
      'ta': 'விலை',
    },
    '45up6wgs': {
      'en': 'Enter the description here.',
      'hi': 'विवरण यहां दर्ज करें.',
      'kn': 'ವಿವರಣೆಯನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ.',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்.',
    },
    'yjxff5wk': {
      'en': 'Add',
      'hi': 'जोड़ना',
      'kn': 'ಸೇರಿಸಿ',
      'ta': 'கூட்டு',
    },
    'cp5ao9md': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ta': 'வீடு',
    },
  },
  // EditProfileC
  {
    'hsqjv1rn': {
      'en': 'Adjust the content below to update your profile.',
      'hi':
          'अपनी प्रोफ़ाइल अपडेट करने के लिए नीचे दी गई सामग्री समायोजित करें.',
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
      'hi': 'उपभोक्ता',
      'kn': 'ಗ್ರಾಹಕ',
      'ta': 'நுகர்வோர்',
    },
    '2vnxwtj8': {
      'en': 'Producer',
      'hi': 'निर्माता',
      'kn': 'ನಿರ್ಮಾಪಕ',
      'ta': 'தயாரிப்பாளர்',
    },
    '6od49j52': {
      'en': 'Your Role',
      'hi': 'आपकी भूमिका',
      'kn': 'ನಿಮ್ಮ ಪಾತ್ರ',
      'ta': 'உங்கள் பங்கு',
    },
    'w2rcenmx': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
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
      'hi': 'आपके बारे में कुछ...',
      'kn': 'ನಿಮ್ಮ ಬಗ್ಗೆ ಸ್ವಲ್ಪ...',
      'ta': 'உன்னை பற்றி கொஞ்சம்...',
    },
  },
  // EmptyList
  {
    'tqbiauw6': {
      'en': 'you don\'t have any list',
      'hi': 'आपके पास कोई सूची नहीं है',
      'kn': 'ನೀವು ಯಾವುದೇ ಪಟ್ಟಿಯನ್ನು ಹೊಂದಿಲ್ಲ',
      'ta': 'உங்களிடம் பட்டியல் எதுவும் இல்லை',
    },
    'pq6d3zpd': {
      'en': 'Click below button add new GM Crops',
      'hi': 'नई जीएम फसलें जोड़ने के लिए नीचे दिए गए बटन पर क्लिक करें',
      'kn': 'ಹೊಸ GM ಬೆಳೆಗಳನ್ನು ಸೇರಿಸಿ ಕೆಳಗಿನ ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ',
      'ta': 'புதிய GM பயிர்களைச் சேர் பொத்தானைக் கிளிக் செய்யவும்',
    },
    'fopabucu': {
      'en': 'Add New List',
      'hi': 'नई सूची जोड़ें',
      'kn': 'ಹೊಸ ಪಟ್ಟಿಯನ್ನು ಸೇರಿಸಿ',
      'ta': 'புதிய பட்டியலைச் சேர்க்கவும்',
    },
  },
  // EditProfileP
  {
    'eigygzk9': {
      'en': 'Adjust the content below to update your profile.',
      'hi':
          'अपनी प्रोफ़ाइल अपडेट करने के लिए नीचे दी गई सामग्री समायोजित करें.',
      'kn': 'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಅನ್ನು ನವೀಕರಿಸಲು ಕೆಳಗಿನ ವಿಷಯವನ್ನು ಹೊಂದಿಸಿ.',
      'ta':
          'உங்கள் சுயவிவரத்தைப் புதுப்பிக்க கீழே உள்ள உள்ளடக்கத்தைச் சரிசெய்யவும்.',
    },
    'mnb629xd': {
      'en': 'Change Photo',
      'hi': 'छवि बदलो',
      'kn': 'ಫೋಟೋ ಬದಲಾಯಿಸಿ',
      'ta': 'புகைப்படத்தை மாற்று',
    },
    'e4tva2dr': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'kn': 'ಪೂರ್ಣ ಹೆಸರು',
      'ta': 'முழு பெயர்',
    },
    'np5rcbrz': {
      'en': 'Your full name...',
      'hi': 'आपका पूरा नाम...',
      'kn': 'ನಿಮ್ಮ ಪೂರ್ಣ ಹೆಸರು...',
      'ta': 'உன் முழு பெயர்...',
    },
    '62ehou7i': {
      'en': 'Consumer',
      'hi': 'उपभोक्ता',
      'kn': 'ಗ್ರಾಹಕ',
      'ta': 'நுகர்வோர்',
    },
    'ccujje1w': {
      'en': 'Producer',
      'hi': 'निर्माता',
      'kn': 'ನಿರ್ಮಾಪಕ',
      'ta': 'தயாரிப்பாளர்',
    },
    'o0ttr1cr': {
      'en': 'Your Role',
      'hi': 'आपकी भूमिका',
      'kn': 'ನಿಮ್ಮ ಪಾತ್ರ',
      'ta': 'உங்கள் பங்கு',
    },
    'gd11jwx3': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'qlf8g8hg': {
      'en': 'Short Description',
      'hi': 'संक्षिप्त वर्णन',
      'kn': 'ಸಣ್ಣ ವಿವರಣೆ',
      'ta': 'குறுகிய விளக்கம்',
    },
    'v031qkl8': {
      'en': 'A little about you...',
      'hi': 'आपके बारे में कुछ...',
      'kn': 'ನಿಮ್ಮ ಬಗ್ಗೆ ಸ್ವಲ್ಪ...',
      'ta': 'உன்னை பற்றி கொஞ்சம்...',
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
