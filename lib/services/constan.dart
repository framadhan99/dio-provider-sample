const String development = "https://htapp.rittercoding.com";

const String endpoint = "$development/api";

class Routes {
  static const String checkEmail = "$endpoint/login";
  static const String signUp = "$endpoint/signin";

  static const String getProvince = "$endpoint/getProvince";
  static const String getRegency = "$endpoint/getRegency";
  static const String getDistrict = "$endpoint/getDistrict";

  static const String getCategoryGroup = "$endpoint/getCategoryGroup";
  static const String getCategoryTopic = "$endpoint/getCategoryTopic";

  static const String deleteCategoryTopic = "$endpoint/deleteCategoryTopic";
  static const String createCategoryTopic = "$endpoint/createCategoryTopic";
  static const String updateCategoryTopic = "$endpoint/updateCategoryTopic";

  static const String storeForum = "$endpoint/createPost";
  static const String deleteForum = "$endpoint/deletePost";
  static const String getForum = "$endpoint/searchPost";
}
