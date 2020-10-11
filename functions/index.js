const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().functions);



var newData;

exports.messageTrigger = functions.firestore.document('chats/{chatId}').onCreate( async (snapshot, context) =>{
    if(snapshot.empty) {
        console.log('No devices');
        return;
    } 

    newData = snapshot.data();
    var tokens = [
        'fCwfg7gNSe2i780qY8tduy:APA91bGocFyOykqMUx8JNjtPo_lbsg3RJFPXkqm1CUD_EaHV8LmCZSUw3Or-IvWNzhh4hMZzjhtLr8yD19T0ovTtMlSkV_HTIeCXcY0TT3Ld6raLaFNdPjNycm0k6latGQiHVFNrmgFv'
    ];
    var payload = {
        notification : {title : 'Push title', body : 'henlo u idiot', sound : 'default'}, 
        data : {click_action: 'FLUTTER_NOTIFICATION_CLICK' , message : 'dje si' }
    };

    
    
    await admin.messaging().sendToDevice(tokens, payload).then( (response) => {
            console.log('Notification sent with response : ', response);

            return 'ok';

        }).catch((err) => {
            console.log(err);
        });
        
    
   

});
