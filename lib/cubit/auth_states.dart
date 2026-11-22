abstract class AuthStates{}
class AuthStatesinitial extends AuthStates{}
class IspassworsChaneState extends AuthStates{}

class SignUpLoadingState extends AuthStates {}
class SignUpSuccessState extends AuthStates {}
class SignUpErrorState extends AuthStates {
final String error;
SignUpErrorState(this.error);
}
class LogInLoadingState extends AuthStates {}
class LogInSuccessState extends AuthStates {}
class LogInErrorState extends AuthStates {
final String error;
LogInErrorState(this.error);
}
