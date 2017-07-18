#!/usr/bin/ruby
# -*- coding: utf-8 -*-

# @title dni_nie module 
# Los DNI's (Documento Nacional de Identidad) se componen de 8 dígitos y una letra de control
# | DNI's (Document National Identity) are compound of 8 numbers and a control digit
# Los NIE's de extranjeros residentes en España tienen una letra (X, Y, Z), 7 números y dígito de control.
# | NIE's (foreigner number id.) are compound of a letter (X, Y, Z) first , then 7 digits and a control letter at the end.
#Gem name 	Require statement 	Main class or module
#ruby_parser 	require 'ruby_parser' 	RubyParser
# dni_nie        require 'dni_nie'        DniNie
# RESTO | MOD 	    0 	1 	2 	3 	4 	5 	6 	7 	8 	9 	10 	11
# LETRA | LETTER	T 	R 	W 	A 	G 	M 	Y 	F 	P 	D 	X 	B
# RESTO | MOD   	12 	13 	14 	15 	16 	17 	18 	19 	20 	21 	22
# LETRA | LETTER	N 	J 	Z 	S 	Q 	V 	H 	L 	C 	K 	E
# X → 0 ,Y → 1, Z → 2
# más información | more info DNI-NIE http://www.interior.gob.es/web/servicios-al-ciudadano/dni/calculo-del-digito-de-control-del-nif-nie (Spanish)
# @version 0.3.8
# @author Luis Jacob Mariscal Fernández

module DniNie

# LETRA contiene los valores de la 1era letra del NIE | contains the NIE value of 1st letter.
 LETRA = {
  0 => 'X', # keys => values
  1 => 'Y',
  2 => 'Z',
  3 => 'A',
  4 => 'G',
  'X' => 0,
  'Y' => 1,
  'Z' => 2
} #puts LETRA[4]  #test hash letras

# CODIGO contiene la letra asociado al resto del numero | stores the mod code (control letter) of the number.
CODIGO = 'TRWAGMYFPDXBNJZSQVHLCKE' # contiene la letra asociada a cada resto.

# Transforma la entrada a número de identificación formateado | Converts the entry into id specific format.
#
# @param transforma [Número|Cadena] a formato útil (sin 0s superflúos ni caracteres innecesarios) | transform [Number|String] to the valid format type (erase extra 0s, not allowed chars)
# @return [String] the object converted into the expected format.
# @raise Entrada errónea | Wrong entry
# si la entrada es mayor de 8 caracteres | if the entry is longer than 8 chars
protected 
def self.transform(doc) # da formato conveniente a la entrada
 doc = doc.to_s if doc.is_a? Integer
 doc[0] = '1' if (doc[0] == 'y') or ( doc[0] == 'Y')
 doc[0] = '2' if doc[0] == 'Z' or  (doc[0] == 'z')
 doc[0] = ''  if doc[0] == 'X' or  doc[0] == 'x'
#p doc
 if doc.length > 8 
      raise ArgumentError, "Entrada errónea, número de identificación demasiado grande | Wrong identification number, too long"
 end
 doc.gsub!(/\D/, '') # expresión regular, parece que elimina lo que no sea dígitos
 #DONE check if sth included not a digit 
 while doc[0] == '0' and (doc.length > 1) # elimina 0s superfluos
  doc[0] = ''
 end
 doc
end


# Calcula la letra de control para el número de identificación dado  | Generate the entry id control letter.
#
# @param calcula para entrada [Número|Cadena] la letra de control asociada | yield for [Number|String] the control letter associated.
# @return [String] letra de control de la entrada | the requested control letter of the entry.
public 
def self.letra(num) # letra o digito  de control del DNI/NIE
    num = transform(num)
    #doc = '0' + doc if doc.size == 6
    #a = 0  
    CODIGO[(num.to_i % 23)].to_s
end

# Valida el documento de identificación dado  | Validate the entry id document.
#
# @param verifica si la entrada [Número|Cadena] es número de documento válido | check if entry [Number|String] is a valid document id.
# @return [Boolean] indica si válida la entrada | the entry validation return (true/flase).
def self.validate_doc(ci) # validar documento
  raise ArgumentError, "Entrada errónea, número de identificación debe ser una cadena | Wrong entry, must be a String" unless ci.is_a? String
  dig = ci[-1]
  ci = ci[0..-2]
  ci = transform(ci)
  #p dig
  #p letra(ci)
  #p ci
  letra(ci) == dig.upcase # pone en Mayúsculas
end

# Genera el documento nacional de identidad aleatorio | Creates a random valid Spanish national id document.
#
# @param ninguno | none
# @return [String] DNI aleatorio | random DNI document.
def self.get_random_dni # genera dni aleatorio
    dni = rand(0..89999999).to_s # límite en 89 millones, no se sabe de mayor a la fecha
    dni += letra(dni)
    dni
end
# Genera un número de identificación del extranjero NIE aleaotorio | Creates a random valid Spanish foreigner id document.
#
# @param ninguno | none
# @return [String] NIE aleatorio | random NIE document.
def self.get_random_nie # genera nie aleatorio
    #nie = LETRA[(rand(0..2))] ++ rand(0..9_999_999).to_s #parece que siempre asigna millones
    nie = LETRA[(rand(0..2))] + rand(0..9999999).to_s # why ++ ?
    #p nie
    letra = letra(nie.dup)
    nie += letra
    nie
end

 class << self  # alias de métodos | methods alias
   alias_method :get_control_letter, :letra
   alias_method :control_letter, :get_control_letter
   alias_method :control_digit, :get_control_letter
   alias_method :validate , :validate_doc 
   alias_method :validar , :validate  
   alias_method :validar_doc , :validate_doc 
   alias_method :random_dni, :get_random_dni
   alias_method :random_nie, :get_random_nie
   alias_method :generar_dni, :get_random_dni
   alias_method :new_dni, :get_random_dni
   alias_method :dni, :get_random_dni
   alias_method :new_nie, :get_random_nie
   alias_method :generar_nie, :get_random_nie
   alias_method :nie, :get_random_nie   
 end
end 
