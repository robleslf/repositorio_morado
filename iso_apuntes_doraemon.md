Lo último de Linux
___
Cuotas a usuarios:
su - root
apt update
apt upgrade
apt install quota quotatool 
entras con root y nano a /etc/fstab
buscas dónde está el /home, ves que la primera partición está en la /, que es donde está el /home, así que es esa.
Le añades al final de la línea, después de ext4, lo siguiente:
    "defaults,usrquota 0 1"

Esto para usuarios, si quieres a grupos habría que añadirle "grpquota" después de la "," de "usrquota".

Guardamos el fichero.
Reiniciamos sistema.

___

WINDOWS

___

Powershell es más avanzada que la consola normal de Windows porque trabaja bajo objetos.

Podemos ejecutarla normal, o como administradores. De momento vamos a hacerlo normal.
ISE es un entorno para Scripts pero ahora solo lo usaremos para navegar por el sistema.

Con ISE, sin ser administrador, debería posicionarnos en nuestra carpeta personal.

Los comandos de powershell que vamos a utilizar tienen dos partes: el verbo, un guión, y un nombre, que es el parámetro que se utiliza.

Luego hay parámetros como en linux, filtros, redireccionamientos...igual que en Linux.

(Ver comandos del aula virtual.)


Hay tres alias propiamente dichos, los del shell, los comandos de linux, que están por compatibilidad con Linux, y no debemos usar, y otros que tampoco.
Solo debemos usar los propios alias del powershell.

___

Get-Location → gl (pwd)

Set-Location (cd) 
Si le escribo un \ me sugiere dónde quiero ir. \ Es la raíz aquí.

Get-Childitem (ls)

# Miércoles 6 de marzo

Set-Location C:\Windows

############################################# COMODINES
Get-ChildItem *
# el Primer caracter, si es una d, es u directorio, si es un guión puede ser cualquier cosas; el segundo, la a nos dice que es un archivo, y la s, que es un archivo del sistema

Get-ChildItem .\a*
# el . funciona igual que en Linux, es el directorio actual.  En este caso, quiero todo lo del directorio actual que empiece por "a"
Get-ChildItem b*
# El . puede omitirse, aunque sea más visual.

Get-ChildItem b* -File
# En esta, todos los que empiecen por b y sean de tipo fichero.

Get-ChildItem b* -Directory
# Solo los de tipo directorio.

Get-ChildItem [a-h]*
# Rango; que empiece por una letra de la a "a" la "h" (sin diferenciar may. y min.) y que continúe como sea.

Get-ChildItem [agh]*
# Que empiece por "a", por "g" o por "h".

Get-ChildItem ??.exe
# Que tenga dos caracteres y extensión .exe

Get-ChildItem *[sn].???
# Termina en 's' o 'n' y luego tiene '.' y tres caracteres.

Get-ChildItem *.??? -Directory
# ¿Habrá algún directorio que tenga extensión? Sí, lo hay, puede haber un directorio con extensión, sin problema.

Get-ChildItem * -Force
# Nos muestra los ocultos, es el -a de Linux. Sabemos que son ocultos porque aparece una 'h' de hidden.


############################## Atributos
# Las letras y '-' de la izquierda se llaman atributos del directorio o fichero. Podemos filtrar por estos atributos:

Get-ChildItem * -Attributes hidden 
# Solo nos muestra los atributos ocultos.

Get-ChildItem * -Attributes hidden -Directory
# Solo nos muestra los directorios con atributos ocultos

Get-ChildItem * -Attributes Archive
# Solo nos muestra los archivos. No se pone con -File porque sería redundante, ni con -Directory porque sería contradictorio.

Get-ChildItem * -Attributes Archive -Force
# solo archivos ocultos

Get-ChildItem *  -ReadOnly
# Solo los de solo lectura.

Get-ChildItem * -Attributes system -Force
# solo del sistema.

Get-ChildItem * -Attributes Directory -Force
# Solo nos muestra Directorios. Al igual que 'Archive', puedo pedirlo con el atributo o con el parámetro -Directory, no se ponen juntos por redundancia. Tampoco se mezcla con atributo -Archive porque no tendría ningún sentido.

Get-ChildItem * -Attributes Archive+system
# El '+' es un AND, tiene que cumplir ambas cosas, que sea archivo y que sea del sistema.

Get-ChildItem * -Attributes Archive+!system
# El '+' es un AND, y el ! una negación, tiene que cumplir ambas cosas, que sea archivo y que NO sea del sistema.

Get-ChildItem * -Attributes Archive, system
# La ',' es un OR, quiero Archivos y quiero los del sistema, los dos. Me hace una lista de los dos.

####### Recursiva
Get-ChildItem .\Help -Recurse
# Igual que en Linux, entra en un directorio y muestra todas las ramas.

####### Formatos de Salida:

Get-ChildItem *
# El formato de salida por defecto, es todo en columnas. Es el formato tabla.

Get-ChildItem * | Format-Table
# No es necesario ponerlo, porque es el que te hace por defecto.

Get-ChildItem * | Format-List
# El formato lista; se trabaja agregandole propiedades:

Get-ChildItem * | Format-List -Property mode, name
# Me salen dos filas de cada una de las entradas que haya: el mode y el name.



Set-Location C:\Windows

Get-ChildItem HelpPane.exe | Format-List -Property *
# Todas las propiedades de un fichero que queramos; no hay que sabérselas todas, pero muchas sí.


Get-ChildItem * -File | Format-List -Property mode, name, LastAccessTime, LastWriteTime
# aquí todos los que sean archivos, y le pido esas propiedades.



Get-ChildItem * | Format-Wide
# Esto nos saca solamente el name, en dos columnas, tres... como le cuadre bien.


Get-ChildItem * | Format-Wide -AutoSize
# Con el autosize, lo ajusta a la pantalla.




########################
# Variables de Entorno #
########################


Get-ChildItem Env:
# Así listamos las variables de entorno. Nos da el nombre de la variable y el contenido de esta. Es solo para verlas.

Get-ChildItem Env:COMPUTERNAME
# Así vemos una en concreto.

$Env:UserName
# Esta es otra manera. Muestra solo el resultado.

$HOME
# Esta nos muestra el Home nuestro.

$Host
# El host
$PSVersionTable
# Con estas dos últimas, podemos ver con qué versión estamos trabajando.

##################### 

Set-Location $HOME
# posicionarnos en nuestro HOME

Clear-Host
# Limpiamos la consola.

Get-ChildItem * > listado1.txt
# Creamos el fichero listado1.txt redireccionando.

Get-ChildItem lis*
# Vemos que se ha creado.

Get-Content .\listado1.txt
# Leemos el contenido del fichero. Es un cat.

Get-Content .\listado1.txt -Last 10
# Leemos las últimas 10 líneas del fichero. Suele dejar unas líneas en blanco Windows, así que hay que calibrar bien eso; las tiene tanto arriba como abajo, habría que calcular.

Get-Content .\listado1.txt -First 5
# Leemos las 5 primeras líneas. Muchas son líneas en blanco.

(Get-Content .\listado1.txt).count
# Usamos un método sobre un objeto; los métodos se escriben con un '.' y el nombre del método.

(Get-ChildItem *).count
# Así podemos ver cuántas entradas tiene nuestro directorio actual.

# 7 de marzo de 2024

Clear-Content .\listado1.txt
# Esto vacía el contenido, pero no lo elimina.

Add-Content .\listado1.txt -Value "Informe"
# Le doy un valor al fichero, que en este caso será un título. Cada vez que lo ejecute me generará una línea nueva.

Add-Content .\listado1.txt -Value "Siguiente línea" -PassThru
# Esto del Passthru además te enseña lo que está haciendo.

Get-Date
# Me da la fecha del sistema, es el date en Linux

Add-Content .\listado1.txt -Value (Get-Date) -PassThru
# Esto me añade la fecha al fichero, mostrándomelo por pantalla a la vez.

Add-Content .\listado1.txt -Value "129, 10, 50, 10250" -PassThru
# Con las comillas, me muestra la línea según la he escrito, es una cadena de texto.

Add-Content .\listado1.txt -Value "129", "10", "50", "10250" -PassThru
# Al poner comillas individuales a cada valor, cada valor lo pone individual.

Add-Content .\listado1.txt -Value "129", "10", "`n50", "10250" -PassThru
# Con el acento francés y una "n" hace un salto de línea.

Get-Content .\listado1.txt | Add-Content listado2.txt -PassThru
# Aquí visualizo el contenido del fichero listado1.txt, y ese contenido lo va a añadir a un fichero que es listado2.txt, y que puede existir o no; si no existe, lo crea.

$datos="lunes `nmartes `nmiércoles `njueves"
# Hemos creado una variable con una serie de valores.

$datos
# Así la ejecuto.

Add-Content .\listado1.txt -Value $datos -PassThru
# Añadimos el contenido de la variable al fichero.

(Get-Content .\listado1.txt).ToUpper()
# Todo a mayúsculas.

(Get-Content .\listado1.txt).ToLower()
# Todo a minúsculas.

(Get-Content .\listado1.txt).Count
# Cuenta el contenido, las líneas.

(Get-Content .\listado1.txt).Length
# Cuenta la longitud, para un fichero sería la cantidad de líneas con el Get-Content.

Get-Command Add-Content -Syntax
# El Get-Command obtiene un comando, el que o quiera, en este caso hemos puesto el Add-Content, y le hemos pedido la sintáxis de este comando. Muestra información sobre el comando que le pidas, sobre lo que le pidas.

# Pedir ayuda al cmdlet Sort-Object
Get-Command  Sort-Object -Syntax
# con get-help:
Get-Command Sort-Object -Examples
# y para ayuda online:
Get-Help Sort-Object -Online



###### Lunes 11 de marzo

Get-Content .\listado1.txt | Add-Content .\listado2.txt -PassThru
# Todo lo de listado1 se lo añadimos a listado2, y que nos lo muestre por pantalla.

Get-Content .\listado1.txt | Tee-Object .\listado2.txt
# Lo mismo el Tee-Object

New-Item -ItemType Directory prueba 
# Crear directorio prueba

Set-Location .\prueba
# Nos posicionamos en prueba

New-Item -ItemType File arch1.txt
# Creamos un archivo

Get-ChildItem . -Force
# 

New-Item -ItemType Directory compras,ventas
# Para crar dos directorios a la vez, se necesita la ','

New-Item -ItemType Directory .\compras24,.\ventas24
# Creamos otros dos

Get-ChildItem . | Add-Content arch1.txt -PassThru
# 

Rename-Item .\compras .\compras23
# Renombramos el directorio compras a compras23

Rename-Item .\ventas .\ventas23 -PassThru
# Renombramos ventas a ventas23

Get-ChildItem .\ventas23 

Copy-Item .\arch1.txt .\ventas23 -PassThru
# Copiamos el arch1 a la carpeta ventas23

Set-Location ..
# Vuelvo al directorio padre

 Copy-Item .\prueba\ventas23\arch1.txt .\prueba\copias -PassThru
 # Esto es copiarlo con la ruta

 Remove-Item .\prueba\ventas23\arch1.txt
 # Eliminamos el archivo

 Get-ChildItem .\prueba\compras23\*
 # Visualizamos el directorio

 Copy-Item .\prueba\copias\arch1.txt .
 # Copiamos el archivo al directorio actual

 Get-ChildItem .\a*
 # Todo lo que empiece por a

 Get-Content .\arch1.txt
 # Vemos el tamaño del fichero

 Clear-Content .\arch1.txt
 # Eliminamos el contenido del fichero, pero no el fichero

Get-Content .\arch1.txt
# Vemos el tamaño del fichero, ahora es 0

$fecha=Get-Date
# guardamos la fecha del día en la variable fecha

$fecha
# la ejecutamos

Write-Host "Hoy es $fecha"
# Escribe en la terminal el texto que le pongas entre comillas; es un echo de Linux

######### 14 de marzo 

(Get-ChildItem .\ -Depth 2 2>out-Null).Length
# Contamos cantidad de elementos -items- que hay en el subdirectorio con dos profundidades. Además hemos agregado la papelera.

(Get-ChildItem .\ -Depth 2 2>out-Null).Count
# Otra manera de contar

(Get-Date).Month
(Get-Date).Day
(Get-Date).Year
(Get-Date).DayOfWeek
(Get-Date).Hour
(Get-Date).Minute
(Get-Date).Second
# Se pueden sacar de la fecha

Get-Date -Format 'dd-MM-yy HH:mm'
Get-Date -Format 'dd-MM-yy'
Get-Date -Format 'dd/MM/yy'
# Formato que le pidas

### Conversiones en MAY o mins

(Get-Content .\listado1.txt).ToUpper()
(Get-Content .\listado1.txt).ToLower()

Set-Content .\colores.txt -value "blanco, rojo, azul, naranja"

Get-Content .\colores.txt

Get-Content .\colores.txt | Sort-Object
# Ordena el fichero

Add-Content .\colores.txt -Value "azul, naranja, amarillo, morado"

Get-Content .\colores.txt -Tail 1
# Sacamos el último

Get-Content .\colores.txt -First 1
# Sacamos el primero

Get-ChildItem $HOME -File | Format-List -Property Name, *time, length


###### Propiedades

Get-Content .\colores.txt -TotalCount 3

sort object -descending o algo asi

## Faltan cosas aquí arriba

#######################

Get-ChildItem $HOME -File | Format-List -Property Name,  'time, length'


############
#        ALIAS        #
###########

Get-Command
# Vemos todos los alias, todos los comandos y todas las funciones.

Get-Command -CommandType Alias
# Para ver solo los alias

(Get-Command -CommandType Alias).Count
# Contar el número de alias

Get-Command -CommandType Cmdlet -Name Get*
# Todos los comandos que empiecen por Get

Get-Command -CommandType Cmdlet -Name Clear*
# Todos los que empicen por clear

Get-Command -CommandType Cmdlet -verb g*
# Todos los que el verbo empiece por V


Get-Command -CommandType Cmdlet -Noun c*
# Todos los que el nombre empiece por C

Get-Acl
# Lista de control de acceso, son los permisos básciamente, para saber a quién pertenece cada fichero

Get-Acl .\colores.txt | fl -Property owner
# el nombre del propietrio del fichero colores

gc .\colores.txt |  Out-GridView
# Nos muestra en un eantorno gráfico el resultado.

gc .\colores.txt | Out-GridView 

gci -File |Where-object Length -lt 1MB

gci -File |Where-object Length -eq 0

gci -File |Where-object Length -lt 1kb


gci |Where name -like l*

gci |Where Name -clike l*

gci | Where Extension -eq ".txt"

gci | Where Extension -eq ".txt" | Where Length -gt 10KB

gci | Where Name -like "*[0-9]*" | Where Length -eq 0 

gci | Where Mode -like "-a*"

gci | Where Mode -like "d?r*"

gci | Where Name -Match "ct"
Que contenga una c cin una t
Da igual se e en mayusuclas ou en minusculas 
poniendo "-cMactch" te pone el exacto

gci | Where Name -Match "^p"

gci | Where Name -Match "s$"

gc .\Colores.txt | Where "o$"

gc .\Colores.txt | Where {$_ -Match "o$"} | Sort |gu
algo de lo que busque la linea entera? |lo ordene |no ponga repeticiones 

Nota comparar con 0  o con $NULL no es lo mismo. Directorios vacios $NULL

#############
gci C:\Windows | Select-Object Name -First 5
# Obtenemos columnas, con esto le pedimos el nombre, es como el Select de BD, luego le puedes pedir las 5 primeras, unique, ...

gci C:\Windows | select CreationTime, Name -Last 10
# El select puede ir solo. 

Get-ChildItem c:\  | Out-Host -Paging
# Paginado

 #Procesos 

#Ver todos los comandos relacionados con procesos 

Get-Command -CommandType Cmdlet *Process

#######

Get-Process 

#Se ven todos los procesos con su ID etc,etc....
#En el id 0 del sistema y el 1 del usuario

Get-Help Get-Process -Online

#Ayuda de los procesos de manera online. Con este comando es importante que estea la maquina abierta 
#Esta bastante ven explicado de maneira online :)

#Contar la cantidad de procesos Que hay en el sistema de todo tipo
(Get-Process ).count 

#Ver los 5 primeros procesos 

Get-Process | Select-Object -Last 5

# Ver los 5 primeros 
Get-Process | Select-Object -First 5

#todos los que tengan el ID a 0 Vemos todas las propiedades que tienen

Get-Process | Sort ID | ? Id -eq 0 | Select -Property *

# Ver los procesos de los numeros de procesos entre el 100 y el 300 / Sacar por numero de proceso

Get-Process |  ?{$_.Id -ge 100 -and $_.Id -le 999 } | Slect Name, Id

#Ordenar / Filtrar  por el nombre del proceso

Get-Process | Sort ProcessName 

#Ordenar / Filtrar por el nombre del proceso sin repetidos y por tabla (Creo)

Get-Process | Sort ProcessName  | gu | ft 

# gu Get-Unique creo
# ft format-table creo que se escribian asi tabular mejor  :)

#abrir una aplicacion de manera muy imperativa palabras de Rosa :)

notepad

# Buscar un proceso concreto / en este caso nos dice la informacion del notepad/ En este caso se estaria ejecuantando en segundo plano minimizado
    
    Get-Process notepad 

# Con fl nos lo muentra como lista 

Get-Process notepad | fl

#Para que muestre todas las propiedades en formato lista 

Get-Process notepad | fl | -Property *

#El Get process seria mas basico que si le pones el -property 


#Correctamente se abriria el notepad con el start processs

Start-processs c:\Windows\System32\notepad.exe

#Hacemos una variable identificacion de proceso (Guardas PAra ver el ID del notepad en variable)

$Idpro = (Get-Process notepad).Id

#Parar un proceso aprovechando la variable que creamos 

Stop-Process -Id $IdPRO


#Ver las sesiones que se usan en este momento
query session

#Ver los procesos todos que son mios 
#En este caso es 1 porque es el usuario mio sesion 1 
#Si quieres ver otro usuario seria otro número 
get-process | ? SI -eq 1

#Iniciar en una pagina Con una pestaña directamente. Al ejecutar una aplicacion tienes que poner los espacios tal cual está en la ruta 

Start-Process "C:\Program File (x86)\Internet Explorer\iexplore.exe" -ArgumentList https://www.xunta.gal

#Parar el proceso del explorer 

Stop-Process iexplore
#Como por el nombre no finalizo miramos el id y finalizamos por este

Stop-Process -Id 1784 #(En este caso, Suele a tener varios procesos si te coincide el principal cierra todos automaticamente  )

######### Martes 9 de abril de 1993
# Hicimos ejercicio 4


############## Miércoles 10 de abril de 1993
# Usuarios y grupos locales
##################################

# Cuando hacemos una instlaci´n, creamos un usuario, y este tiene que pertenecer a un grupo.

Get-LocalGroup 


Get-LocalGroup
# Ves los grupos

Get-LocalUser
# Ver usuarios; tenemos el nombre de cuenta, si está habilitada (true) o no (flase), y la descripción, que no dice mucho tampoco.

Get-LocalUser bea
# Un usuario en especial

Get-LocalUser bea | fl
# Un formato en especial; viene bastante información

$pwd = ConvertTo-SecureString "abc123." -AsPlainText -Force
# Encriptar contraseña y guardarla en una variable

$fecha = (Get-Date).AddMonths(6)
# Manipular fechas; esta la vamos a utilizar para establecer la fecha de expiración de la contraseña, le hemos puesto que sea después de 6 meses de la fecha que sea en ese momento.


New-LocalUser -Name ana -Password $pwd -PasswordNeverExpires -AccountExpires $fecha
# Crear una cuenta local; si usas variables, como eneste caso, antes deben ejecutarse, porque si no no va a ejecutarse bien la creación de usuario. Ade,ás el ISE tiene que ejecutarse como administrador.

Get-LocalUser ana | fl
# Y ahora vemos el usuario que acabamos de crear

$fecha = (Get-Date).AddYears(1)
# cambiamos el valor de la variable fecha

Set-LocalUser -Name ana -FullName "Ana Álvarez"  -AccountExpires -UserMayChangePassword $false
# Aquí podemos modificar y añadir cosas de un usuario, puede ponerse $flase o $true para cambiar algunos valores... el -UserMayChangePassword no va solo, va con el booleano.

Get-LocalUser | ? Enabled -EQ $true
# Ver tdas las cuentas que están habilitadas.

Disable-LocalUser ana
# deshabilitar una cuenta

Get-LocalUser | ? Enabled -EQ $false
# Ver tdas las cuentas que están deshabilitadas, debería salir ana.


Enable-LocalUser ana
# Habilitamos a ana


Get-LocalUser | ? Enabled -EQ $true
# Comprobamos que ana está habilitada


Set-LocalUser -Name ana  -Description "usuario genérico" 
# Le ponemos una descripción a ana

Get-LocalUser ana | fl
# vemos que la puso bien

#############
#        GRUPOS        #
############

Get-LocalGroup
# Ves los grupos

New-LocalGroup tesoreria -Description "Dpto. Tesorería" 
# creamos un grupo, tiene varios parámetros que se le pueden poner

Get-LocalGroup tesoreria
# Solo quiero la información de tesoreria

Get-LocalGroup tesoreria | Format-List
# Este me da toda la información del grupo

Set-LocalGroup tesoreria -Description "Departamento contabilidad"
# le cambias cosas al grupo

Rename-LocalGroup tesoreria -NewName contabilidad
# renombras un grupo


Remove-LocalGroup contabilidad
# borras un grupo

New-LocalGroup tesoreria
# volvemos a crear el grupo

Add-LocalGroupMember -Group contabilidad -Member ana
# añadir un nuevo usuario al grupo contabilidad


Get-LocalGroupMember contabilidad
# Obtenemos todos los miembros del grupo contabilidad

Get-LocalGroupMember -Group Usuarios


Remove-LocalGroupMember -Group contabilidad -Member ana
# eliminamos un usuario del grupo que queramos

###############################
# Ejemplos #######################
############################
###############

Get-Help New-LocalUser -Online
# Pedimos ayuda online al comando New-LocalUser
