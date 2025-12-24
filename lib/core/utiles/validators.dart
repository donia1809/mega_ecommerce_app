// class Validators {
  
//   const Validators._(); 

//   static String? email(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter email address';
//     }
//     if (!value.contains('@')) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }

//   static String? password(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter password';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     return null;
//   }

//   static String? requiredField(String? value, String fieldName) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter $fieldName';
//     }
//     return null;
//   }
// }
