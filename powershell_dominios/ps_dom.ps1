# Crear una OU
New-ADorganizationalUnit -Name eso -Path "DC=ciclo,DC=local" -Description "Grupos de Seguridad" -ProtectedFromAccidentalDeletion $true -PassThru

# Ver las UO que tenemos
Get-ADOrganizationalUnit -Filter * | Select-Object Name

# Todas las UO que empiecen por al
Get-ADOrganizationalUnit -Filter {Name -like 'al*'}

# Preguntar por las que terminen en s
Get-ADOrganizationalUnit -Filter {Name -match 's$'} | Select-Object Name
# el match no lo soporta, va a dar error, hay que trabajar con el like

# Consultar todos los objetos de una OU que hay a partir de una ruta
Get-ADOrganizationalUnit -Filter * -SearchBase "DC=ciclo,DC=local" | Select-Object Name
# sin el -filter * da error.

# A partir de alumnos
Get-ADOrganizationalUnit -Filter * -SearchBase "DC=alumnos,DC=ciclo,DC=local" | Select-Object Name

# Uso de variable
$OUactual = Get-ADOrganizationalUnit -Filter {Name -eq "eso"}

$OUactual

# Modificar una OU; en el ejemplo se le pone la protección, aunque ya la tenía
Set-ADOrganizationalUnit -Identity $OUactual -ProtectedFromAccidentalDeletion $true -PassThru

# Renombrar (la variable de antes ya no valdría porque guarda el nombre antiguo)
Rename-ADObject -Identity $OUactual -NewName "Secundaria"


# Mover
Move-ADObject -Identity "OU=Secundaria,DC=ciclo,DC=local" -TargetPath "CN=Users,DC=ciclo,DC=local"
# Así da acceso denegado; para mover hay que hacer dos cosas: 
# 1º cambiar la protección:
Set-ADOrganizationalUnit -Identity "OU=Secundaria,DC=ciclo,DC=local" -ProtectedFromAccidentalDeletion $false -PassThru
# esto salió mal y ahí quedó


# Creamos una OU
New-ADOrganizationalUnit -Name "Bach" -Path "0U=Secundaria,DC=ciclo,DC=local"

New-ADOrganizationalUnit -Name "Bach2" -Path "OU=bach,0U=Secundaria,DC=ciclo,DC=local"

# Esto no se si está bine
Set-ADOrganizationalUnit -Identity "OU=bach,0U=Secundaria,DC=ciclo,DC=local" -ProtectedFromAccidentalDeletion $false -PassThru


# El caso es que se le quita la protección, se le mueve, y se le vuelve a poner la protección

################################### Día 2

Get-ADOrganizationalUnit -SearchBase "DC=ciclo,DC=local" -Filter * -Properties * | Select-Object Name,ProtectedFromAccidentalDeletion
# Habíamos probado el día 1 que esto no nos mostraba nada; lo que pasaba es que con un filtro ya es suficiente; todas las otras propiedades que está como escondidas, hay que hacer algo para que salgan, como la de protectedfromaccidentaldeletion; y como no es una propiedad normal, hay que decirle que añada todas las demás propiedades. De ahí el -properties *.

# Eliminar una OU
# Primero se le quita la protección
Set-ADOrganizationalUnit  -Identity "OU=bach1,0U=alumnos,DC=ciclo,DC=local" -ProtectedFromAccidentalDeletion $false -PassThru
# Luego se  
Remove-ADOrganizationalUnit -Identity "OU=bach1,0U=alumnos,DC=ciclo,DC=local" 
# o
Remove-ADObject -Identity "OU=bach1,0U=alumnos,DC=ciclo,DC=local" 
# Cualquiera de los dos vale, igual que con el Rename-

# Si quisiesemos elimnar el bach, que tiene bach1 y bach2, habría que añadir una recursiva
Remove-ADOrganizationalUnit -Identity "OU=bach,0U=alumnos,DC=ciclo,DC=local" -Recursive

#########Grupos y Miembros

New-ADGroup -Name "g-medio" -Path "CN=Users,DC=ciclo,DC=local" -GroupCategory -Security -GroupScope DomainLocal -PassThru

# todos los nuestros van a ser de categoría seguridad, los de distribución se usan para correo y demás; el groupscope es hasta dónde se limita
# El SID es la identificación del bjeto entre todos los objetos

Get-ADGroup -Identity 'g-medio'
# no deja meter -Name, pero el nombe parece que lo pilla con el identity, que en principio debe ser para el SID

Get-ADGroup -Filter *
#Consultamos todos los grupos que hay


Get-ADGroup -Filter * -Properties * | Select-Object name,groupcategory,groupscope,distinguishedname
#Consultamos todos los grupos que hay

# Modificar Grupos
Set-ADGroup -Identity "g-medio" -Description "grupo de alumnos del medio" -PassThru

Get-ADGroup -Filter * -Properties * | Select-Object name,Description

Get-ADGroup -Filter * -SearchBase "CN=users,DC=ciclo,DC=local"
# todos los grupos de users

Get-ADGroup -Filter {Name -like 'prueba*'} -SearchBase "CN=users,DC=ciclo,DC=local" | Select-Object name



# Modificar los grupos de prueba con un foreach

$grupos = Get-ADGroup -Filter {Name -like 'prueba*'} -SearchBase "CN=users,DC=ciclo,DC=local" | Select-Object distinguishedname

$grupos

foreach ($i in $grupos){
    Set-ADGroup $i -Description "Grupo de prueba - no borrar"
}

Get-ADGroup -Filter {Name -like 'prueba*'} -SearchBase "CN=users,DC=ciclo,DC=local" -Properties *| Select-Object name,Description


# Modificar los grupos a través de una consulta

Get-ADGroup -Filter {Name -like 'prueba*'} -SearchBase "CN=users,DC=ciclo,DC=local" | Set-ADGroup -Description "grupo de pueba, no borrar"



# Añadir miembros
Add-ADGroupMember -Identity "prueba-01" -Members p.picapiedra,v.picapiedra

Get-ADGroupMember -Identity "prueba-01" | Select-Object distinguishedname

# Quitarlos
Remove-ADGroupMember -Identity "prueba-01" -Members p.picapiedra

Get-ADGroupMember -Identity "prueba-01" | Remove-ADGroupMember -Members v.picapiedra

# Renombrar grupo con consulta
Get-ADGroup -Identity "prueba-01" | Rename-ADObject -NewName "prueba-04"


########################## Día 3 que falté

#Apuntes de cando faltou o FELIPE !!!!
#Usuarios

#Creacion de usuarios#
New-AdUser -Path "OU=profes,DC=ciclo,DC=local"`
-Name "Juan Morales"`
-GivenName "Juan"`
-Surname "Morales"`
-SammAcountName "j.morales"`
-UserPrincipalName "j.morales@ciclo.local"`
-EmailAddress "j.morales@ciclo.local"`
-Title "Profesor"`
-AccountPassword (ConvertTo-SecureString -string "abc123." -AsplainText -Force)`
-Enable $true

#Mini glosario
#GivenName - Primer nombre
#Surname - Segundo Nombre
#SammAcountName como se loggea
#UserPrincipalName - Outra maneira de conectarse Seria co Sammacount
#IMPORTANTE COLOCAR AS COMAS FRANCESAS#
#LAS COMILLAS TIENEN QUE ESTAR SIN ESPACIO

#Añadirlle cosas al usuario

set-AdUser "CN=Ana Alvarez,OU=profesores,DC=ciclo,Dc=local" -Department "informatica" -City "Negreira"


#Despois revisar por interfaz gráfica

#Modificacion del objeto
set-AdUser "CN=Ana Alvarez,OU=profesores,DC=ciclo,Dc=local" -Department "informatica" -City "Negreira" -ProtectedFromAccidentalDeletion

#Por data de expiracion cuenta

Set-ADAccountExpiration a.alvarez -DataTime(GetDate).AddYears(1)
#cambiar cuenta

Set-ADAccountPassword -Reset -NewPassword(ConvertTo-SecureString) "qwe123-" -AsplainText -force

#Añadir a grupo
Add-ADGroupMember profes -Members a.alvarez

#Mover
#1Primero quitar la proteccion de borrado
#2Acordase de activarla al rematar
MOVE-ADObject "CN=Ana alvarez,OU=profes,DC=ciclo,DC=local" -TargetPath "CN=Users,Dc=ciclo,Dc=local"

#Desabilitar cuenta

Disable-ADAccount a.alvarez -PassThru

#Habilitar una cuenta

Enable-ADAccount a.alvarez -PassThru

#############################

########################## Día 4

# Quitar un user de un grupo
Remove-ADGroupMember profes -Members a.alvarez
Remove-ADGroupMember profes -Members a.alvarez,p.picapiedra


# Quitar user de grupo mediante consulta
Get-ADGroup profes | Remove-ADGroupMember -Members a.alvarez

# 
Get-ADUser -Filter {Name -like "ana alv*"} | Remove-ADObject
# y estaría protegida así que no dejaría eliminarlo, habría que desprotegerlo


# equipos
# Crear un nuevo equipo
New-ADComputer -Name "w10-05" -Path "CN=computer,DC=ciclo,DC=local"


# Consultar equipo
Get-ADComputer -Filter * | Select-Object Name,distinguishedname

# Modificar equipos
Set-ADComputer -Identity "w10-05" -Description "cliente windows 10" -Enabled $true -DisplayName "PC05"
# Podemos habilitar o deshabilitar el equipo por defecto; igual quiero que nadie use ese equipo porque tengo que reparar algo y lo deshabilito


Get-ADComputer -Filter * -Properties *| Select-Object Name,distinguishedname,Description
# Si quieres ver la descripción hay que indicarle lo de -properties *, porque es de las propiedades avanzadas


Get-ADComputer -Filter {Name -like "*05"} | Select-Object Name
# Para buscar el equipo 5


# Eliminar el equipo con una consulta
Get-ADComputer -Filter {Name -like "*05"} | Remove-ADObject


# Si lo hago así necesito la identidad, y el nombre distinguido, que es más jaleo
Remove-ADObject -Identity [...]





