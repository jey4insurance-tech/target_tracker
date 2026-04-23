import '../models/policy.dart';
import '../models/fyp.dart';

double monthlyPremium(List<Policy> policies) {
  return policies.fold(0, (sum, p) => sum + p.premium);
}

double branchPremium(List<Policy> policies, String branch) {
  return policies
      .where((p) => p.branch == branch)
      .fold(0, (sum, p) => sum + p.premium);
}

double yearlyTotal(List<Policy> policies, List<FYP> fypList) {
  double premium = policies.fold(0, (sum, p) => sum + p.premium);
  double fyp = fypList.fold(0, (sum, f) => sum + f.amount);
  return premium + fyp;
