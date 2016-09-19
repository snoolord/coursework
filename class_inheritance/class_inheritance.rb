require 'byebug'

class Employee
  attr_reader :salary, :title

  def initialize(title, salary, boss)
    @title = title
    @salary = salary
    @boss = boss
    @boss.add_subordinates(self) unless @boss.nil?
  end

  def bonus(multiplier)
    return @salary * multiplier
  end

end

class Manager < Employee
  def initialize(title, salary, boss, subordinates = [])
    # debugger
    @subordinates = subordinates
    p @subordinates
    super(title,salary,boss)
  end

  def add_subordinates(employee)
    @subordinates << employee # if employee.boss == self
  end

  def bonus(multiplier)
    bonus = 0
    @subordinates.each do |sub|
      if sub.is_a?(Manager)
        bonus += sub.salary * multiplier
        bonus += sub.bonus(multiplier)
      else
        bonus += sub.bonus(multiplier)
      end
    end
    bonus
  end
end

# ned = Manager.new("Founder", 1000000, nil)
