const enableProxy = true;
// const proxyServerUrl = '192.168.31.204';
const proxyServerUrl = '192.168.0.51';
bool needProxy() => !bool.fromEnvironment('dart.vm.product') && enableProxy;
