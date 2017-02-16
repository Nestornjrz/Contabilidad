namespace Conta.Sts.Constants
{
    public class Constants
    {

        public const string Conta_API = "https://localhost:44315/";
        public const string Conta_MVC = "https://localhost:44318/";
        public const string Conta_MVCSTSCallback = "https://localhost:44318/stscallback";
        public const string Conta_Angular = "https://localhost:44316/";

        public const string Conta_ClientSecret = "myrandomclientsecret";

        public const string Conta_IssuerUri = "https://tripcompanysts/identity";
        public const string Conta_STSOrigin = "https://localhost:44317";
        public const string Conta_STS = Conta_STSOrigin + "/identity";
        public const string Conta_STSTokenEndpoint = Conta_STS + "/connect/token";
        public const string Conta_STSAuthorizationEndpoint = Conta_STS + "/connect/authorize";
        public const string Conta_STSUserInfoEndpoint = Conta_STS + "/connect/userinfo";
        public const string Conta_STSEndSessionEndpoint = Conta_STS + "/connect/endsession";
        public const string Conta_STSRevokeTokenEndpoint = Conta_STS + "/connect/revocation";


    }
}
