
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 14 (7.0 per locale)
 *
 * Built on 2022-04-12 at 07:31 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	it, // 'it'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsIt _translationsIt = _StringsIt.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.it: return _translationsIt;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.it: return _StringsIt.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.it: return 'it';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.it: return const Locale.fromSubtags(languageCode: 'it');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'it': return AppLocale.it;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	late final _StringsEn _root = this;

	// Translations
	String get diagrams => 'Diagrams';
	late final _StringsSideMenuEn sideMenu = _StringsSideMenuEn._(_root);
	late final _StringsGenericEn generic = _StringsGenericEn._(_root);
	late final _StringsPopupEn popup = _StringsPopupEn._(_root);
}

// Path: sideMenu
class _StringsSideMenuEn {
	_StringsSideMenuEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get elements => 'elements';
	String get basic => 'Basic ${_root.sideMenu.elements}';
}

// Path: generic
class _StringsGenericEn {
	_StringsGenericEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get yes => 'Yes';
	String get no => 'No';
}

// Path: popup
class _StringsPopupEn {
	_StringsPopupEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	late final _StringsPopupSaveBeforeOpenNewEn saveBeforeOpenNew = _StringsPopupSaveBeforeOpenNewEn._(_root);
}

// Path: popup.saveBeforeOpenNew
class _StringsPopupSaveBeforeOpenNewEn {
	_StringsPopupSaveBeforeOpenNewEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get title => 'Attention';
	String get content => 'You have an open document that\'s not being saved.\nWould you like to save this document before opening a new one?';
}

// Path: <root>
class _StringsIt implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsIt.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsIt _root = this;

	// Translations
	@override String get diagrams => 'Diagrams';
	@override late final _StringsSideMenuIt sideMenu = _StringsSideMenuIt._(_root);
	@override late final _StringsGenericIt generic = _StringsGenericIt._(_root);
	@override late final _StringsPopupIt popup = _StringsPopupIt._(_root);
}

// Path: sideMenu
class _StringsSideMenuIt implements _StringsSideMenuEn {
	_StringsSideMenuIt._(this._root);

	// ignore: unused_field
	@override final _StringsIt _root;

	// Translations
	@override String get elements => 'Elementi';
	@override String get basic => '${_root.sideMenu.elements} base';
}

// Path: generic
class _StringsGenericIt implements _StringsGenericEn {
	_StringsGenericIt._(this._root);

	// ignore: unused_field
	@override final _StringsIt _root;

	// Translations
	@override String get yes => 'Si';
	@override String get no => 'No';
}

// Path: popup
class _StringsPopupIt implements _StringsPopupEn {
	_StringsPopupIt._(this._root);

	// ignore: unused_field
	@override final _StringsIt _root;

	// Translations
	@override late final _StringsPopupSaveBeforeOpenNewIt saveBeforeOpenNew = _StringsPopupSaveBeforeOpenNewIt._(_root);
}

// Path: popup.saveBeforeOpenNew
class _StringsPopupSaveBeforeOpenNewIt implements _StringsPopupSaveBeforeOpenNewEn {
	_StringsPopupSaveBeforeOpenNewIt._(this._root);

	// ignore: unused_field
	@override final _StringsIt _root;

	// Translations
	@override String get title => 'Attenzione';
	@override String get content => 'Hai un documento aperto che non è stato salvato.\nVuoi salvare questo documento prima di aprirne uno nuovo?';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'diagrams': 'Diagrams',
			'sideMenu.elements': 'elements',
			'sideMenu.basic': 'Basic ${_root.sideMenu.elements}',
			'generic.yes': 'Yes',
			'generic.no': 'No',
			'popup.saveBeforeOpenNew.title': 'Attention',
			'popup.saveBeforeOpenNew.content': 'You have an open document that\'s not being saved.\nWould you like to save this document before opening a new one?',
		};
	}
}

extension on _StringsIt {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'diagrams': 'Diagrams',
			'sideMenu.elements': 'Elementi',
			'sideMenu.basic': '${_root.sideMenu.elements} base',
			'generic.yes': 'Si',
			'generic.no': 'No',
			'popup.saveBeforeOpenNew.title': 'Attenzione',
			'popup.saveBeforeOpenNew.content': 'Hai un documento aperto che non è stato salvato.\nVuoi salvare questo documento prima di aprirne uno nuovo?',
		};
	}
}