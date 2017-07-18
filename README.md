# DNI_NIE
[![Gem Version](https://badge.fury.io/rb/dni_nie.svg)](https://badge.fury.io/rb/dni_nie)
[![Build Status](https://travis-ci.org/jacob-mf/dni_nie.svg?branch=master)](https://travis-ci.org/jacob-mf/dni-nie)
[![Code Climate](https://codeclimate.com/github/jacob-mf/dni_nie/badges/gpa.svg)](https://codeclimate.com/github/jacob-mf/dni_nie)


Gema para validar/generar documentos de identidad de España | A gem to validate/generate Spanish Identity Documents
  https://rubygems.org/gems/dni_nie
Inspirado y dedicado a Fernando Briano, por su proyecto http://picandocodigo.net/2013/validacion-de-la-cedula-de-identidad-uruguaya-en-ruby/ |
Inspired and dedicated to Fernando Briano, and also to you and the Guadalinex users
Dedicado también a ti y la comunidad de Guadalinex http://www.guadalinex.org/participa/foros/  http://guadausers.tk/

Instalación: | Install:

```bash
$ gem install dni_nie
```

Uso | Usage:
``` ruby
luis@pc ~ $ rake console
irb(main):001:0> DniNie.validar "678989L"
 => false
irb(main):002:0> DniNie.letra "678989"
 => "Y"
irb(main):002:0> DniNie.validate_doc "678989Y"
 => "true" 
irb(main):004:0> DniNie.random_dni
 => "55428494N"
 ```

Una vez instalada la gema se puede usar directamente desde la línea de
 comandos | Once the gem is installed in your system, you can also 
use 'dni_nie' from the command line:

```bash
$ gem install dni_nie
Thanks for installing DniNie!
Successfully installed dni_nie
1 gem installed

$ dni_nie random_nie
"Z6767371V"
$ dni_nie validar "678989Y"
true
$ dni_nie control_letter 678989
Y
 ```

## LICENSE
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
