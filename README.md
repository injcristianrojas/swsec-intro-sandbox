# Sandbox para SWSEC-Intro

## Introducción

El presente proyecto consiste en una máquina virtual linux que contendrá el
proyecto [SWSEC-Intro](https://github.com/injcristianrojas/swsec-intro).
Esta máquina tiene el objeto de ser utilizada como parte de un curso de
Seguridad de Software.

## Requerimientos del sistema

Para su ejecución, se requiere tener instalado el siguiente software:

* VirtualBox
* Vagrant

Ambos software se encuentran disponibles tanto para Windows, como para
Mac,como para Linux.

### Windows

Para instalar VirtualBox en Windows, bájelo desde
<http://www.virtualbox.org>. Para instalar Vagrant, baje el paquete
.msi desde <http://downloads.vagrantup.com/>.

### Linux

Las instrucciones aquí indicadas son para Ubuntu. Para otras distribuciones
Linux utilice el sistema de paquetes que estas provee. Instale VirtualBox
y Ruby utilizando desde la linea de comandos
`sudo apt-get install virtualbox rubygems`. Terminado ese proceso,
instale Vagrant utilizando `gem install vagrant`. 

### Mac

Para instalar VirtualBox en Mac, bájelo desde <http://www.virtualbox.org>.
Si ruby se encuentra instalado
en su equipo, instale Vagrant utilizando `gem install vagrant`. Si no
está, baje el paquete .dmg desde
<http://downloads.vagrantup.com/>.

## Instalación de la máquina virtual

En un directorio de su máquina, escriba

    git clone git://github.com/injcristianrojas/swsec-intro-sandbox.git

Esto generará un directorio llamado `swsec-sandbox`. Ingrese a él y
baje allí la máquina virtual
base Ubuntu Precise (32 bits) desde
<http://files.vagrantup.com/precise32.box>.
Ya estando lista la máquina virtual base, agréguela a Vagrant escribiendo

    vagrant box add precise32 precise32.box

Ya estando agregada la máquina virtual, lo que resta es prepararla. Escriba

    vagrant up

Con eso comenzará el proceso de aprovisionamiento. La máquina se encenderá
y empezará a bajar
el software que necesita para funcionar. Cuando termine este proceso, escriba

    vagrant ssh

y tendrá acceso a la máquina. Para detenerla Usted puede pausarla o
apagarla por completo. Si
desea pausarla haga `vagrant suspend`. Para iniciarla de nuevo escriba
`vagrant resume`. Si desea
apagarla escriba `vagrant halt`, y para reiniciarla escriba
`vagrant reload --no-provision`

## Uso de la máquina virtual

La dirección IP de la máquina virtual es 33.33.33.100. Dado que la máquina
virtual utiliza Gradle en vez de Maven, se deben usar los siguientes
comandos:

### Pruebas de Integración

Para verificar de que todo está en orden en la aplicación, ejecutar:

    gradle IntegrationTest

Este proceso ya se ejecutó en el aprovisionamiento, así que no es tan
necesario de ejecutar.

### Ejecución del servidor

Para esto, simplemente escriba:

    gradle jettyRun

Esto ejecutará el servidor Jetty con la aplicación en http://localhost:8080
en forma interna. Para acceder desde afuera, use http://33.33.33.100:8000.
Para detener el servidor, presione `Ctrl-C`
