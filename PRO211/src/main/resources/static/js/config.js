function config($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/home');
    $stateProvider
       .state('ADAV', {
            url: "/ADAV",
            templateUrl: "monhoc\ADAV.js"
        })	
}