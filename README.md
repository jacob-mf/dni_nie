# DNI_NIE


Gema para validar/generar documentos de identidad de España | A gem to validate/generate Spanish Identity Documents
  https://rubygems.org/gems/dni_nie

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

Once the gem is installed in your system, you can also use 'dni_nie'
from the command line:

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
