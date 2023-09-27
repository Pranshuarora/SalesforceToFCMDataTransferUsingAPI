public class FCMNotification {

    @future(callout=true)
    public static void sendNotification(String registrationId, String title, String body, String stage, Id opportunityId, String opportunityName) {
        Map<String, Object> payload = new Map<String, Object>();

        Map<String, Object> data = new Map<String, Object>();
        data.put('title', title);
        data.put('body', body);
        data.put('stage', stage);
        data.put('id', opportunityId);
        data.put('name', opportunityName);

        payload.put('data', data);
        payload.put('registration_ids', new List<String>{registrationId});        

        String payloadJson = JSON.serialize(payload);

        // Debug Log
        System.debug('Payload JSON: ' + payloadJson); 

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://fcm.googleapis.com/fcm/send');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'key=AAAAJkjeACI:APA91bENzDYtzUNSVJWm30pIdzuCk3vsR1h-c3kXEs5gCTIcNL7Fhh6uKgmo1CsA1y3pKvwNAzx6gnozY9d5zEjIyufIZskdjPD3uB7Q14vIrXlzoRaQav__oLReZnDpSi7xdGOFcRLu'); // Replace with your FCM Server Key
        request.setBody(payloadJson);

        HttpResponse response = http.send(request);
 
        // Debug Log
        System.debug('Response Body: ' + response.getBody()); 
    }
}
