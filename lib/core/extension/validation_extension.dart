// /// written for validate the characters in edit text
// /// written this Extensions for String class
// extension ValidationExtension on String {
//   //for validate Email
//   String? isMail() {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regExp = RegExp(pattern);
//     if (isEmpty) {
//       return Strings.enterEmailAddressReqExMessage;
//     } else if (!regExp.hasMatch(this)) {
//       return Strings.enterValidEmailReqExMessage;
//     }
//     return null;
//   }

//   bool isOTPCode() {
//     String pattern = r'^[0-9]*$';
//     RegExp regExp = RegExp(pattern);
//     if ((!regExp.hasMatch(this)) || (length != 6)) {
//       return false;
//     }
//     return true;
//   }

//   //for validate phone numbers
//   String? isTelNo() {
//     // String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
//     String pattern = r'^\(\d{3}\) \d{3} \d{4}$';
//     RegExp regExp = RegExp(pattern);
//     if (length == 0) {
//       return Strings.enterTelNoReqExMessage;
//     } else if (!regExp.hasMatch(this)) {
//       return Strings.enterValidTelNoReqExMessage;
//     }
//     return null;
//   }

//   //for validate activation code
//   String? isQRCode() {
//     String pattern = r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$';
//     RegExp regExp = RegExp(pattern);
//     if (length < 4 || length > 16 || !regExp.hasMatch(this)) {
//       return Strings.enterValidCodeReqExMessage;
//     }
//     return null;
//   }

//   //for validate name
//   String? isName() {
//     String pattern =
//         r"^[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]+(([',. -][a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ])?[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]*)*$";
//     RegExp regExp = RegExp(pattern);
//     if (isEmpty) {
//       return Strings.enterNameReqExMessage;
//     } else if (length == 1 || !regExp.hasMatch(this)) {
//       return Strings.enterValidNameReqExMessage;
//     }
//     return null;
//   }

//   //for validate name
//   String? isSurName() {
//     String pattern =
//         r"^[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]+(([',. -][a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ])?[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]*)*$";
//     RegExp regExp = RegExp(pattern);
//     if (isEmpty) {
//       return Strings.enterSurnameReqExMessage;
//     } else if (length == 1 || !regExp.hasMatch(this)) {
//       return Strings.enterValidSurnameReqExMessage;
//     }
//     return null;
//   }

//   //for validate address
//   String? isAddress() {
//     String pattern = r'^[a-zA-Z0-9\s,.-]+$';
//     RegExp regExp = RegExp(pattern);
//     if (isEmpty) {
//       return Strings.addressTextFieldText;
//     } else if (length == 1 || !regExp.hasMatch(this)) {
//       return Strings.enterValidAddressReqExMessage;
//     }
//     return null;
//   }

//   String? isTaxNumber() {
//     String pattern = r'^[0-9]{10}$';
//     RegExp regExp = RegExp(pattern);
//     if (isEmpty) {
//     } else if (length == 1 || !regExp.hasMatch(this)) {
//       return Strings.enterValidTaxNumberReqExMessage;
//     }
//     return null;
//   }

//   //for validate url
//   String? isValidUrl() {
//     String pattern =
//         r"^[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$";
//     RegExp regExp = RegExp(pattern);
//     if (isEmpty) {
//       return Strings.requiredFieldReqExMessage;
//     } else if (length == 1 || !regExp.hasMatch(this)) {
//       return Strings.pleaseEnterValidUrl;
//     }
//     return null;
//   }

//   //for validate percentage
//   String? isPercantage() {
//     String pattern = r"^(100(\.0{1,2})?|\d{0,2}(\.\d{1,2})?)$";
//     RegExp regExp = RegExp(pattern);
//     if (isNotEmpty && !regExp.hasMatch(this)) {
//       return Strings.pleaseEnterValidPercantage;
//     }
//     return null;
//   }

//   //for validate cost
//   String? isCost() {
//     String pattern = r"^\d{1,6}(\.\d{1,2})?$";
//     RegExp regExp = RegExp(pattern);
//     if (isNotEmpty && !regExp.hasMatch(this)) {
//       return Strings.pleaseEnterValidCost;
//     }
//     return null;
//   }

//   String? isEmptyOrValid(String? Function() func) {
//     if (isEmpty) {
//       return null;
//     } else {
//       return func();
//     }
//   }

//   String? isValidAmount(double maxAmount) {
//     double? currentAmount = double.tryParse(this);
//     if (isNotEmpty && currentAmount == null) {
//       return Strings.pleaseEnterValidAmount;
//     } else if (isNotEmpty && currentAmount! > maxAmount) {
//       return Strings.discountCanNotBeGreater;
//     }
//     return null;
//   }

//   String? isNotEmptyController() {
//     if (isEmpty) {
//       return Strings.requiredFieldReqExMessage;
//     }
//     return null;
//   }

//   String capitalize() {
//     return "${this[0].toUpperCase()}${substring(1)}";
//   }

//   String toReadableFormat() {
//     // Boş string kontrolü
//     if (isEmpty) return this;

//     // İlk harfi büyük yap
//     String result = this[0].toUpperCase();

//     // Geri kalan karakterleri kontrol et
//     for (int i = 1; i < length; i++) {
//       if (this[i] == this[i].toUpperCase()) {
//         // Büyük harf öncesine boşluk ekle
//         result += ' ${this[i].toLowerCase()}';
//       } else {
//         result += this[i];
//       }
//     }

//     return result;
//   }

//   String? currencyValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Para birimi zorunludur';
//     }

//     final currencyRegex = RegExp(r'^[A-Z]{3}$');

//     if (!currencyRegex.hasMatch(value)) {
//       return Strings.enterValidCurrencyReqExMessage;
//     }

//     final validCurrencies = [
//       'USD',
//       'EUR',
//       'GBP',
//       'JPY',
//       'TRY',
//       'AUD',
//       'CAD',
//       'CHF',
//       'CNY',
//       'SEK',
//       'NZD'
//     ];
//     if (!validCurrencies.contains(value)) {
//       return Strings.enterValidCurrencyReqExMessage;
//     }

//     return null;
//   }

//   String? isCreditCardNumber() {
//     if (isEmpty) {
//       return Strings.requiredFieldReqExMessage;
//     } else if (length < 16) {
//       return Strings.enterValidCardNoReqExMessage;
//     }
//     return null;
//   }

//   String? isCreditCardDate() {
//     if (isEmpty) {
//       return Strings.requiredFieldReqExMessage;
//     } else if (length < 4 ||
//         int.parse(substring(0, 2)) > 12 ||
//         int.parse(substring(2)) < 21) {
//       return Strings.enterValidDatReqExMessage;
//     }
//     return null;
//   }

//   String? isCreditCardCVV() {
//     if (isEmpty) {
//       return Strings.requiredFieldReqExMessage;
//     } else if (length < 3) {
//       return Strings.enterValidPasswordReqExMessage;
//     }
//     return null;
//   }
// }
