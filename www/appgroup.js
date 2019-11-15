/*global cordova, module*/

module.exports = {
    removeConversation: function (successCallback, errorCallback, id) {
        cordova.exec(successCallback, errorCallback, "AppGroup", "removeConversation", [id]);
    },
    setApplicationBadgeNumber: function (successCallback, errorCallback, number) {
        cordova.exec(successCallback, errorCallback, "AppGroup", "setApplicationBadgeNumber", [number]);
    }
};