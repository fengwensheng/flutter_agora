const enableProxy = true;
const proxyServerUrl = '192.168.31.204';
bool needProxy() => !bool.fromEnvironment('dart.vm.product') && enableProxy;
