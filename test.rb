require "./validation.rb"

class Person
  include Validation

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def check(type = 'normal')
    validate(@name, presence: true, format: /[a-zA-Z]/, type: String)
    if type == 'fast'
      valid?
    else
      validate!
    end
  end

  def wrong_check
    validate(@name, color: 'red', status: 'human', age: 31)
    validate!
  end
end

pers1 = Person.new('Karl')
puts "Person's name: #{pers1.name}"
puts "Normal check #{pers1.check}"
puts "Fast check #{pers1.check('fast')}"
puts "Wrong check #{pers1.wrong_check}"

pers2 = Person.new('terminator3000')
puts "Person's name: #{pers2.name}"
puts "Normal check #{pers2.check}"
puts "Fast check #{pers2.check('fast')}"
puts "Wrong check #{pers2.wrong_check}"

pers3 = Person.new('32526264426')
puts "Person's name: #{pers3.name}"
puts "Normal check #{pers3.check}"
puts "Fast check #{pers3.check('fast')}"
puts "Wrong check #{pers3.wrong_check}"