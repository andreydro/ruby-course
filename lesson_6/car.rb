class Car
  attr_reader :current_rpm
  attr_accessor :number

  NUMBER_FORMAT = /^[а-яА-Я]{1}\d{3}[а-яА-Я]{2}$/ 

  @@instances = 0

  def self.instances
    @@instances
  end

  def initialize(number)
    @current_rpm = 0
    @number = number
    @@instances += 1
    validate!
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    current_rpm.zero?
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  attr_writer :current_rpm

  def validate!
    raise "Number can't be nill" if number.nil?
    raise "Number should be at least 6 symbols" if number.length < 6
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
    true
  end

  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end
  # stop engine
end