/**
 * Created by memonono on 31/10/14.
 */

app.controller("compania_controller", function ($scope,$http) {

    $scope.query= 'nombre';
    $scope.clientes= function ($http) {

        $http.get(clientes.json)

    };
});
