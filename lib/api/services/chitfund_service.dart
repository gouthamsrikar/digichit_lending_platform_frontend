import 'package:dio/dio.dart';
import 'package:onemoney_hack/models/api/fetch_communties_response.dart';
import 'package:onemoney_hack/models/api/fetch_loans_response.dart';

class ChitFundService {
  final Dio _dio;
  ChitFundService() : _dio = Dio(BaseOptions(baseUrl: "http://localhost:8080"));

  Future<FetchCommunitesResponse> getCommunites(String userId) async {
    final response = await _dio.get('/community/$userId');
    return FetchCommunitesResponse.fromJson(response.data);
  }

  Future<FetchLoansResponse> getLoans(String userId) async {
    final response = await _dio.get('/loan/$userId');
    return FetchLoansResponse.fromJson(response.data);
  }

  Future<FetchLoansResponse> requestToJoinCommunity(
    int userId,
    int communityId,
  ) async {
    final response = await _dio.post('/community/request', data: {
      "community_id": communityId,
      "user_id": userId,
    });
    return FetchLoansResponse.fromJson(response.data);
  }

  Future<FetchLoansResponse> requestTLoan(
    int userId,
    int communityId,
    double loanAmount,
  ) async {
    final response = await _dio.post('/loan/request', data: {
      "community_id": communityId,
      "user_id": userId,
      "loan_amount": loanAmount,
    });
    return FetchLoansResponse.fromJson(response.data);
  }
}
