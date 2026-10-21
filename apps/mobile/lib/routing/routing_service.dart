import '../models/route_profile.dart';

abstract interface class RoutingService {
  Future<RouteEstimate?> estimateTravelTime({
    required String originCluster,
    required String destinationCluster,
    required DateTime departureTime,
    required String transport,
  });
}

class ManualRoutingService implements RoutingService {
  const ManualRoutingService(this.estimates);

  final List<RouteEstimate> estimates;

  @override
  Future<RouteEstimate?> estimateTravelTime({
    required String originCluster,
    required String destinationCluster,
    required DateTime departureTime,
    required String transport,
  }) async {
    if (estimates.isEmpty) {
      return null;
    }
    return estimates.first;
  }
}
