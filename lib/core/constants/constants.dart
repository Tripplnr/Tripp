class ApiConstant {
  // BASE  URL
  static const baseURL = "http://54.205.120.230/";
  static const baseURLRapidAPIHotelBooking =
      "https://booking-com.p.rapidapi.com";

  // Endpoints
  static const blogSearchEndPoint = "books?q=";
  static const homeEndPoint = "books?q=";
  static const homePopularHotelEndPoint =
      "${baseURLRapidAPIHotelBooking}/v1/hotels/search-by-coordinates";
  static const hotelDetailsEndPoint =
      "${baseURLRapidAPIHotelBooking}/v1/hotels/data";
  static const hotelDetailsDescriptionEndPoint =
      "${baseURLRapidAPIHotelBooking}/v1/hotels/description";
  static const hotelDetailsPhotosEndPoint =
      "${baseURLRapidAPIHotelBooking}/v1/hotels/photos";
  static const hotelDetailsReviewsEndPoint =
      "${baseURLRapidAPIHotelBooking}/v1/hotels/reviews";
  static const hotelDetailsAmentiesEndPoint =
      "${baseURLRapidAPIHotelBooking}/v1/hotels/facilities";

  static const aboutUsAPI = baseURL + "api/about-us";
  static const termOfUseAPI = baseURL + "api/term-condition";
  static const privacyPolicy = baseURL + "api/about-us";
}
