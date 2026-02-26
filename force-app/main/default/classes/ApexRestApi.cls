@RestResource(UrlMapping='/Account/')
global class ApexRestApi {
    @HttpGet
    global static List<Account> getAccounts(){
        List<Account> accList = [SELECT Id,Name From Account];
        return accList;
    }
    
    @HttpPost
    global static void createAccount(){
        RestRequest req = RestContext.Request;
        
        string Body = req.requestBody.toString();
        Jsonclass acc = (Jsonclass) JSON.deserialize(Body, Jsonclass.Class);
        Account acc1 = new Account(Name = acc.CompanyName,Industry = acc.Industry);
        Insert acc1;
        System.debug(acc1);
        System.debug(req);
        System.debug('Added Second Commit');
    }
}