
Feature: Actualizar la informacion de user

  As an user
  Quiero actualizar mi informacion
  y que se vea la informacion actualizada

  Background:
    Given Estoy apuntando al endpoint "reqres.in/api/users/"

  Scenario: Actualizar informacion de un user existente
    When Le añado al endpoint un <user_id> existente con los datos a actualizar en formato json:
    Then la respuesta deberia ser un codigo de estado 200
    And la respuesta debe incluir el json con valores actualizados

  Scenario: Actualizar informacion de un user invalido
    When Envio una solicitud PUT al endpoint con un <user_id> invalido y con los datos a actualizar en formato json
    Then la respuesta deberia ser un codigo de estado 400
    And No deberia retornar ningun formato json con datos actualizados

  Scenario: Actualizar id de un user existente
    When Le añado al endpoint un <user_id> existente con el json incluyendo el id nuevo
    Then la respuesta deberia ser un codigo de estado 400
    And Se deberia retornar un mensaje indicando que no se puede cambiar el id del usuario registrado

  Scenario: Actualizar nombre de un user existente
    When Le añado al endpoint un <user_id> existente con el json que contenga el valor nuevo de name
    Then la respuesta deberia ser un codigo de estado 200
    And la respuesta debe incluir el json con valores actualizados



Feature: Registro de usuario en AliExpress

  Como un nuevo user
  Quiero registrarme en AliExpress

  Background:
    Given Estoy en la pagina de registro de Aliexpress

  Scenario: Registro Exitoso con informacion valida
    When Ingreso informacion valida de registro
    And Doy click en el boton de Create account
    Then Deberia recibir un codigo de verificacion en mi correo
    And Al ingresar el codgio deberia redirigirme a la pagina principal

  Scenario: Registro fallido con contraseña muy corta
    When Ingreso una contraseña con menos de 6 caracteres
    And Intento dar click en el boton Create account
    Then Deberia tener el boton de Create account deshabilitado
    And Debe aparecer un mensaje indicando la longitud que debe tener la contraseña

  Scenario: Registro fallido con correo ya existente
    When Ingreso un correo ya registrado
    And Intento dar click en el boton Create account
    Then Deberia tener el boton de Create account deshabilitado
    And Deberia ver un mensaje indicando que el correo ingresado ya existe


  Scenario: Registro fallido con informacion vacia
    When No ingreso ninguna informacion en el formulario de registro
    And Intento dar click en el boton Create account
    Then Deberia tener el boton de Create account deshabilitado


Feature: User Login

  Como un usuario registrado
  Quiero loguearme en mi cuenta
  Para poder acceder a las funcionalidades de la pagina

  Background:
    Given Estoy en la pagina de registro de Aliexpress

  Scenario: Login exitoso con credenciales correctas
    When Ingreso un usuario y contraseña validos.
    And Doy click en el boton de Sign in
    Then Deberia ser redirigido a la pagina princiapl

  Scenario: Login fallido con correo invalido
    When Ingreso un correo invalido y contraseña valida
    And Doy click en el boton de Sign in
    Then Deberia ver un mensaje indicando que el correo es invalido

  Scenario: Login fallido con contraseña invalida
    When Ingreso un correo valido y contraseña invalida
    And Doy click en el boton de Sign in
    Then Deberia ver un mensaje indicando que el correo es invalido

  Scenario: Login fallido con correo y contraseña vacios
    When Dejo el campo de email y contraseña vacios
    And Intento dar click en el boton de Sign in
    Then Deberia tener el boton de Sign in deshabilitado
