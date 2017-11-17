class OxigensController < ApplicationController
	def index
	    usuario_correcto = "giordano"
    clave_correcta = "0110"
     
    puts "introduce tu nombre de usuario"
     
    usuario = gets.chomp
     
    while (usuario != usuario_correcto) do
       puts "usuario incorrecto, vuelve a intentarlo"
       usuario = gets.chomp
    end
    puts "introduce tu clave"
     
    clave = gets.chomp
     
    while (clave != clave_correcta) do
       puts "clave incorrecta, vuelve a intentarlo"
       clave = gets.chomp
       puts "bienvenido #{usuario_correcto}"
    end
     
    puts "Bienvenido a la CALCULADORA DE OXIGENO"
     
    def menu
        puts "1.-NO DEJARLO HABLAR"
        puts "2.-CONTAR LOS AUTOS"
        puts "3.-DIVIDIR ENTRE MONTAŇAS"
        puts "4.-VER LA PREGUNTA"
    end
     
    menu
    opcion = gets.chomp.to_i
     
    if opcion == 1
    puts "OXIGENOOXIGENO AUSTED NO SABE CUANTO IXIGNEO HAY EN UN AUTO DIGAMOS TENIENDO EN CUENTA LA CANTIDAD DE MONTANAS
    QUE EQUIVALE A LA FOTOSINTESIS DE U ARBOL EN UN AŇO QUE UN HOMBRE PUEDE CONSUMIR EN EL MISMO AŇO, OSEA CUANTOS AUTOS
    HACEN FALTA PARA QUE UN HOMBRE, DEBIDO A LA CANTIDAD DE ARBOLES QUE HAY EN EL MUNDO, SEA CAPAZ DE QUEDARSE SIN AIRE
    DEBIDO A LA CANTIDAD DE AUTOS EN EL MUNDO , SOBRE LAS MONTAŇAS "
    end
     
    if opcion == 2
    puts "Introduce la cantidad de nafta en el mundo (en kilolitros)"
    nafta1= gets.chomp.to_i
    puts nafta1+40*50-3299/9
    end
     
    if opcion == 3
    puts "introduce el primer numero"
    numero1 = gets.chomp.to_i
    puts "introduce el segundo numero"
    numero2 = gets.chomp.to_i
    multiplicacion = numero1 * numero2
    puts "el resultado es #{multiplicacion}"
    end
     
    if opcion == 4
    puts "INTENTO DE TRADUCCIÓN DE LA PREGUNTA

Ehhh muy importante ehhh bueno ehhh vos estas abriendo la cámara para los dos, no? estamos compartiendo los dos esta charla?. Bueno ehhh como estamos compartiendo esta charla los dos quiero decirle que ehhh...cuanto ossigeno ehhh le quita realmente un auto, una combustion de un auto ehhh equivale eeeehhh a cuantas arboles se necesitan para eh eh eh evitar justamente que el arbol que da ossigeno ehh indudablemente uno en la montaña cuando ve realmente que no hay ningún árbol es que no hay ossigeno, quiere decir que falta ossigeno ahi en la montaña que vos me dijiste en otra oportunidad. que pasa, cuanto equivale el el los gases y la lo que le quita ossigeno ehh ehh comparado con la cantidad de arboles que haría falta para combatir ehh ehh la combustión de un auto que eh esta ¿ absorbente? como dijiste vos que tiene mas de 120 años que le quita ossigeno?"
    end
   end
end
