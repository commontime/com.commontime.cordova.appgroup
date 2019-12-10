/*global cordova, module*/

module.exports = {
	addConversation: function (successCallback, errorCallback, id) {
        cordova.exec(successCallback, errorCallback, "AppGroup", "addConversation", [id]);
    },
    removeConversation: function (successCallback, errorCallback, id) {
        cordova.exec(successCallback, errorCallback, "AppGroup", "removeConversation", [id]);
    },
    setApplicationBadgeNumber: function (successCallback, errorCallback, number) {
        cordova.exec(successCallback, errorCallback, "AppGroup", "setApplicationBadgeNumber", [number]);
    },
    add: function (successCallback, errorCallback, key, value) {
        cordova.exec(successCallback, errorCallback, "AppGroup", "add", [key, value]);
    },
    remove: function (successCallback, errorCallback, key) {
        cordova.exec(successCallback, errorCallback, "AppGroup", "remove", [key]);
    }
};