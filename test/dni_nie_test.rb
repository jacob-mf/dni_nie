# -*- coding: utf-8 -*-
require 'minitest/spec'
require 'minitest/pride'
require 'minitest/autorun'
require 'dni_nie'
# @author Luis Jacob Mariscal Fernández

describe DniNie do   # test module DniNie
  it 'debe devolver la letra de control válida | should return a valid control digit' do
    ci = '678989Y'
    assert 'Y', DniNie.get_control_letter(ci)

    ci = '79297879'
    assert 'V', DniNie.control_digit(ci)
    
    doc = '0-0/011/'
    assert 'T', DniNie.control_digit(doc)
  end

  it 'debe validar documentos oficiales | should validate official document id.' do
    doc = '678989Y'
    assert DniNie.validate(doc)
  end

  it 'debe validar números que incluyan puntos o guiones | should validate numbers even when using dots and dashes' do
     doc = '678989-.Y'
    assert DniNie.validate_doc(doc)
 
     doc = '0-0/011/B'
     assert DniNie.validar_doc(doc)
     
     doc = '00-0/12/N'
     assert DniNie.validar(doc)
  end

  it 'debe fallar al recibir números de identificación no válidos | should not validate wrong id numbers' do
    doc = '11112221V'
    assert !DniNie.validate_doc(doc)
  end

  it 'debe generar DNI/NIE(s) válidos | should get a valid random dni/nie ids' do
    doc = DniNie.get_random_dni
    assert DniNie.validate_doc(doc)
    doc = DniNie.get_random_nie
    assert DniNie.validate_doc(doc)
    doc = DniNie.num_id_extranjero
    assert DniNie.validate_doc(doc)
  end

  it 'debe validar documentos de 6 cifras | should validate dni with 6 digits' do
    doc = '3949383F'
    assert DniNie.validar_doc(doc)
  end

  it 'debe de aceptar enteros como entrada | should accept integers as input' do
     doc = 51_691_703
     assert DniNie.letra(doc)
   end

 
end
